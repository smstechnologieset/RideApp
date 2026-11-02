export const modules = {
  overview: ["view"],
  operations: ["view", "create", "assign", "cancel", "adjust", "advance"],
  trips: ["view", "create", "assign", "cancel", "adjust", "advance", "export"],
  applications: ["view", "review", "approve", "edit", "documents"],
  drivers: ["view", "edit", "suspend", "export"],
  customers: ["view", "create", "edit", "suspend", "export"],
  wallets: ["view", "create", "approve", "adjust", "export"],
  finance: ["view", "create", "approve", "simulate", "export"],
  pricing: ["view", "edit"],
  restaurants: ["view", "create", "review", "approve", "suspend"],
  food: ["view", "edit"],
  deliveries: ["view", "edit", "verify"],
  support: ["view", "create", "edit"],
  growth: ["view", "create", "edit", "send"],
  analytics: ["view", "export"],
  staff: ["view", "create", "edit", "roles"],
  audit: ["view", "review", "export"],
  settings: ["view", "edit", "backup", "reset"],
} as const;
export type Page = keyof typeof modules;
export interface Role {
  id: string;
  name: string;
  permissions: string[];
}
export interface Staff {
  id: string;
  name: string;
  email: string;
  roleId: string;
  active: boolean;
}
export interface Document {
  name: string;
  status: "Valid" | "Missing" | "Expired" | "Review";
  expires: string;
  file?: string;
}
export interface Driver {
  id: string;
  name: string;
  phone: string;
  email: string;
  ownerId: string;
  plate: string;
  model: string;
  vehicleClass: string;
  status:
    | "Submitted"
    | "Corrections needed"
    | "Second review"
    | "Approved"
    | "Rejected"
    | "Suspended";
  online: boolean;
  services: string[];
  documents: Document[];
  tin: string;
  inspection: boolean;
  version: number;
  firstReviewer?: string;
  reviewedVersion?: number;
  secondReviewer?: string;
  rating: number;
  zone: string;
  lat: number;
  lng: number;
  notes: string;
  vehicleHistory?: {
    plate: string;
    model: string;
    vehicleClass: string;
    retiredAt: string;
    reason: string;
  }[];
}
export interface Customer {
  id: string;
  name: string;
  phone: string;
  email: string;
  status: string;
  source: string;
  joined: string;
  notes: string;
}
export interface Trip {
  id: string;
  customerId: string;
  driverId?: string;
  vehicle?: { plate: string; model: string; vehicleClass: string };
  pickup: string;
  destination: string;
  pickupCoords: [number, number];
  destCoords: [number, number];
  vehicleClass: string;
  status:
    | "Requested"
    | "Assigned"
    | "Accepted"
    | "Arrived"
    | "In progress"
    | "Completed"
    | "Cancelled";
  method: "Cash" | "Chapa";
  payment:
    | "Unpaid"
    | "Pending"
    | "Collected"
    | "Verified"
    | "Failed"
    | "Refunded";
  fare: number;
  originalFare: number;
  commission: number;
  commissionPercent: number;
  distance: number;
  minutes: number;
  pricingVersion: number;
  date: string;
  source: string;
  note: string;
  reservation: number;
  progress: number;
  history: { time: string; text: string }[];
  refundAmount: number;
  collectionChannel: string;
  settled: boolean;
}
export interface Ledger {
  id: string;
  driverId: string;
  tripId?: string;
  account:
    | "wallet"
    | "payable"
    | "commission"
    | "collection"
    | "driverCollection"
    | "refund";
  amount: number;
  kind: string;
  reference: string;
  date: string;
}
export interface FinanceRequest {
  id: string;
  type: "Top-up" | "Credit adjustment" | "Refund" | "Payout";
  driverId: string;
  tripId?: string;
  amount: number;
  status: "Pending approval" | "Approved" | "Rejected" | "Settled" | "Failed";
  createdBy: string;
  approvedBy?: string;
  reason: string;
  date: string;
  refundParty?: string;
  reverseCommission?: boolean;
}
export interface Restaurant {
  id: string;
  name: string;
  owner: string;
  phone: string;
  category: string;
  status: string;
  branches: number;
  commission: number;
  documents: boolean;
  firstReviewer?: string;
  image: string;
}
export interface Order {
  id: string;
  customerId: string;
  restaurantId: string;
  driverId: string;
  status: string;
  total: number;
  fee: number;
  date: string;
  items: string;
}
export interface Delivery {
  id: string;
  sender: string;
  receiver: string;
  phone: string;
  category: string;
  status: string;
  driverId: string;
  fee: number;
  attempts: number;
  otp: string;
  otpExpires: string;
  otpAttempts: number;
  otpSentAt?: string;
  proof?: string;
  destination: string;
  date: string;
  note: string;
}
export interface Ticket {
  id: string;
  subject: string;
  customerId: string;
  driverId: string;
  tripId: string;
  channel: string;
  category: string;
  priority: string;
  status: string;
  assignedTo: string;
  note: string;
  date: string;
  due: string;
}
export interface Promotion {
  id: string;
  name: string;
  type: string;
  value: number;
  budget: number;
  used: number;
  status: string;
  audience: string;
  start: string;
  end: string;
}
export interface Message {
  id: string;
  title: string;
  body: string;
  channel: string;
  audience: string;
  status: string;
  date: string;
  scheduled: string;
}
export interface Audit {
  id: string;
  actorId: string;
  actor: string;
  role: string;
  action: string;
  entity: string;
  time: string;
  reason: string;
  before: string;
  after: string;
  source: string;
  outcome: string;
}
export interface Review {
  id: string;
  subject: string;
  type: string;
  status: string;
  entity: string;
  note: string;
}
export interface Pricing {
  version: number;
  base: number;
  perKm: number;
  perMinute: number;
  waiting: number;
  cancellation: number;
  commissionPercent: number;
  minimumBalance: number;
  deliveryFee: number;
  zone: string;
  radius: number;
}
export interface State {
  schema: 1;
  revision: number;
  seedDate: string;
  roles: Role[];
  staff: Staff[];
  drivers: Driver[];
  customers: Customer[];
  trips: Trip[];
  ledger: Ledger[];
  requests: FinanceRequest[];
  restaurants: Restaurant[];
  orders: Order[];
  deliveries: Delivery[];
  tickets: Ticket[];
  promotions: Promotion[];
  messages: Message[];
  audit: Audit[];
  reviews: Review[];
  pricing: Pricing;
  pricingHistory: {
    date: string;
    actor: string;
    value: Pricing;
    reason: string;
  }[];
  settings: {
    company: string;
    sms: boolean;
    push: boolean;
    rides: boolean;
    food: boolean;
    packages: boolean;
    supportEmail: string;
  };
}
export interface Command {
  type: string;
  id?: string;
  data?: Record<string, unknown>;
  reason?: string;
}
export const money = (n: number) =>
  new Intl.NumberFormat("en-ET", {
    style: "currency",
    currency: "ETB",
    maximumFractionDigits: 2,
  }).format(n / 100);
export const dateLabel = (v: string) =>
  new Intl.DateTimeFormat("en-GB", {
    dateStyle: "medium",
    timeStyle: "short",
    timeZone: "Africa/Addis_Ababa",
  }).format(new Date(v));
export const uid = (prefix: string) =>
  `${prefix}-${crypto.randomUUID().slice(0, 8).toUpperCase()}`;
export function can(s: State, actorId: string, permission: string) {
  const person = s.staff.find((x) => x.id === actorId);
  if (!person?.active) return false;
  const p = s.roles.find((x) => x.id === person.roleId)?.permissions ?? [];
  return p.includes("*") || p.includes(permission);
}
export function balance(
  s: State,
  id: string,
  account: Ledger["account"] = "wallet",
) {
  return s.ledger
    .filter((x) => x.driverId === id && x.account === account)
    .reduce((a, x) => a + x.amount, 0);
}
export function reserved(s: State, id: string) {
  return s.trips
    .filter((x) => x.driverId === id)
    .reduce((a, x) => a + x.reservation, 0);
}
export function payableReserved(s: State, id: string) {
  return s.requests
    .filter(
      (x) =>
        x.driverId === id &&
        x.type === "Payout" &&
        ["Pending approval", "Approved"].includes(x.status),
    )
    .reduce((a, x) => a + x.amount, 0);
}
export function eligibility(s: State, d: Driver, vehicleClass?: string) {
  if (d.status !== "Approved") return d.status;
  if (!d.inspection) return "Inspection required";
  if (!validDriverDocuments(d)) return "Document review required";
  if (!d.online) return "Offline";
  if (balance(s, d.id, "payable") < 0) return "Outstanding recovery balance";
  if (!d.services.includes("Rides")) return "Service not enabled";
  if (vehicleClass && d.vehicleClass !== vehicleClass)
    return "Different vehicle class";
  if (
    s.trips.some(
      (t) =>
        t.driverId === d.id && !["Completed", "Cancelled"].includes(t.status),
    )
  )
    return "On a job";
  if (balance(s, d.id) - reserved(s, d.id) < s.pricing.minimumBalance)
    return "Insufficient prepaid credit";
  return "";
}
export function validDriverDocuments(d: Driver) {
  const required = [
    "Identification",
    "Driving licence",
    "Profile photo",
    "Vehicle registration",
    "Insurance",
    "Vehicle photos",
    "Payment details",
    "TIN certificate",
  ];
  return (
    Boolean(d.tin) &&
    required.every((name) =>
      d.documents.some(
        (doc) =>
          doc.name === name &&
          doc.status === "Valid" &&
          (!["Driving licence", "Insurance"].includes(name) ||
            Boolean(doc.expires)) &&
          (!doc.expires ||
            (Number.isFinite(new Date(doc.expires).getTime()) &&
              new Date(doc.expires).getTime() > Date.now())),
      ),
    )
  );
}
export const normalizePhone = (v: string) => {
  const p = v.replace(/[\s()-]/g, "");
  if (/^(09|07)\d{8}$/.test(p)) return "+251" + p.slice(1);
  if (/^(9|7)\d{8}$/.test(p)) return "+251" + p;
  if (/^\+251[97]\d{8}$/.test(p)) return p;
  throw Error("Enter a valid Ethiopian mobile number.");
};
