import { test } from "node:test";
import assert from "node:assert/strict";
import { seed } from "./seed";
import { execute, validateBackup } from "./engine";
import {
  balance,
  can,
  eligibility,
  reserved,
  type State,
  type Trip,
} from "./model";
const owner = "staff-owner";
function book(s = seed(), method = "Cash") {
  s = execute(s, owner, {
    type: "tripCreate",
    data: {
      customerId: "CUS-0002",
      pickup: "Bole Bulbula",
      destination: "Piassa",
      vehicleClass: "Standard",
      distance: 7,
      minutes: 17,
      method,
    },
  });
  return { s, id: s.trips[0].id };
}
function complete(s: State, id: string) {
  s = execute(s, owner, {
    type: "tripAssign",
    id,
    data: { driverId: "DRV-008" },
    reason: "Test dispatch assignment",
  });
  for (let i = 0; i < 4; i++)
    s = execute(s, owner, { type: "tripAdvance", id });
  return s;
}
test("connected seed has valid relationships and commission totals match settled trips", () => {
  const s = seed();
  validateBackup(s);
  assert.equal(
    s.ledger
      .filter((l) => l.account === "commission")
      .reduce((a, l) => a + l.amount, 0),
    s.trips.filter((t) => t.settled).reduce((a, t) => a + t.commission, 0),
  );
});
test("restricted operator cannot change pricing or financial state", () => {
  const s = seed();
  assert.throws(
    () =>
      execute(s, "staff-operator", {
        type: "pricingSave",
        data: { base: 1 },
        reason: "Unauthorized edit",
      }),
    /role/,
  );
  assert.throws(
    () =>
      execute(s, "staff-operator", {
        type: "financeApprove",
        id: "FIN-1001",
        reason: "Unauthorized credit",
      }),
    /role/,
  );
  assert.equal(s.pricing.base, 8000);
});
test("first reviewer cannot also approve; another account approves same evidence", () => {
  let s = seed();
  assert.throws(
    () =>
      execute(s, "staff-review", {
        type: "driverReview",
        id: "DRV-001",
        data: { decision: "Approve" },
        reason: "Approve application",
      }),
    /role/,
  );
  s = execute(s, owner, {
    type: "driverReview",
    id: "DRV-002",
    data: { decision: "First review" },
    reason: "Documents inspected",
  });
  assert.throws(
    () =>
      execute(s, owner, {
        type: "driverReview",
        id: "DRV-002",
        data: { decision: "Approve" },
        reason: "Self approval attempt",
      }),
    /different staff/,
  );
  s = execute(s, "staff-approve", {
    type: "driverReview",
    id: "DRV-002",
    data: { decision: "Approve" },
    reason: "Independent final approval",
  });
  assert.equal(s.drivers[1].status, "Approved");
});
test("missing documents and failed inspection block first review", () => {
  assert.throws(
    () =>
      execute(seed(), owner, {
        type: "driverReview",
        id: "DRV-003",
        data: { decision: "First review" },
        reason: "Review incomplete file",
      }),
    /required/,
  );
});
test("changed evidence resets previous review and prevents final approval", () => {
  let s = seed();
  s = execute(s, owner, {
    type: "driverEvidence",
    id: "DRV-001",
    data: { document: "Identification" },
    reason: "Replacement sample ID",
  });
  assert.equal(s.drivers[0].status, "Submitted");
  assert.equal(s.drivers[0].firstReviewer, undefined);
  assert.throws(
    () =>
      execute(s, "staff-approve", {
        type: "driverReview",
        id: "DRV-001",
        data: { decision: "Approve" },
        reason: "Review changed evidence",
      }),
    /after first review/,
  );
});
test("newly expired document invalidates second approval", () => {
  const s = seed();
  s.drivers[0].documents[0].expires = "2020-01-01";
  assert.throws(
    () =>
      execute(s, "staff-approve", {
        type: "driverReview",
        id: "DRV-001",
        data: { decision: "Approve" },
        reason: "Independent review",
      }),
    /valid dates/,
  );
});
test("low balance blocks jobs and independent top-up approval restores eligibility", () => {
  let s = seed();
  const d = s.drivers[5];
  assert.equal(eligibility(s, d), "Insufficient prepaid credit");
  assert.throws(
    () =>
      execute(s, "staff-review", {
        type: "financeApprove",
        id: "FIN-1001",
        reason: "Self credit",
      }),
    /role/,
  );
  s = execute(s, owner, {
    type: "financeApprove",
    id: "FIN-1001",
    reason: "Deposit evidence confirmed",
  });
  assert.equal(balance(s, d.id), 50500);
  assert.equal(eligibility(s, s.drivers[5]), "");
  assert.throws(
    () =>
      execute(s, owner, {
        type: "financeApprove",
        id: "FIN-1001",
        reason: "Duplicate credit",
      }),
    /already been reviewed/,
  );
});
test("cash assignment reserves commission; reassignment moves it atomically", () => {
  let { s, id } = book();
  s = execute(s, owner, {
    type: "tripAssign",
    id,
    data: { driverId: "DRV-008" },
    reason: "Initial assignment",
  });
  assert.equal(reserved(s, "DRV-008"), s.trips[0].commission);
  s = execute(s, owner, {
    type: "tripAssign",
    id,
    data: { driverId: "DRV-016" },
    reason: "Driver requested reassignment",
  });
  assert.equal(reserved(s, "DRV-008"), 0);
  assert.equal(reserved(s, "DRV-016"), s.trips[0].commission);
});
test("one driver cannot accept two simultaneous jobs", () => {
  let { s, id } = book();
  s = execute(s, owner, {
    type: "tripAssign",
    id,
    data: { driverId: "DRV-008" },
    reason: "First assignment",
  });
  const second = book(s);
  assert.throws(
    () =>
      execute(second.s, owner, {
        type: "tripAssign",
        id: second.id,
        data: { driverId: "DRV-008" },
        reason: "Conflicting assignment",
      }),
    /On a job/,
  );
});
test("cancelled trip releases credit and never earns a commission", () => {
  let { s, id } = book();
  s = execute(s, owner, {
    type: "tripAssign",
    id,
    data: { driverId: "DRV-008" },
    reason: "Initial assignment",
  });
  s = execute(s, owner, {
    type: "tripCancel",
    id,
    reason: "Customer cancelled request",
  });
  assert.equal(s.trips[0].fare, 0);
  assert.equal(reserved(s, "DRV-008"), 0);
  assert.equal(s.ledger.filter((l) => l.tripId === id).length, 0);
});
test("pricing changes apply prospectively and preserve saved commission", () => {
  const first = book();
  const originalFare = first.s.trips[0].fare;
  {
    const s = execute(first.s, owner, {
      type: "pricingSave",
      data: { base: 10000, commissionPercent: 20 },
      reason: "New commercial version",
    });
    assert.equal(s.trips[0].fare, originalFare);
    assert.equal(s.trips[0].commissionPercent, 10);
    const second = book(s);
    assert.equal(second.s.trips[0].commissionPercent, 20);
    assert.equal(second.s.trips[0].pricingVersion, 2);
  }
});
test("cash completion deducts commission once and remains unpaid until collection recorded", () => {
  const first = book();
  const before = balance(first.s, "DRV-008");
  let s = complete(first.s, first.id);
  const t = s.trips[0];
  assert.equal(t.payment, "Unpaid");
  assert.equal(balance(s, "DRV-008"), before - t.commission);
  const count = s.ledger.length;
  s = execute(s, owner, { type: "tripAdvance", id: first.id });
  assert.equal(s.ledger.length, count);
  s = execute(s, owner, {
    type: "tripPayment",
    id: first.id,
    data: { outcome: "Success", channel: "External transfer to driver" },
    reason: "Driver reported collection",
  });
  assert.equal(s.trips[0].payment, "Collected");
  assert.equal(balance(s, "DRV-008"), before - t.commission);
  assert.equal(balance(s, "DRV-008", "payable"), 0);
});
test("Chapa completion waits for outcome; success withholds commission without wallet debit", () => {
  const first = book(seed(), "Chapa");
  const before = balance(first.s, "DRV-008");
  let s = complete(first.s, first.id);
  assert.equal(s.trips[0].payment, "Pending");
  assert.equal(s.ledger.filter((l) => l.tripId === first.id).length, 0);
  s = execute(s, owner, {
    type: "tripPayment",
    id: first.id,
    data: { outcome: "Success" },
    reason: "Simulated provider verification",
  });
  const t = s.trips[0];
  assert.equal(balance(s, "DRV-008"), before);
  assert.equal(balance(s, "DRV-008", "payable"), t.fare - t.commission);
  const again = execute(s, owner, {
    type: "tripPayment",
    id: first.id,
    data: { outcome: "Success" },
    reason: "Duplicate provider event",
  });
  assert.equal(again.ledger.length, s.ledger.length);
});
test("independent financial approval and payout reservations prevent double spending", () => {
  const first = book(seed(), "Chapa");
  let s = complete(first.s, first.id);
  s = execute(s, owner, {
    type: "tripPayment",
    id: first.id,
    data: { outcome: "Success" },
    reason: "Verified sample payment",
  });
  const payable = balance(s, "DRV-008", "payable");
  s = execute(s, owner, {
    type: "financeRequest",
    data: { type: "Payout", driverId: "DRV-008", amount: payable },
    reason: "Payout batch request",
  });
  const id = s.requests[0].id;
  assert.throws(
    () =>
      execute(s, owner, {
        type: "financeApprove",
        id,
        reason: "Same actor approval",
      }),
    /different staff/,
  );
  assert.throws(
    () =>
      execute(s, owner, {
        type: "financeRequest",
        data: { type: "Payout", driverId: "DRV-008", amount: 1 },
        reason: "Another payout batch",
      }),
    /unreserved/,
  );
  s = execute(s, "staff-finance", {
    type: "financeApprove",
    id,
    reason: "Independent payout review",
  });
  s = execute(s, "staff-finance", {
    type: "financeExecute",
    id,
    data: { success: true },
    reason: "Confirmed simulated transfer",
  });
  assert.equal(balance(s, "DRV-008", "payable"), 0);
  assert.throws(
    () =>
      execute(s, "staff-finance", {
        type: "financeExecute",
        id,
        data: { success: true },
        reason: "Duplicate execution",
      }),
    /Approve/,
  );
});
test("cash refunds require execution and do not create automatic unrelated wallet credit", () => {
  const first = book();
  let s = complete(first.s, first.id);
  s = execute(s, owner, {
    type: "tripPayment",
    id: first.id,
    data: { outcome: "Success" },
    reason: "Cash collection reported",
  });
  const before = balance(s, "DRV-008");
  s = execute(s, owner, {
    type: "financeRequest",
    data: {
      type: "Refund",
      driverId: "DRV-008",
      tripId: first.id,
      amount: 5000,
    },
    reason: "Partial refund requested",
  });
  const id = s.requests[0].id;
  s = execute(s, "staff-finance", {
    type: "financeApprove",
    id,
    reason: "Refund independently approved",
  });
  assert.equal(s.trips[0].refundAmount, 0);
  s = execute(s, "staff-finance", {
    type: "financeExecute",
    id,
    data: { success: true },
    reason: "Driver confirmed cash returned",
  });
  assert.equal(s.trips[0].refundAmount, 5000);
  assert.equal(balance(s, "DRV-008"), before);
  assert.throws(
    () =>
      execute(s, owner, {
        type: "financeRequest",
        data: {
          type: "Refund",
          driverId: "DRV-008",
          tripId: first.id,
          amount: s.trips[0].fare,
        },
        reason: "Excess refund request",
      }),
    /remaining/,
  );
});
test("OTP proof requires correct unused unexpired code and collected status", () => {
  let s = seed();
  const d = s.deliveries.find((x) => x.status === "Collected")!;
  assert.throws(
    () =>
      execute(s, owner, {
        type: "deliveryUpdate",
        id: d.id,
        data: { action: "Verify OTP", otp: "000000" },
      }),
    /Incorrect/,
  );
  s = execute(s, owner, {
    type: "deliveryUpdate",
    id: d.id,
    data: { action: "Verify OTP", otp: d.otp },
  });
  assert.equal(s.deliveries.find((x) => x.id === d.id)!.status, "Delivered");
  assert.ok(s.deliveries.find((x) => x.id === d.id)!.proof);
  assert.throws(
    () =>
      execute(s, owner, {
        type: "deliveryUpdate",
        id: d.id,
        data: { action: "Verify OTP", otp: d.otp },
      }),
    /Collect/,
  );
});
test("last owner is protected and custom role managers cannot create owners", () => {
  let s = seed();
  assert.throws(
    () =>
      execute(s, owner, {
        type: "staffSave",
        id: owner,
        data: {
          name: "Owner",
          email: "owner@demo.local",
          roleId: "owner",
          active: false,
        },
        reason: "Deactivate final owner",
      }),
    /at least one/,
  );
  s.roles.push({
    id: "limited",
    name: "Limited role manager",
    permissions: ["staff.create", "staff.roles"],
  });
  s.staff.push({
    id: "limited-staff",
    name: "Limited staff",
    email: "limited@demo.local",
    roleId: "limited",
    active: true,
  });
  assert.throws(
    () =>
      execute(s, "limited-staff", {
        type: "staffSave",
        data: { name: "New owner", email: "new@demo.local", roleId: "owner" },
        reason: "Unauthorized owner grant",
      }),
    /Only an owner/,
  );
  assert.throws(
    () =>
      execute(s, "limited-staff", {
        type: "roleSave",
        data: { name: "Finance access", permissions: ["finance.simulate"] },
        reason: "Unauthorized permission grant",
      }),
    /beyond/,
  );
});
test("backup validation rejects broken relationships and missing owner", () => {
  const s = seed();
  s.trips[0].customerId = "missing";
  assert.throws(() => validateBackup(s), /relationships/);
  const noOwner = seed();
  noOwner.staff[0].active = false;
  assert.throws(() => validateBackup(noOwner), /owner/);
});
test("restaurant approval uses a separate approver and audit records the chain", () => {
  let s = seed();
  s = execute(s, owner, {
    type: "restaurantReview",
    id: "RES-2",
    data: { step: "First review", documents: true },
    reason: "Restaurant documents checked",
  });
  assert.throws(
    () =>
      execute(s, owner, {
        type: "restaurantReview",
        id: "RES-2",
        data: { step: "Approve" },
        reason: "Self approval",
      }),
    /different approver/,
  );
  s = execute(s, "staff-approve", {
    type: "restaurantReview",
    id: "RES-2",
    data: { step: "Approve" },
    reason: "Independent restaurant approval",
  });
  assert.equal(s.restaurants[1].status, "Approved");
  assert.equal(s.audit[0].actorId, "staff-approve");
  assert.equal(s.audit[0].entity, "RES-2");
});

test("negative driver recovery balance blocks a new dispatch", () => {
  const { s, id } = book();
  s.ledger.push({
    id: "RECOVERY-TEST",
    driverId: "DRV-008",
    account: "payable",
    amount: -100,
    kind: "Refund recovery",
    reference: "TEST",
    date: new Date().toISOString(),
  });
  assert.equal(
    eligibility(s, s.drivers.find((d) => d.id === "DRV-008")!),
    "Outstanding recovery balance",
  );
  assert.throws(
    () =>
      execute(s, owner, {
        type: "tripAssign",
        id,
        data: { driverId: "DRV-008" },
        reason: "Attempt dispatch during recovery",
      }),
    /recovery balance/,
  );
});

test("OTP resend resets attempts and enforces a one minute cooldown", () => {
  let s = seed();
  const parcel = s.deliveries.find((d) => d.status === "Collected")!;
  parcel.otpAttempts = 3;
  parcel.otpExpires = new Date(Date.now() - 1000).toISOString();
  s = execute(s, owner, {
    type: "deliveryUpdate",
    id: parcel.id,
    data: { action: "Resend OTP" },
  });
  const updated = s.deliveries.find((d) => d.id === parcel.id)!;
  assert.equal(updated.otpAttempts, 0);
  assert.match(updated.otp, /^\d{6}$/);
  assert.ok(new Date(updated.otpExpires).getTime() > Date.now());
  assert.throws(
    () =>
      execute(s, owner, {
        type: "deliveryUpdate",
        id: parcel.id,
        data: { action: "Resend OTP" },
      }),
    /Wait/,
  );
});

test("role and settings audit entries preserve actual changed values", () => {
  let s = seed();
  s = execute(s, owner, {
    type: "roleSave",
    data: { name: "Presentation viewer", permissions: ["overview.view"] },
    reason: "Create a limited presentation role",
  });
  const created = s.roles.find((r) => r.name === "Presentation viewer")!;
  assert.equal(s.audit[0].entity, created.id);
  assert.deepEqual(JSON.parse(s.audit[0].after).permissions, ["overview.view"]);
  s = execute(s, owner, {
    type: "roleSave",
    id: created.id,
    data: {
      name: "Presentation viewer",
      permissions: ["overview.view", "trips.view"],
    },
    reason: "Allow trip viewing for presentation",
  });
  assert.deepEqual(JSON.parse(s.audit[0].before).permissions, [
    "overview.view",
  ]);
  assert.deepEqual(JSON.parse(s.audit[0].after).permissions, [
    "overview.view",
    "trips.view",
  ]);
  const prior = s.settings.rides;
  s = execute(s, owner, {
    type: "settingsSave",
    data: { rides: !prior },
    reason: "Change ride booking availability",
  });
  assert.equal(JSON.parse(s.audit[0].before).rides, prior);
  assert.equal(JSON.parse(s.audit[0].after).rides, !prior);
});

test("vehicle replacement preserves completed trip vehicle and requires new review", () => {
  const booked = book();
  let s = complete(booked.s, booked.id);
  const oldDriver = s.drivers.find((d) => d.id === "DRV-008")!;
  const oldPlate = oldDriver.plate;
  s = execute(s, owner, {
    type: "vehicleReplace",
    id: oldDriver.id,
    data: {
      plate: "AA DEMO 900",
      model: "Toyota Vitz",
      vehicleClass: "Standard",
    },
    reason: "Independent owner replaces the existing vehicle",
  });
  const updated = s.drivers.find((d) => d.id === oldDriver.id)!;
  assert.equal(
    s.trips.find((t) => t.id === booked.id)!.vehicle!.plate,
    oldPlate,
  );
  assert.equal(updated.vehicleHistory![0].plate, oldPlate);
  assert.equal(updated.plate, "AA DEMO 900");
  assert.equal(updated.status, "Submitted");
  assert.equal(updated.inspection, false);
  assert.equal(
    updated.documents.filter((doc) => doc.status === "Missing").length,
    3,
  );
  assert.throws(
    () =>
      execute(s, owner, {
        type: "driverReview",
        id: updated.id,
        data: { decision: "First review" },
        reason: "Attempt approval before vehicle checks",
      }),
    /documents/,
  );
});

test("replacement cannot interrupt an active job or duplicate an existing plate", () => {
  const booked = book();
  let s = execute(booked.s, owner, {
    type: "tripAssign",
    id: booked.id,
    data: { driverId: "DRV-008" },
    reason: "Active dispatch",
  });
  assert.throws(
    () =>
      execute(s, owner, {
        type: "vehicleReplace",
        id: "DRV-008",
        data: {
          plate: "AA DEMO 901",
          model: "Toyota Vitz",
          vehicleClass: "Standard",
        },
        reason: "Attempt replacement during active trip",
      }),
    /active trip/,
  );
  s = execute(s, owner, {
    type: "tripCancel",
    id: booked.id,
    reason: "Cancel test dispatch",
  });
  assert.throws(
    () =>
      execute(s, owner, {
        type: "vehicleReplace",
        id: "DRV-008",
        data: {
          plate: s.drivers[0].plate,
          model: "Toyota Vitz",
          vehicleClass: "Standard",
        },
        reason: "Attempt duplicate registration",
      }),
    /already registered/,
  );
});

test("required evidence cannot be omitted and mandatory expiry must be a valid date", () => {
  const s = seed();
  const driver = s.drivers.find((d) => d.id === "DRV-002")!;
  driver.documents = driver.documents.filter((doc) => doc.name !== "Insurance");
  assert.throws(
    () =>
      execute(s, owner, {
        type: "driverReview",
        id: driver.id,
        data: { decision: "First review" },
        reason: "Attempt missing insurance approval",
      }),
    /documents/,
  );
  driver.documents.push({
    name: "Insurance",
    status: "Valid",
    expires: "invalid-date",
  });
  assert.throws(
    () =>
      execute(s, owner, {
        type: "driverReview",
        id: driver.id,
        data: { decision: "First review" },
        reason: "Attempt invalid insurance approval",
      }),
    /documents/,
  );
});
