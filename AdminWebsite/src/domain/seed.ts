import type { State, Driver, Trip, Ledger } from "./model";
const names = [
  "Dawit Tadesse",
  "Meron Alemu",
  "Abel Tesfaye",
  "Hana Bekele",
  "Samuel Girma",
  "Rahel Getachew",
  "Yohannes Kebede",
  "Selam Mulugeta",
  "Bereket Mekonnen",
  "Tigist Hailu",
  "Nahom Assefa",
  "Betelhem Fikru",
];
const places: [string, [number, number]][] = [
  ["Bole Bulbula", [38.7903, 8.989]],
  ["Piassa, Churchill Avenue", [38.75, 9.03]],
  ["Meskel Square", [38.7613, 9.0108]],
  ["Kazanchis", [38.7764, 9.015]],
  ["Sarbet", [38.7402, 8.991]],
  ["Bole Airport", [38.7993, 8.9806]],
  ["CMC", [38.862, 9.021]],
  ["Mexico Square", [38.748, 9.01]],
];
export { places };
export function seed(): State {
  const now = new Date();
  const dt = (days = 0) =>
    new Date(now.getTime() - days * 86400000).toISOString();
  const future = (days: number) =>
    new Date(now.getTime() + days * 86400000).toISOString();
  const roles = [
    { id: "owner", name: "Owner", permissions: ["*"] },
    {
      id: "reviewer",
      name: "Application Reviewer",
      permissions: [
        "overview.view",
        "applications.view",
        "applications.documents",
        "applications.edit",
        "applications.review",
        "drivers.view",
        "audit.view",
      ],
    },
    {
      id: "approver",
      name: "Approval Officer",
      permissions: [
        "overview.view",
        "applications.view",
        "applications.documents",
        "applications.approve",
        "drivers.view",
        "restaurants.view",
        "restaurants.approve",
        "audit.view",
      ],
    },
    {
      id: "operator",
      name: "Call Operator",
      permissions: [
        "overview.view",
        "operations.view",
        "operations.create",
        "operations.assign",
        "operations.cancel",
        "operations.advance",
        "trips.view",
        "trips.create",
        "trips.assign",
        "trips.cancel",
        "trips.advance",
        "customers.view",
        "customers.create",
        "drivers.view",
        "support.view",
        "support.create",
      ],
    },
    {
      id: "finance",
      name: "Finance Officer",
      permissions: [
        "overview.view",
        "wallets.view",
        "wallets.create",
        "wallets.approve",
        "wallets.adjust",
        "wallets.export",
        "finance.view",
        "finance.create",
        "finance.approve",
        "finance.simulate",
        "finance.export",
        "trips.view",
        "drivers.view",
        "analytics.view",
        "analytics.export",
        "audit.view",
      ],
    },
    {
      id: "support",
      name: "Customer Support",
      permissions: [
        "overview.view",
        "support.view",
        "support.create",
        "support.edit",
        "customers.view",
        "drivers.view",
        "trips.view",
        "deliveries.view",
      ],
    },
    {
      id: "analyst",
      name: "Business Analyst",
      permissions: [
        "overview.view",
        "analytics.view",
        "analytics.export",
        "audit.view",
      ],
    },
  ];
  const staff = [
    {
      id: "staff-owner",
      name: "Mekdes Solomon",
      email: "mekdes@demo.zemengo.local",
      roleId: "owner",
      active: true,
    },
    {
      id: "staff-review",
      name: "Eyob Daniel",
      email: "eyob@demo.zemengo.local",
      roleId: "reviewer",
      active: true,
    },
    {
      id: "staff-approve",
      name: "Sara Tesfaye",
      email: "sara@demo.zemengo.local",
      roleId: "approver",
      active: true,
    },
    {
      id: "staff-operator",
      name: "Liya Bekele",
      email: "liya@demo.zemengo.local",
      roleId: "operator",
      active: true,
    },
    {
      id: "staff-finance",
      name: "Henok Girma",
      email: "henok@demo.zemengo.local",
      roleId: "finance",
      active: true,
    },
    {
      id: "staff-finance2",
      name: "Ruth Alemu",
      email: "ruth@demo.zemengo.local",
      roleId: "finance",
      active: true,
    },
    {
      id: "staff-support",
      name: "Soliana Hailu",
      email: "soliana@demo.zemengo.local",
      roleId: "support",
      active: true,
    },
    {
      id: "staff-analyst",
      name: "Amanuel Fikru",
      email: "amanuel@demo.zemengo.local",
      roleId: "analyst",
      active: true,
    },
  ];
  const drivers: Driver[] = Array.from({ length: 60 }, (_, i) => ({
    id: `DRV-${String(i + 1).padStart(3, "0")}`,
    name:
      i < 12
        ? names[i]
        : `${names[i % 12].split(" ")[0]} ${["Abebe", "Worku", "Desta", "Seifu", "Demissie"][Math.floor(i / 12) - 1]}`,
    phone: `+25191${String(1000000 + i).padStart(7, "0")}`,
    email: `driver${i + 1}@demo.zemengo.local`,
    ownerId: `OWNER-${i + 1}`,
    plate: `AA ${String(42001 + i)}`,
    model:
      i % 4 === 1
        ? "Toyota Corolla"
        : i % 4 === 2
          ? "Toyota Hiace"
          : "Toyota Vitz",
    vehicleClass: i % 4 === 1 ? "Comfort" : i % 4 === 2 ? "XL" : "Standard",
    status:
      i === 0
        ? "Second review"
        : i === 1
          ? "Submitted"
          : i === 2
            ? "Corrections needed"
            : i === 3
              ? "Rejected"
              : i === 4
                ? "Suspended"
                : "Approved",
    online: i % 6 !== 0,
    services: ["Rides", "Deliveries"],
    documents: [
      "Identification",
      "Driving licence",
      "Profile photo",
      "Vehicle registration",
      "Insurance",
      "Vehicle photos",
      "Payment details",
      "TIN certificate",
    ].map((name, j) => ({
      name,
      status:
        i === 2 && j === 4
          ? "Missing"
          : i === 6 && j === 1
            ? "Expired"
            : "Valid",
      expires: j === 1 || j === 4 ? (i === 6 ? dt(3) : future(90 + i)) : "",
    })),
    tin: `DEMO-TIN-${10000 + i}`,
    inspection: i !== 2,
    version: 1,
    firstReviewer: i === 0 ? "staff-review" : undefined,
    reviewedVersion: i === 0 ? 1 : undefined,
    rating: 4.6 + (i % 4) / 10,
    zone: ["Bole", "Kirkos", "Arada", "Yeka"][i % 4],
    lat: 8.988 + (i % 8) * 0.006,
    lng: 38.741 + (i % 9) * 0.009,
    notes: "Synthetic partner record · Zemen Pro",
  }));
  const customers = Array.from({ length: 800 }, (_, i) => ({
    id: `CUS-${String(i + 1).padStart(4, "0")}`,
    name: `${names[i % 12].split(" ")[0]} ${["Abebe", "Demissie", "Solomon", "Bekele", "Alemu", "Tadesse"][i % 6]} ${i > 60 ? i + 1 : ""}`.trim(),
    phone: `+25192${String(1000000 + i).padStart(7, "0")}`,
    email: `customer${i + 1}@demo.zemengo.local`,
    status: i % 91 === 0 ? "Restricted" : "Active",
    source: i % 8 === 0 ? "Office" : "Customer app",
    joined: dt(i % 30),
    notes: "",
  }));
  const dayBuckets = Array.from({ length: 30 }, (_, day) =>
    Array.from(
      {
        length: [23, 31, 39, 30, 48, 59, 42][day % 7] + Math.floor(day / 7) * 3,
      },
      () => day,
    ),
  ).flat();
  const ledger: Ledger[] = drivers.map((d, i) => ({
    id: `L-OPEN-${i}`,
    driverId: d.id,
    account: "wallet",
    amount: i === 5 ? 500 : 200000,
    kind: "Opening prepaid deposit",
    reference: `SEED-${i}`,
    date: dt(30),
  }));
  const trips: Trip[] = Array.from({ length: 1200 }, (_, i) => {
    const driver = drivers[8 + (i % 52)];
    const status =
      i < 8
        ? (
            [
              "Requested",
              "Assigned",
              "Accepted",
              "Arrived",
              "In progress",
              "Completed",
              "Cancelled",
              "Completed",
            ] as Trip["status"][]
          )[i]
        : i % 9 === 0
          ? "Cancelled"
          : "Completed";
    const p = places[i % 8],
      dest = places[(i + 3) % 8];
    const fare = 8000 + ((i % 18) + 3) * 1300;
    const method = i % 3 === 0 ? "Chapa" : "Cash";
    const paid = !(i % 23 === 0);
    const payment: Trip["payment"] =
      status !== "Completed"
        ? "Unpaid"
        : method === "Cash"
          ? paid
            ? "Collected"
            : "Unpaid"
          : paid
            ? "Verified"
            : i % 2
              ? "Failed"
              : "Pending";
    const t: Trip = {
      id: `ZG-${String(10001 + i)}`,
      customerId: customers[i % 800].id,
      driverId: status === "Requested" ? undefined : driver.id,
      pickup: p[0],
      destination: dest[0],
      pickupCoords: p[1],
      destCoords: dest[1],
      vehicleClass: driver.vehicleClass,
      status,
      method,
      payment,
      fare,
      originalFare: fare,
      commission: Math.round(fare * 0.1),
      commissionPercent: 10,
      distance: 3 + (i % 18),
      minutes: 12 + (i % 30),
      pricingVersion: 1,
      date:
        i < 8 ? dt() : dt(dayBuckets[i % dayBuckets.length] + (i % 12) / 24),
      source: i % 6 === 0 ? "Office" : "Customer app",
      note: "",
      reservation:
        method === "Cash" &&
        !["Completed", "Cancelled", "Requested"].includes(status)
          ? Math.round(fare * 0.1)
          : 0,
      progress:
        status === "Completed" ? 1 : status === "In progress" ? 0.42 : 0,
      history: [{ time: dt(i % 30), text: "Booking created · sample data" }],
      refundAmount: 0,
      collectionChannel: method === "Cash" ? "Cash" : "Chapa",
      settled:
        status === "Completed" && (method === "Cash" || payment === "Verified"),
    };
    if (t.settled) {
      ledger.push({
        id: `L-COM-${i}`,
        driverId: driver.id,
        tripId: t.id,
        account: "commission",
        amount: t.commission,
        kind: "Earned ride commission",
        reference: t.id,
        date: t.date,
      });
      if (method === "Cash") {
        ledger.push({
          id: `L-WAL-${i}`,
          driverId: driver.id,
          tripId: t.id,
          account: "wallet",
          amount: -t.commission,
          kind: "Cash ride commission",
          reference: t.id,
          date: t.date,
        });
        if (paid)
          ledger.push({
            id: `L-DC-${i}`,
            driverId: driver.id,
            tripId: t.id,
            account: "driverCollection",
            amount: fare,
            kind: "Cash collected by driver",
            reference: t.id,
            date: t.date,
          });
      } else {
        ledger.push(
          {
            id: `L-PAY-${i}`,
            driverId: driver.id,
            tripId: t.id,
            account: "payable",
            amount: fare - t.commission,
            kind: "Chapa driver earnings",
            reference: t.id,
            date: t.date,
          },
          {
            id: `L-COL-${i}`,
            driverId: driver.id,
            tripId: t.id,
            account: "collection",
            amount: fare,
            kind: "Chapa payment verified",
            reference: t.id,
            date: t.date,
          },
        );
      }
    }
    return t;
  });
  const restaurantNames = [
    "Kategna Restaurant",
    "Tomoca Coffee",
    "Five Loaves",
    "Mama’s Kitchen",
    "Sishu",
    "Yod Abyssinia",
    "Effoi Pizza",
    "Kaldi’s Coffee",
    "Abucci",
    "Garden Court",
    "Lime Tree",
    "Habesha 2000",
  ];
  const restaurants = restaurantNames.map((name, i) => ({
    id: `RES-${i + 1}`,
    name,
    owner: names[i],
    phone: `+2519330000${String(i).padStart(2, "0")}`,
    category: ["Ethiopian", "Coffee & pastries", "Continental"][i % 3],
    status: i === 0 ? "Second review" : i === 1 ? "Submitted" : "Approved",
    branches: 1 + (i % 3),
    commission: 15,
    documents: i !== 1,
    firstReviewer: i === 0 ? "staff-review" : undefined,
    image: ["habesha", "coffee", "pizza"][i % 3],
  }));
  return {
    schema: 1,
    revision: 0,
    seedDate: dt(),
    roles,
    staff,
    drivers,
    customers,
    trips,
    ledger,
    requests: [
      {
        id: "FIN-1001",
        type: "Top-up",
        driverId: "DRV-006",
        amount: 50000,
        status: "Pending approval",
        createdBy: "staff-review",
        reason: "Sample bank deposit for prepaid credit",
        date: dt(),
      },
    ],
    restaurants,
    orders: Array.from({ length: 200 }, (_, i) => ({
      id: `FOOD-${1001 + i}`,
      customerId: customers[i].id,
      restaurantId: restaurants[i % 12].id,
      driverId: drivers[8 + (i % 52)].id,
      status: [
        "Submitted",
        "Accepted",
        "Preparing",
        "Ready",
        "Collected",
        "Delivered",
        "Cancelled",
      ][i % 7],
      total: (250 + (i % 8) * 50) * 100,
      fee: 6500,
      date: dt(i % 30),
      items: ["Beyaynetu × 2", "Macchiato & croissant", "Margherita pizza"][
        i % 3
      ],
    })),
    deliveries: Array.from({ length: 100 }, (_, i) => ({
      id: `PKG-${1001 + i}`,
      sender: customers[i].name,
      receiver: customers[i + 1].name,
      phone: customers[i + 1].phone,
      category: ["Documents", "Parcel", "Keys"][i % 3],
      status: [
        "Requested",
        "Assigned",
        "Collected",
        "Delivered",
        "Failed",
        "Returning",
        "Returned",
      ][i % 7],
      driverId: drivers[8 + (i % 52)].id,
      fee: 16500 + (i % 3) * 5000,
      attempts: i % 3,
      otp: "842916",
      otpExpires: future(1),
      otpAttempts: 0,
      proof: i % 7 === 3 ? "Synthetic recipient OTP verified" : undefined,
      destination: places[i % 8][0],
      date: dt(i % 30),
      note: "",
    })),
    tickets: Array.from({ length: 35 }, (_, i) => ({
      id: `SUP-${1001 + i}`,
      subject: [
        "Lost item in vehicle",
        "Fare review requested",
        "Delivery delay",
        "Safety concern",
        "Account suspension appeal",
      ][i % 5],
      customerId: customers[i].id,
      driverId: drivers[8 + (i % 52)].id,
      tripId: trips[i].id,
      channel: ["Phone", "In-app", "Chat", "Email"][i % 4],
      category: ["Lost item", "Refund", "Delivery", "Safety", "Appeal"][i % 5],
      priority: i % 5 === 3 ? "Urgent" : i % 3 === 0 ? "High" : "Normal",
      status: ["Open", "In progress", "Resolved"][i % 3],
      assignedTo: i % 2 ? "staff-support" : "",
      note: "Synthetic support case. No real customer contact.",
      date: dt(i % 7),
      due: future(i % 3),
    })),
    promotions: [
      {
        id: "PROMO-1",
        name: "ZEMENFIRST",
        type: "Promo code",
        value: 20,
        budget: 500000,
        used: 0,
        status: "Active",
        audience: "New customers",
        start: dt(),
        end: future(30),
      },
      {
        id: "PROMO-2",
        name: "Invite a friend",
        type: "Referral",
        value: 50,
        budget: 1000000,
        used: 0,
        status: "Draft",
        audience: "All customers",
        start: dt(),
        end: future(30),
      },
      {
        id: "PROMO-3",
        name: "Weekend partner bonus",
        type: "Driver incentive",
        value: 100,
        budget: 2000000,
        used: 0,
        status: "Draft",
        audience: "Drivers",
        start: dt(),
        end: future(30),
      },
      {
        id: "PROMO-4",
        name: "Lunch in Addis",
        type: "Restaurant offer",
        value: 15,
        budget: 500000,
        used: 0,
        status: "Draft",
        audience: "Restaurant customers",
        start: dt(),
        end: future(30),
      },
    ],
    messages: [],
    audit: [
      {
        id: "AUD-SEED",
        actorId: "system",
        actor: "Demo system",
        role: "System",
        action: "Created connected sample dataset",
        entity: "Platform",
        time: dt(),
        reason: "Presentation initialization",
        before: "",
        after: "Synthetic records · no live operations",
        source: "Local demo",
        outcome: "Success",
      },
    ],
    reviews: [
      {
        id: "REV-1",
        subject: "Repeated cancellation pattern",
        type: "Trip activity",
        entity: "DRV-021",
        status: "Open",
        note: "Sample investigation flag; no automatic enforcement.",
      },
      {
        id: "REV-2",
        subject: "Potential duplicate document",
        type: "Document",
        entity: "DRV-003",
        status: "Open",
        note: "Staff must investigate evidence before deciding.",
      },
    ],
    pricing: {
      version: 1,
      base: 8000,
      perKm: 1300,
      perMinute: 0,
      waiting: 500,
      cancellation: 2000,
      commissionPercent: 10,
      minimumBalance: 2000,
      deliveryFee: 16500,
      zone: "Addis Ababa",
      radius: 25,
    },
    pricingHistory: [],
    settings: {
      company: "ZemenGo",
      sms: true,
      push: true,
      rides: true,
      food: false,
      packages: false,
      supportEmail: "support@demo.zemengo.local",
    },
  };
}
