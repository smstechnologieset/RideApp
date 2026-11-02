import {
  balance,
  can,
  eligibility,
  modules,
  normalizePhone,
  payableReserved,
  reserved,
  uid,
  validDriverDocuments,
  type Command,
  type State,
  type Trip,
  type Ledger,
} from "./model";
const amount = (v: unknown) => {
  const n = Number(v);
  if (!Number.isSafeInteger(n) || n <= 0 || n > 100000000)
    throw Error("Enter a valid positive amount.");
  return n;
};
const text = (v: unknown) => String(v ?? "").trim();
export function audit(
  s: State,
  actorId: string,
  action: string,
  entity: string,
  reason = "",
  before = "",
  after = "",
  outcome = "Success",
) {
  const a = s.staff.find((x) => x.id === actorId);
  s.audit.unshift({
    id: uid("AUD"),
    actorId,
    actor: a?.name ?? "System",
    role: s.roles.find((r) => r.id === a?.roleId)?.name ?? "System",
    action,
    entity,
    time: new Date().toISOString(),
    reason,
    before,
    after,
    source: "Admin website · local session",
    outcome,
  });
}
export function execute(
  original: State,
  actor: string,
  command: Command,
): State {
  const s = structuredClone(original),
    d = command.data ?? {},
    id = command.id ?? "",
    why = text(command.reason),
    now = new Date().toISOString();
  const require = (p: string) => {
    if (!can(s, actor, p)) throw Error("Your role does not allow this action.");
  };
  const reason = () => {
    if (why.length < 4)
      throw Error("Enter a reason with at least 4 characters.");
  };
  const tripPerm = (p: string) => {
    if (!can(s, actor, "trips." + p)) require("operations." + p);
  };
  const driver = () => {
    const v = s.drivers.find((x) => x.id === id);
    if (!v) throw Error("Driver not found.");
    return v;
  };
  const trip = () => {
    const t = s.trips.find((x) => x.id === id);
    if (!t) throw Error("Trip not found.");
    return t;
  };
  const entry = (
    driverId: string,
    account: Ledger["account"],
    value: number,
    kind: string,
    reference: string,
    tripId?: string,
  ) => {
    if (value)
      s.ledger.unshift({
        id: uid("LED"),
        driverId,
        tripId,
        account,
        amount: value,
        kind,
        reference,
        date: now,
      });
  };
  const settle = (t: Trip) => {
    if (t.settled || !t.driverId) return;
    if (t.method === "Cash") {
      entry(t.driverId, "wallet", -t.commission, "Cash commission", t.id, t.id);
    } else {
      entry(
        t.driverId,
        "collection",
        t.fare,
        "Chapa verified collection",
        t.id,
        t.id,
      );
      entry(
        t.driverId,
        "payable",
        t.fare - t.commission,
        "Driver earnings payable",
        t.id,
        t.id,
      );
    }
    entry(
      t.driverId,
      "commission",
      t.commission,
      "Earned commission",
      t.id,
      t.id,
    );
    t.settled = true;
    t.reservation = 0;
  };
  let entity = id || command.type,
    before = "",
    after = "";
  switch (command.type) {
    case "driverReview": {
      const v = driver();
      const decision = text(d.decision);
      if (decision === "Approve") {
        require("applications.approve");
        if (
          v.status !== "Second review" ||
          !v.firstReviewer ||
          v.firstReviewer === actor
        )
          throw Error(
            "Final approval requires a different staff account after first review.",
          );
        if (v.reviewedVersion !== v.version)
          throw Error("Evidence changed. Repeat first review.");
      } else require("applications.review");
      reason();
      before = v.status;
      if (decision === "First review" || decision === "Approve") {
        if (!v.inspection || !validDriverDocuments(v))
          throw Error(
            "All required documents, valid dates, TIN and a passed inspection are required.",
          );
        if (
          s.drivers.some(
            (x) =>
              x.id !== v.id &&
              x.ownerId === v.ownerId &&
              x.status === "Approved",
          )
        )
          throw Error("This independent owner already has an active vehicle.");
        if (decision === "First review") {
          if (
            !["Submitted", "Corrections needed", "Rejected"].includes(v.status)
          )
            throw Error("Application is not ready for first review.");
          v.status = "Second review";
          v.firstReviewer = actor;
          v.reviewedVersion = v.version;
        } else {
          v.status = "Approved";
          v.secondReviewer = actor;
          v.online = true;
        }
      } else if (decision === "Corrections needed") {
        v.status = "Corrections needed";
      } else if (decision === "Reject") {
        v.status = "Rejected";
      } else throw Error("Choose a valid review decision.");
      v.notes = why;
      after = v.status;
      break;
    }
    case "driverEvidence": {
      require("applications.edit");
      reason();
      const v = driver();
      const evidenceSummary = () =>
        JSON.stringify({
          status: v.status,
          version: v.version,
          inspection: v.inspection,
          documents: v.documents.map(({ name, status, expires, file }) => ({
            name,
            status,
            expires,
            attached: Boolean(file),
          })),
        });
      before = evidenceSummary();
      if (text(d.document)) {
        const doc = v.documents.find((x) => x.name === text(d.document));
        if (!doc) throw Error("Unknown document.");
        doc.status = "Valid";
        doc.expires = text(d.expires);
        if (d.file) {
          const f = text(d.file);
          if (
            !/^data:(image\/(png|jpeg|webp)|application\/pdf);base64,/.test(
              f,
            ) ||
            f.length > 2800000
          )
            throw Error("Use a PNG, JPEG, WebP or PDF below 2 MB.");
          doc.file = f;
        }
      } else v.inspection = d.passed === true;
      v.version++;
      v.firstReviewer = undefined;
      v.reviewedVersion = undefined;
      v.secondReviewer = undefined;
      v.status = "Submitted";
      v.notes = why;
      after = evidenceSummary();
      break;
    }
    case "driverState": {
      const v = driver();
      if (d.status) {
        require("drivers.suspend");
        reason();
        before = v.status;
        if (!["Approved", "Suspended"].includes(v.status))
          throw Error("Use application review for this record.");
        v.status = text(d.status) === "Suspended" ? "Suspended" : "Approved";
      } else {
        require("drivers.edit");
        if ("online" in d) v.online = d.online === true;
        if (Array.isArray(d.services))
          v.services = (d.services as string[]).filter((x) =>
            ["Rides", "Deliveries"].includes(x),
          );
      }
      after = v.status + (v.online ? " · online" : " · offline");
      break;
    }
    case "vehicleReplace": {
      require("drivers.edit");
      reason();
      const v = driver();
      if (!["Approved", "Suspended"].includes(v.status))
        throw Error("Finish the current vehicle review before replacing it.");
      if (
        s.trips.some(
          (t) =>
            t.driverId === id && !["Completed", "Cancelled"].includes(t.status),
        )
      )
        throw Error("Close or reassign the driver's active trip first.");
      const plate = text(d.plate).toUpperCase().replace(/\s+/g, " ");
      if (
        !plate ||
        !text(d.model) ||
        !["Standard", "Comfort", "XL"].includes(text(d.vehicleClass))
      )
        throw Error("Enter the replacement vehicle and class.");
      if (s.drivers.some((other) => other.plate.toUpperCase() === plate))
        throw Error(
          "This plate is already registered. Each vehicle has one owner record.",
        );
      const previous = {
        plate: v.plate,
        model: v.model,
        vehicleClass: v.vehicleClass,
      };
      before = JSON.stringify(previous);
      for (const t of s.trips.filter((t) => t.driverId === id && !t.vehicle))
        t.vehicle = { ...previous };
      v.vehicleHistory = [
        ...(v.vehicleHistory ?? []),
        { ...previous, retiredAt: now, reason: why },
      ];
      v.plate = plate;
      v.model = text(d.model);
      v.vehicleClass = text(d.vehicleClass);
      v.inspection = false;
      v.online = false;
      v.status = "Submitted";
      v.version++;
      v.firstReviewer = v.secondReviewer = undefined;
      v.reviewedVersion = undefined;
      v.documents = v.documents.map((doc) =>
        ["Vehicle registration", "Insurance", "Vehicle photos"].includes(
          doc.name,
        )
          ? { name: doc.name, status: "Missing", expires: "" }
          : doc,
      );
      v.notes = why;
      after = JSON.stringify({
        plate,
        model: v.model,
        vehicleClass: v.vehicleClass,
        status: v.status,
        evidenceVersion: v.version,
      });
      break;
    }
    case "customerSave": {
      require(id ? "customers.edit" : "customers.create");
      const phone = normalizePhone(text(d.phone));
      if (!text(d.name)) throw Error("Customer name is required.");
      if (s.customers.some((x) => x.phone === phone && x.id !== id))
        throw Error("A customer with this phone already exists.");
      const old = s.customers.find((x) => x.id === id);
      if (old) {
        old.name = text(d.name);
        old.phone = phone;
        old.email = text(d.email);
        old.notes = text(d.notes);
      } else
        s.customers.unshift({
          id: uid("CUS"),
          name: text(d.name),
          phone,
          email: text(d.email),
          status: "Active",
          source: "Office",
          joined: now,
          notes: text(d.notes),
        });
      entity = phone;
      break;
    }
    case "customerStatus": {
      require("customers.suspend");
      reason();
      const c = s.customers.find((x) => x.id === id);
      if (!c) throw Error("Customer not found.");
      before = c.status;
      c.status = c.status === "Active" ? "Restricted" : "Active";
      after = c.status;
      break;
    }
    case "tripCreate": {
      tripPerm("create");
      if (!s.settings.rides)
        throw Error("Ride bookings are paused in settings.");
      let c = s.customers.find((x) => x.id === text(d.customerId));
      if (!c) {
        require("customers.create");
        const phone = normalizePhone(text(d.phone));
        c = s.customers.find((x) => x.phone === phone);
        if (!c) {
          if (!text(d.name)) throw Error("Caller name is required.");
          c = {
            id: uid("CUS"),
            name: text(d.name),
            phone,
            email: "",
            status: "Active",
            source: "Office",
            joined: now,
            notes: "",
          };
          s.customers.unshift(c);
        }
      }
      if (c.status !== "Active")
        throw Error("This customer account is restricted.");
      const distance = Number(d.distance);
      if (!Number.isFinite(distance) || distance <= 0 || distance > 100)
        throw Error("Distance must be between 0 and 100 km.");
      const minutes = Number(d.minutes ?? 20);
      if (!Number.isFinite(minutes) || minutes <= 0 || minutes > 600)
        throw Error("Duration must be between 0 and 600 minutes.");
      if (
        !text(d.pickup) ||
        !text(d.destination) ||
        text(d.pickup) === text(d.destination)
      )
        throw Error("Choose distinct pickup and destination.");
      const method = text(d.method);
      if (!["Cash", "Chapa"].includes(method))
        throw Error("Choose Cash or Chapa.");
      const fare = Math.round(
        s.pricing.base +
          distance * s.pricing.perKm +
          minutes * s.pricing.perMinute,
      );
      const t: Trip = {
        id: uid("ZG"),
        customerId: c.id,
        pickup: text(d.pickup),
        destination: text(d.destination),
        pickupCoords: (d.pickupCoords as [number, number]) ?? [38.7903, 8.989],
        destCoords: (d.destCoords as [number, number]) ?? [38.75, 9.03],
        vehicleClass: text(d.vehicleClass) || "Standard",
        status: "Requested",
        method: method as Trip["method"],
        payment: "Unpaid",
        fare,
        originalFare: fare,
        commission: Math.round((fare * s.pricing.commissionPercent) / 100),
        commissionPercent: s.pricing.commissionPercent,
        distance,
        minutes,
        pricingVersion: s.pricing.version,
        date: now,
        source: "Office",
        note: text(d.note),
        reservation: 0,
        progress: 0,
        history: [{ time: now, text: "Office booking created" }],
        refundAmount: 0,
        collectionChannel: method,
        settled: false,
      };
      s.trips.unshift(t);
      entity = t.id;
      after = `Quoted ${fare / 100} ETB`;
      break;
    }
    case "tripAssign": {
      tripPerm("assign");
      reason();
      const t = trip();
      if (!["Requested", "Assigned", "Accepted", "Arrived"].includes(t.status))
        throw Error(
          "Reassignment is available before trip start. Escalate an active trip as an incident.",
        );
      const v = s.drivers.find((x) => x.id === text(d.driverId));
      if (!v) throw Error("Choose a driver.");
      const issue = eligibility(s, v, t.vehicleClass);
      if (issue) throw Error("Driver is ineligible: " + issue);
      if (
        t.method === "Cash" &&
        balance(s, v.id) - reserved(s, v.id) <
          Math.max(s.pricing.minimumBalance, t.commission)
      )
        throw Error(
          "Not enough available prepaid credit for this reservation.",
        );
      before = t.driverId ?? "Unassigned";
      t.driverId = v.id;
      t.vehicle = {
        plate: v.plate,
        model: v.model,
        vehicleClass: v.vehicleClass,
      };
      t.reservation = t.method === "Cash" ? t.commission : 0;
      t.status = "Assigned";
      t.history.push({ time: now, text: `Assigned ${v.name}: ${why}` });
      after = v.id;
      break;
    }
    case "tripAdvance": {
      tripPerm("advance");
      const t = trip();
      const next: Partial<Record<Trip["status"], Trip["status"]>> = {
        Assigned: "Accepted",
        Accepted: "Arrived",
        Arrived: "In progress",
        "In progress": "Completed",
      };
      if (t.status === "Completed") return original;
      if (!next[t.status] || !t.driverId)
        throw Error("Assign a driver before advancing the trip.");
      before = t.status;
      t.status = next[t.status]!;
      t.progress =
        t.status === "In progress" ? 0.15 : t.status === "Completed" ? 1 : 0;
      if (t.status === "Completed") {
        if (t.method === "Cash") settle(t);
        else t.payment = "Pending";
      }
      t.history.push({
        time: now,
        text: `${t.status} · simulated partner event`,
      });
      after = t.status;
      break;
    }
    case "tripProgress": {
      tripPerm("advance");
      const t = trip();
      if (t.status !== "In progress") throw Error("Start the trip first.");
      t.progress = Math.min(0.95, t.progress + 0.2);
      after = `${Math.round(t.progress * 100)}% simulated progress`;
      break;
    }
    case "tripCancel": {
      tripPerm("cancel");
      reason();
      const t = trip();
      if (["Completed", "Cancelled"].includes(t.status))
        throw Error("This trip is already closed.");
      before = t.status;
      t.status = "Cancelled";
      t.reservation = 0;
      t.fare = 0;
      t.commission = 0;
      t.history.push({ time: now, text: `Cancelled without fee: ${why}` });
      after = t.status;
      break;
    }
    case "tripAdjust": {
      tripPerm("adjust");
      reason();
      const t = trip();
      if (["Completed", "Cancelled"].includes(t.status))
        throw Error("Use a finance correction for a closed trip.");
      const fare = amount(d.amount);
      before = String(t.fare);
      const com = Math.round((fare * t.commissionPercent) / 100);
      if (
        t.driverId &&
        t.method === "Cash" &&
        balance(s, t.driverId) - reserved(s, t.driverId) + t.reservation < com
      )
        throw Error("Adjustment exceeds available driver credit.");
      t.fare = fare;
      t.commission = com;
      if (t.reservation) t.reservation = com;
      t.history.push({
        time: now,
        text: `Fare adjusted to ${fare / 100} ETB: ${why}`,
      });
      after = String(fare);
      break;
    }
    case "tripPayment": {
      require("finance.simulate");
      reason();
      const t = trip();
      if (t.status !== "Completed") throw Error("Complete the trip first.");
      const outcome = text(d.outcome);
      if (["Collected", "Verified", "Refunded"].includes(t.payment)) {
        if (outcome === "Success") return original;
        throw Error("This collection is already confirmed. Use a refund.");
      }
      before = t.payment;
      if (outcome === "Success") {
        if (t.method === "Cash") {
          t.payment = "Collected";
          t.collectionChannel = text(d.channel) || "Cash";
          entry(
            t.driverId!,
            "driverCollection",
            t.fare,
            "Driver collection reported",
            t.id,
            t.id,
          );
        } else {
          t.payment = "Verified";
          settle(t);
        }
      } else t.payment = outcome === "Failed" ? "Failed" : "Pending";
      after = t.payment;
      break;
    }
    case "financeRequest": {
      const type = text(d.type);
      if (!["Top-up", "Credit adjustment", "Refund", "Payout"].includes(type))
        throw Error("Unknown request type.");
      require(
        type === "Top-up"
          ? "wallets.create"
          : type === "Credit adjustment"
            ? "wallets.adjust"
            : "finance.create",
      );
      reason();
      const value = amount(d.amount);
      const v = s.drivers.find((x) => x.id === text(d.driverId));
      if (!v) throw Error("Choose a driver.");
      const t = s.trips.find((x) => x.id === text(d.tripId));
      if (type === "Refund") {
        if (!t || !["Collected", "Verified"].includes(t.payment))
          throw Error("Choose a collected or verified trip to refund.");
        const pending = s.requests
          .filter(
            (r) =>
              r.type === "Refund" &&
              r.tripId === t.id &&
              ["Approved", "Pending approval"].includes(r.status),
          )
          .reduce((a, x) => a + x.amount, 0);
        if (value > t.fare - t.refundAmount - pending)
          throw Error("Refund exceeds remaining collected funds.");
        if (t.driverId !== v.id) throw Error("Driver must match the trip.");
      }
      if (
        type === "Payout" &&
        value > balance(s, v.id, "payable") - payableReserved(s, v.id)
      )
        throw Error("Payout exceeds available unreserved earnings.");
      const r = {
        id: uid("FIN"),
        type: type as State["requests"][number]["type"],
        driverId: v.id,
        tripId: t?.id,
        amount: value,
        status: "Pending approval" as const,
        createdBy: actor,
        reason: why,
        date: now,
        refundParty:
          type === "Refund"
            ? t?.method === "Cash"
              ? "Driver"
              : "Platform"
            : undefined,
        reverseCommission: d.reverseCommission === true,
      };
      s.requests.unshift(r);
      entity = r.id;
      after = r.status;
      break;
    }
    case "financeApprove": {
      const r = s.requests.find((x) => x.id === id);
      if (!r) throw Error("Request not found.");
      require(
        ["Top-up", "Credit adjustment"].includes(r.type)
          ? "wallets.approve"
          : "finance.approve",
      );
      reason();
      if (r.status !== "Pending approval")
        throw Error("This request has already been reviewed.");
      if (r.createdBy === actor)
        throw Error("A different staff account must approve this request.");
      before = r.status;
      r.approvedBy = actor;
      if (d.approve === false) r.status = "Rejected";
      else if (["Top-up", "Credit adjustment"].includes(r.type)) {
        entry(r.driverId, "wallet", r.amount, r.type + " approved", r.id);
        r.status = "Settled";
      } else r.status = "Approved";
      after = r.status;
      break;
    }
    case "financeExecute": {
      require("finance.simulate");
      reason();
      const r = s.requests.find((x) => x.id === id);
      if (!r || r.status !== "Approved")
        throw Error("Approve the request before recording execution.");
      before = r.status;
      if (d.success === false) {
        r.status = "Failed";
        break;
      }
      if (r.type === "Payout") {
        if (r.amount > balance(s, r.driverId, "payable"))
          throw Error("Payable balance is insufficient.");
        entry(r.driverId, "payable", -r.amount, "Payout confirmed", r.id);
      } else if (r.type === "Refund") {
        const t = s.trips.find((x) => x.id === r.tripId)!;
        if (r.amount > t.fare - t.refundAmount)
          throw Error("Refund exceeds remaining collection.");
        entry(
          r.driverId,
          "refund",
          r.amount,
          `Refund issued by ${r.refundParty}`,
          r.id,
          t.id,
        );
        entry(
          r.driverId,
          t.method === "Cash" ? "driverCollection" : "collection",
          -r.amount,
          "Collection refunded",
          r.id,
          t.id,
        );
        if (t.method === "Chapa")
          entry(
            r.driverId,
            "payable",
            -r.amount,
            "Refund recovery from driver earnings",
            r.id,
            t.id,
          );
        if (r.reverseCommission) {
          const previouslyReversed = -s.ledger
            .filter(
              (l) =>
                l.tripId === t.id && l.account === "commission" && l.amount < 0,
            )
            .reduce((a, l) => a + l.amount, 0);
          const com = Math.min(
            t.commission - previouslyReversed,
            Math.round((r.amount * t.commissionPercent) / 100),
          );
          entry(
            r.driverId,
            "commission",
            -com,
            "Approved commission reversal",
            r.id,
            t.id,
          );
          entry(
            r.driverId,
            t.method === "Cash" ? "wallet" : "payable",
            com,
            "Commission refund allocation",
            r.id,
            t.id,
          );
        }
        t.refundAmount += r.amount;
        if (t.refundAmount === t.fare) t.payment = "Refunded";
      } else throw Error("This request posts on approval.");
      r.status = "Settled";
      after = r.status;
      break;
    }
    case "pricingSave": {
      require("pricing.edit");
      reason();
      before = JSON.stringify(s.pricing);
      const p = { ...s.pricing, version: s.pricing.version + 1 };
      for (const key of [
        "base",
        "perKm",
        "perMinute",
        "waiting",
        "cancellation",
        "minimumBalance",
        "deliveryFee",
        "commissionPercent",
        "radius",
      ] as const) {
        if (d[key] !== undefined) {
          const val = Number(d[key]);
          if (
            !Number.isFinite(val) ||
            val < 0 ||
            (key === "commissionPercent" && val > 100)
          )
            throw Error("Enter valid pricing values.");
          p[key] = Math.round(val);
        }
      }
      if (d.zone) p.zone = text(d.zone);
      s.pricingHistory.unshift({
        date: now,
        actor,
        value: { ...s.pricing },
        reason: why,
      });
      s.pricing = p;
      after = JSON.stringify(p);
      break;
    }
    case "roleSave": {
      require("staff.roles");
      reason();
      if (!text(d.name)) throw Error("Role name is required.");
      const allowed = Object.entries(modules).flatMap(([m, actions]) =>
        actions.map((a) => m + "." + a),
      );
      const permissions = ((d.permissions as string[]) ?? []).filter((x) =>
        allowed.includes(x),
      );
      if (permissions.some((p) => !can(s, actor, p)))
        throw Error("You cannot grant permissions beyond your authority.");
      const r = s.roles.find((x) => x.id === id);
      if (r?.permissions.includes("*"))
        throw Error("The owner role is protected. Create a custom role.");
      if (r) {
        before = JSON.stringify(r);
        r.name = text(d.name);
        r.permissions = permissions;
      } else {
        entity = uid("ROLE");
        s.roles.push({ id: entity, name: text(d.name), permissions });
      }
      after = JSON.stringify(s.roles.find((x) => x.id === entity));
      break;
    }
    case "staffSave": {
      require(id ? "staff.edit" : "staff.create");
      reason();
      const role = s.roles.find((x) => x.id === text(d.roleId));
      if (!role || !text(d.name) || !/^\S+@\S+\.\S+$/.test(text(d.email)))
        throw Error("Enter name, valid email and role.");
      if (role.permissions.includes("*") && !can(s, actor, "*"))
        throw Error("Only an owner can assign protected owner access.");
      if (role.permissions.some((p) => p !== "*" && !can(s, actor, p)))
        throw Error("You cannot assign a role above your authority.");
      if (
        s.staff.some(
          (x) =>
            x.id !== id &&
            x.email.toLowerCase() === text(d.email).toLowerCase(),
        )
      )
        throw Error("A staff account with this email already exists.");
      const user = s.staff.find((x) => x.id === id);
      before = user ? JSON.stringify(user) : "";
      if (user) {
        if (
          s.roles
            .find((r) => r.id === user.roleId)
            ?.permissions.includes("*") &&
          (d.active === false || role.id !== user.roleId) &&
          s.staff.filter(
            (x) =>
              x.active &&
              s.roles.find((r) => r.id === x.roleId)?.permissions.includes("*"),
          ).length <= 1
        )
          throw Error("Keep at least one active owner.");
        Object.assign(user, {
          name: text(d.name),
          email: text(d.email),
          roleId: role.id,
          active: d.active !== false,
        });
      } else {
        entity = uid("STAFF");
        s.staff.push({
          id: entity,
          name: text(d.name),
          email: text(d.email),
          roleId: role.id,
          active: true,
        });
      }
      after = JSON.stringify(s.staff.find((x) => x.id === entity));
      break;
    }
    case "restaurantSave": {
      require("restaurants.create");
      if (!text(d.name) || !text(d.owner))
        throw Error("Restaurant and owner names are required.");
      s.restaurants.unshift({
        id: uid("RES"),
        name: text(d.name),
        owner: text(d.owner),
        phone: normalizePhone(text(d.phone)),
        category: text(d.category) || "Ethiopian",
        status: "Submitted",
        branches: 1,
        commission: 15,
        documents: false,
        image: "habesha",
      });
      break;
    }
    case "restaurantReview": {
      const r = s.restaurants.find((x) => x.id === id);
      if (!r) throw Error("Restaurant not found.");
      reason();
      const step = text(d.step);
      before = r.status;
      if (step === "Approve") {
        require("restaurants.approve");
        if (
          r.status !== "Second review" ||
          r.firstReviewer === actor ||
          !r.firstReviewer ||
          !r.documents
        )
          throw Error(
            "A different approver and verified documents are required.",
          );
        r.status = "Approved";
      } else if (step === "First review") {
        require("restaurants.review");
        r.documents = d.documents === true;
        if (!r.documents) throw Error("Confirm restaurant documents.");
        r.firstReviewer = actor;
        r.status = "Second review";
      } else {
        require("restaurants.suspend");
        r.status = r.status === "Suspended" ? "Approved" : "Suspended";
      }
      after = r.status;
      break;
    }
    case "orderAdvance": {
      require("food.edit");
      const o = s.orders.find((x) => x.id === id);
      if (!o) throw Error("Order not found.");
      const flow = [
        "Submitted",
        "Accepted",
        "Preparing",
        "Ready",
        "Collected",
        "Delivered",
      ];
      const index = flow.indexOf(o.status);
      if (index < 0 || index === flow.length - 1)
        throw Error("Order is closed.");
      o.status = flow[index + 1];
      after = o.status;
      break;
    }
    case "deliveryUpdate": {
      const p = s.deliveries.find((x) => x.id === id);
      if (!p) throw Error("Delivery not found.");
      const action = text(d.action);
      require(
        action === "Verify OTP" ? "deliveries.verify" : "deliveries.edit",
      );
      if (action === "Verify OTP") {
        if (p.status !== "Collected")
          throw Error("Collect the parcel before delivery confirmation.");
        if (p.otpAttempts >= 3 || new Date(p.otpExpires) < new Date())
          throw Error("Code expired or locked. Request a new code.");
        if (text(d.otp) !== p.otp) throw Error("Incorrect recipient code.");
        p.status = "Delivered";
        p.proof = `Recipient phone OTP verified by ${actor} at ${now}`;
        p.otp = "";
      } else if (action === "Resend OTP") {
        if (p.status === "Delivered") throw Error("Delivery already verified.");
        if (p.otpSentAt && new Date(p.otpSentAt).getTime() > Date.now() - 60000)
          throw Error("Wait before requesting another code.");
        p.otp = String(Math.floor(100000 + Math.random() * 900000));
        p.otpExpires = new Date(Date.now() + 300000).toISOString();
        p.otpAttempts = 0;
        p.otpSentAt = now;
        after = "New code in demo message preview";
      } else {
        reason();
        const allowed: Record<string, string[]> = {
          Requested: ["Assigned"],
          Assigned: ["Collected", "Failed"],
          Collected: ["Failed"],
          Failed: ["Returning", "Assigned"],
          Returning: ["Returned"],
        };
        if (!allowed[p.status]?.includes(action))
          throw Error("Invalid delivery transition.");
        p.status = action;
        if (action === "Failed") p.attempts++;
        p.note = why;
      }
      after = p.status + " " + after;
      break;
    }
    case "ticketSave": {
      require(id ? "support.edit" : "support.create");
      const t = s.tickets.find((x) => x.id === id);
      if (t) {
        reason();
        t.status = text(d.status) || t.status;
        t.assignedTo = text(d.assignedTo);
        t.note = why;
        t.priority = text(d.priority) || t.priority;
      } else {
        if (!text(d.subject)) throw Error("Subject is required.");
        s.tickets.unshift({
          id: uid("SUP"),
          subject: text(d.subject),
          customerId: text(d.customerId),
          driverId: text(d.driverId),
          tripId: text(d.tripId),
          channel: text(d.channel) || "Phone",
          category: text(d.category) || "General",
          priority: text(d.priority) || "Normal",
          status: "Open",
          assignedTo: text(d.assignedTo),
          note: text(d.note),
          date: now,
          due: new Date(Date.now() + 86400000).toISOString(),
        });
      }
      break;
    }
    case "promoSave": {
      require(id ? "growth.edit" : "growth.create");
      reason();
      const p = s.promotions.find((x) => x.id === id);
      if (p) {
        p.status = p.status === "Active" ? "Paused" : "Active";
      } else {
        if (!text(d.name)) throw Error("Name is required.");
        s.promotions.unshift({
          id: uid("PROMO"),
          name: text(d.name),
          type: text(d.type),
          value: Number(d.value) || 0,
          budget: amount(d.budget),
          used: 0,
          status: "Draft",
          audience: text(d.audience),
          start: now,
          end: new Date(Date.now() + 30 * 86400000).toISOString(),
        });
      }
      break;
    }
    case "messageSend": {
      require("growth.send");
      reason();
      if (!text(d.title) || !text(d.body))
        throw Error("Title and message are required.");
      const channel = text(d.channel);
      if (
        (channel === "SMS" && !s.settings.sms) ||
        (channel === "Push" && !s.settings.push)
      )
        throw Error("Channel is disabled in settings.");
      s.messages.unshift({
        id: uid("MSG"),
        title: text(d.title),
        body: text(d.body),
        channel,
        audience: text(d.audience),
        status: d.scheduled ? "Scheduled · simulated" : "Delivered · simulated",
        date: now,
        scheduled: text(d.scheduled),
      });
      break;
    }
    case "reviewClose": {
      require("audit.review");
      reason();
      const r = s.reviews.find((x) => x.id === id);
      if (!r) throw Error("Flag not found.");
      r.status = "Reviewed";
      r.note = why;
      break;
    }
    case "settingsSave": {
      require("settings.edit");
      reason();
      before = JSON.stringify(s.settings);
      for (const k of ["sms", "push", "rides", "food", "packages"] as const)
        if (k in d) s.settings[k] = d[k] === true;
      for (const k of ["company", "supportEmail"] as const)
        if (d[k]) s.settings[k] = text(d[k]);
      after = JSON.stringify(s.settings);
      break;
    }
    case "documentView":
      require("applications.documents");
      after = text(d.document);
      break;
    case "export":
      require(text(d.permission));
      after = text(d.report);
      break;
    case "session":
      if (!s.staff.some((x) => x.id === actor && x.active))
        throw Error("Account inactive.");
      after = "Demo staff session selected";
      break;
    default:
      throw Error("Unknown action.");
  }
  audit(s, actor, command.type, entity, why, before, after);
  s.revision++;
  return s;
}
export function validateBackup(v: unknown): asserts v is State {
  const s = v as State;
  if (
    !s ||
    s.schema !== 1 ||
    !Array.isArray(s.roles) ||
    !Array.isArray(s.staff) ||
    !s.staff.some(
      (x) =>
        x.active &&
        s.roles.some((r) => r.id === x.roleId && r.permissions.includes("*")),
    )
  )
    throw Error("Invalid backup: active owner and schema are required.");
  for (const key of [
    "drivers",
    "customers",
    "trips",
    "ledger",
    "requests",
    "restaurants",
    "orders",
    "deliveries",
    "tickets",
    "promotions",
    "messages",
    "audit",
    "reviews",
    "pricingHistory",
  ] as const)
    if (!Array.isArray(s[key])) throw Error("Invalid backup: missing " + key);
  const driverIds = new Set(s.drivers.map((x) => x.id)),
    customerIds = new Set(s.customers.map((x) => x.id));
  if (
    s.trips.some(
      (t) =>
        !customerIds.has(t.customerId) ||
        (t.driverId && !driverIds.has(t.driverId)) ||
        !Number.isSafeInteger(t.fare) ||
        t.fare < 0,
    )
  )
    throw Error("Invalid trip relationships or money.");
  if (
    s.ledger.some(
      (l) => !driverIds.has(l.driverId) || !Number.isSafeInteger(l.amount),
    )
  )
    throw Error("Invalid ledger.");
  if (!s.pricing || !s.settings || !Number.isFinite(s.revision))
    throw Error("Invalid configuration.");
}
