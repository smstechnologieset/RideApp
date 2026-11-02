import { useMemo, useRef, useState, type ReactNode } from "react";
import {
  Activity,
  ArrowRight,
  ArrowUpRight,
  Banknote,
  Car,
  Check,
  CheckCheck,
  Clock,
  Download,
  FileCheck,
  FileText,
  MapPin,
  MoreHorizontal,
  Phone,
  Plus,
  RefreshCw,
  ShieldCheck,
  Star,
  Upload,
  Users,
  Wallet,
  X,
} from "lucide-react";
import {
  Badge,
  BarList,
  Button,
  Card,
  DataTable,
  download,
  Empty,
  Facts,
  LineChart,
  Metric,
  Timeline,
  type Field,
} from "./components";
import { useAdmin } from "./context";
import {
  balance,
  can,
  dateLabel,
  eligibility,
  modules,
  money,
  payableReserved,
  reserved,
  type Driver,
  type FinanceRequest,
  type Page,
  type State,
  type Trip,
} from "./domain/model";
import { places, seed } from "./domain/seed";
import { validateBackup } from "./domain/engine";
import OperationsMap from "./OperationsMap";
const number = (v: string) => Math.round(Number(v) * 100);
const reasonField: Field = {
  name: "reason",
  label: "Reason / administrative note",
  type: "textarea",
  required: true,
  wide: true,
};
const driverOptions = (s: State) =>
  s.drivers.map((d) => ({ value: d.id, label: `${d.name} · ${d.plate}` }));
const staffOptions = (s: State) =>
  s.staff.filter((x) => x.active).map((d) => ({ value: d.id, label: d.name }));
function Avatar({ name, photo = false }: { name: string; photo?: boolean }) {
  return photo ? (
    <img
      className="avatar photo"
      src="/images/driver.webp"
      alt="Fictitious demo driver"
    />
  ) : (
    <span className="avatar">
      {name
        .split(" ")
        .slice(0, 2)
        .map((x) => x[0])
        .join("")}
    </span>
  );
}
function Person({
  name,
  sub,
  photo = false,
}: {
  name: string;
  sub?: string;
  photo?: boolean;
}) {
  return (
    <div className="person">
      <Avatar name={name} photo={photo} />
      <div>
        <strong>{name}</strong>
        {sub && <small>{sub}</small>}
      </div>
    </div>
  );
}
function MiniStats({ s }: { s: State }) {
  const completed = s.trips.filter((t) => t.status === "Completed"),
    commission = s.ledger
      .filter((l) => l.account === "commission")
      .reduce((a, x) => a + x.amount, 0);
  return (
    <div className="metric-grid">
      <Metric
        label="Total bookings"
        value={s.trips.length.toLocaleString()}
        note="Across the sample period"
        icon={<Car size={17} />}
      />
      <Metric
        label="Completed trips"
        value={completed.length.toLocaleString()}
        note={`${((completed.length / s.trips.length) * 100).toFixed(1)}% completion rate`}
        icon={<CheckCheck size={17} />}
      />
      <Metric
        label="Platform commission"
        value={money(commission)}
        note="Earned, less recorded reversals"
        icon={<Banknote size={17} />}
      />
      <Metric
        label="Available drivers"
        value={s.drivers.filter((d) => !eligibility(s, d)).length}
        note={`${s.drivers.filter((d) => d.online && d.status === "Approved").length} approved drivers online`}
        icon={<Users size={17} />}
      />
    </div>
  );
}
export function openRecord(
  page: Page,
  id: string,
  panel: ReturnType<typeof useAdmin>["panel"],
) {
  panel(id, <RecordDetails page={page} id={id} />, "Connected sample record");
}
function promptReason(
  form: ReturnType<typeof useAdmin>["form"],
  title: string,
  callback: (r: string) => Promise<boolean>,
  description?: string,
) {
  form({
    title,
    description,
    fields: [reasonField],
    submit: title,
    onSubmit: (v) => callback(v.reason),
  });
}

export function Overview() {
  const { s, actor, go, allowed } = useAdmin(),
    [days, setDays] = useState(30);
  const who = s.staff.find((x) => x.id === actor)!;
  const cutoff = Date.now() - days * 86400000;
  const filtered = s.trips.filter((t) => new Date(t.date).getTime() >= cutoff);
  const values = Array.from(
      { length: days },
      (_, i) =>
        filtered.filter(
          (t) =>
            Math.floor((Date.now() - new Date(t.date).getTime()) / 86400000) ===
            days - i - 1,
        ).length,
    ),
    labels = Array.from({ length: days }, (_, i) =>
      new Date(Date.now() - (days - i - 1) * 86400000).toLocaleDateString(
        "en-GB",
        { month: "short", day: "numeric" },
      ),
    );
  const services = [
    {
      name: "Rides",
      value: s.trips.filter((t) => t.status === "Completed").length,
    },
    {
      name: "Food deliveries",
      value: s.orders.filter((o) => o.status === "Delivered").length,
    },
    {
      name: "Packages",
      value: s.deliveries.filter((d) => d.status === "Delivered").length,
    },
  ];
  const all = services.reduce((a, x) => a + x.value, 0);
  const approval = s.drivers.filter((x) =>
    ["Submitted", "Second review"].includes(x.status),
  );
  return (
    <>
      <div className="page-intro">
        <div>
          <span className="eyebrow">YOUR OPERATIONS, AT A GLANCE</span>
          <h1>
            Good {new Date().getHours() < 12 ? "morning" : "afternoon"},{" "}
            {who.name.split(" ")[0]}
            <span className="greeting-dot">.</span>
          </h1>
          <p>Here’s what’s happening across ZemenGo today.</p>
        </div>
        <label className="date-select">
          <Clock size={16} />
          <select
            aria-label="Dashboard date range"
            value={days}
            onChange={(e) => setDays(Number(e.target.value))}
          >
            <option value={7}>Last 7 days</option>
            <option value={30}>Last 30 days</option>
          </select>
        </label>
      </div>
      <MiniStats s={s} />
      <div className="dashboard-middle">
        <Card
          title="Booking activity"
          subtitle={`Ride requests · last ${days} days · sample data`}
          action={
            <span className="chart-key">
              <i />
              Bookings
            </span>
          }
        >
          <div className="chart-headline">
            <strong>{filtered.length.toLocaleString()}</strong>
            <span>total requests in period</span>
          </div>
          <LineChart values={values} labels={labels} />
        </Card>
        <Card
          title="Completed services"
          subtitle="All services · sample period"
          action={<MoreHorizontal size={18} />}
        >
          <div className="donut-wrap">
            <div
              className="donut"
              style={{
                background: `conic-gradient(#1b50eb 0 ${(services[0].value / all) * 100}%,#6b92fa ${(services[0].value / all) * 100}% ${((services[0].value + services[1].value) / all) * 100}%,#c9d9ff 0)`,
              }}
            >
              <div>
                <strong>{all.toLocaleString()}</strong>
                <span>completed</span>
              </div>
            </div>
            <div className="donut-legend">
              {services.map((v, i) => (
                <div key={v.name}>
                  <span>
                    <i
                      style={{
                        background: ["#1b50eb", "#6b92fa", "#c9d9ff"][i],
                      }}
                    />
                    {v.name}
                  </span>
                  <strong>{v.value.toLocaleString()}</strong>
                  <small>{((v.value / all) * 100).toFixed(1)}%</small>
                </div>
              ))}
            </div>
          </div>
        </Card>
      </div>
      <div className="dashboard-bottom">
        {allowed("operations.view") && (
          <Card
            title="Operations in Addis Ababa"
            subtitle="Driver locations are simulated"
            action={
              <button className="text-link" onClick={() => go("operations")}>
                Open dispatch <ArrowUpRight size={14} />
              </button>
            }
          >
            <OperationsMap
              compact
              drivers={s.drivers}
              trips={s.trips}
              onTrip={() => go("operations")}
            />
          </Card>
        )}
        <Card
          title="Needs your attention"
          subtitle="Your next operational priorities"
        >
          <div className="work-queues">
            {[
              {
                label: "Driver applications",
                count: approval.length,
                sub: "Ready for staff review",
                page: "applications",
                icon: <FileCheck size={18} />,
                color: "blue",
              },
              {
                label: "Payment exceptions",
                count: s.trips.filter(
                  (t) =>
                    t.status === "Completed" &&
                    !["Collected", "Verified"].includes(t.payment),
                ).length,
                sub: "Completed trips awaiting collection",
                page: "finance",
                icon: <Wallet size={18} />,
                color: "orange",
              },
              {
                label: "Open support cases",
                count: s.tickets.filter((t) => t.status !== "Resolved").length,
                sub: "Customer and partner requests",
                page: "support",
                icon: <Phone size={18} />,
                color: "purple",
              },
              {
                label: "Document alerts",
                count: s.drivers.filter((d) =>
                  d.documents.some((x) => x.status !== "Valid"),
                ).length,
                sub: "Missing or expired documents",
                page: "drivers",
                icon: <ShieldCheck size={18} />,
                color: "green",
              },
            ]
              .filter((x) => allowed(x.page + ".view"))
              .map((q) => (
                <button key={q.label} onClick={() => go(q.page as Page)}>
                  <span className={`queue-icon ${q.color}`}>{q.icon}</span>
                  <span>
                    <strong>{q.label}</strong>
                    <small>{q.sub}</small>
                  </span>
                  <b>{q.count}</b>
                  <ArrowRight size={16} />
                </button>
              ))}
          </div>
        </Card>
      </div>
      {allowed("trips.view") && (
        <Card
          title="Recent trips"
          subtitle="Latest ride requests and outcomes"
          action={
            <button className="text-link" onClick={() => go("trips")}>
              View all trips <ArrowRight size={14} />
            </button>
          }
        >
          <TripTable rows={s.trips.slice(0, 6)} compact />
        </Card>
      )}
      <div className="overview-footer">
        <ShieldCheck size={14} />
        Connected sample data · Local persistence enabled
        <span>All times in Addis Ababa · ETB</span>
      </div>
    </>
  );
}

function TripTable({
  rows,
  compact = false,
}: {
  rows: Trip[];
  compact?: boolean;
}) {
  const { s, panel, exportRows, allowed } = useAdmin();
  return (
    <DataTable
      rows={rows}
      title="trips"
      onRow={(t) => openRecord("trips", t.id, panel)}
      onExport={
        !compact && allowed("trips.export")
          ? (r) => void exportRows(r, "trips", "trips.export")
          : undefined
      }
      columns={[
        {
          key: "id",
          label: "Trip ID",
          render: (t) => <span className="record-id">{t.id}</span>,
        },
        {
          key: "customerId",
          label: "Customer",
          render: (t) => (
            <Person
              name={
                s.customers.find((x) => x.id === t.customerId)?.name ??
                t.customerId
              }
              sub={t.source}
            />
          ),
        },
        {
          key: "pickup",
          label: "Route",
          render: (t) => (
            <div className="route-cell">
              <span>
                <i className="route-dot" />
                {t.pickup}
              </span>
              <span>
                <i className="route-dot blue" />
                {t.destination}
              </span>
            </div>
          ),
        },
        {
          key: "status",
          label: "Trip status",
          render: (t) => <Badge>{t.status}</Badge>,
        },
        {
          key: "fare",
          label: "Fare",
          render: (t) => <strong>{money(t.fare)}</strong>,
        },
        {
          key: "method",
          label: "Payment",
          render: (t) => (
            <div>
              {t.method}
              <small className="muted block">{t.payment}</small>
            </div>
          ),
        },
      ]}
    />
  );
}

export function BookingButton() {
  const { s, form, run, allowed } = useAdmin();
  if (!allowed("trips.create") && !allowed("operations.create")) return null;
  return (
    <Button
      onClick={() =>
        form({
          title: "Create a phone booking",
          description:
            "Confirm the caller’s locations. Dispatch and driver events use sample data.",
          initial: {
            customerId: s.customers[1].id,
            pickup: places[0][0],
            destination: places[1][0],
            vehicleClass: "Standard",
            distance: "7.1",
            minutes: "17",
            method: "Cash",
          },
          fields: [
            {
              name: "customerId",
              label: "Existing customer",
              options: s.customers
                .slice(0, 100)
                .map((c) => ({ value: c.id, label: `${c.name} · ${c.phone}` })),
            },
            {
              name: "name",
              label: "New caller name",
              hint: "Only needed when no customer is selected.",
            },
            { name: "phone", label: "New caller phone" },
            {
              name: "vehicleClass",
              label: "Vehicle class",
              options: ["Standard", "Comfort", "XL"],
              required: true,
            },
            {
              name: "pickup",
              label: "Confirmed pickup",
              options: places.map((p) => p[0]),
              required: true,
            },
            {
              name: "destination",
              label: "Confirmed destination",
              options: places.map((p) => p[0]),
              required: true,
            },
            {
              name: "distance",
              label: "Estimated route distance (km)",
              type: "number",
              required: true,
            },
            {
              name: "minutes",
              label: "Estimated duration (minutes)",
              type: "number",
              required: true,
            },
            {
              name: "method",
              label: "Payment method",
              options: ["Cash", "Chapa"],
              required: true,
            },
            {
              name: "note",
              label: "Pickup instructions",
              type: "textarea",
              wide: true,
            },
          ],
          submit: "Create booking",
          onSubmit: (v) =>
            run({
              type: "tripCreate",
              data: {
                ...v,
                pickupCoords: places.find((x) => x[0] === v.pickup)?.[1],
                destCoords: places.find((x) => x[0] === v.destination)?.[1],
              },
            }),
        })
      }
    >
      <Plus size={17} />
      Create booking
    </Button>
  );
}
export function TripsPage() {
  const { s } = useAdmin();
  return (
    <>
      <PageHeading
        title="Trips"
        detail="Every booking, from the first request to the final receipt."
        action={<BookingButton />}
      />
      <MiniStats s={s} />
      <Card>
        <TripTable rows={s.trips} />
      </Card>
    </>
  );
}
export function PageHeading({
  title,
  detail,
  action,
}: {
  title: string;
  detail: string;
  action?: ReactNode;
}) {
  return (
    <div className="page-heading">
      <div>
        <h1>{title}</h1>
        <p>{detail}</p>
      </div>
      <div className="page-actions">{action}</div>
    </div>
  );
}
export function DispatchPage() {
  const { s, panel, go } = useAdmin(),
    [selected, setSelected] = useState(
      s.trips.find((t) => t.status === "In progress")?.id ?? s.trips[0]?.id,
    ),
    [filter, setFilter] = useState("Active trips");
  const t = s.trips.find((x) => x.id === selected),
    active = s.trips.filter(
      (x) => !["Completed", "Cancelled"].includes(x.status),
    );
  return (
    <>
      <PageHeading
        title="Live operations"
        detail="Addis Ababa dispatch · real basemap when connected, simulated trips and positions."
        action={<BookingButton />}
      />
      <div className="dispatch-summary">
        <span>
          <i className="online-dot" />
          {s.drivers.filter((d) => !eligibility(s, d)).length} available drivers
        </span>
        <span>
          <Car size={15} />
          {active.length} active requests
        </span>
        <span>
          <Clock size={15} />
          {active.filter((t) => !t.driverId).length} awaiting assignment
        </span>
      </div>
      <div className="dispatch-layout">
        <Card className="dispatch-map-card">
          <OperationsMap drivers={s.drivers} trips={s.trips} selected={t} />
          {t && (
            <div className="map-trip-card">
              <div>
                <span className="record-id">{t.id}</span>
                <strong>
                  {t.pickup} <ArrowRight size={13} /> {t.destination}
                </strong>
                <small>
                  {s.drivers.find((d) => d.id === t.driverId)?.name ??
                    "Unassigned"}{" "}
                  · {money(t.fare)}
                </small>
              </div>
              <Badge>{t.status}</Badge>
              <button
                className="text-link"
                onClick={() => openRecord("trips", t.id, panel)}
              >
                Manage trip <ArrowRight size={15} />
              </button>
            </div>
          )}
        </Card>
        <Card title="Dispatch queue" subtitle="Select a trip to view its route">
          <div className="segment">
            <button
              className={filter === "Active trips" ? "selected" : ""}
              onClick={() => setFilter("Active trips")}
            >
              Active trips
            </button>
            <button
              className={filter === "Drivers" ? "selected" : ""}
              onClick={() => setFilter("Drivers")}
            >
              Drivers
            </button>
          </div>
          <div className="dispatch-list">
            {filter === "Active trips"
              ? active.map((trip) => (
                  <button
                    className={selected === trip.id ? "selected" : ""}
                    key={trip.id}
                    onClick={() => setSelected(trip.id)}
                  >
                    <div>
                      <strong>{trip.id}</strong>
                      <Badge>{trip.status}</Badge>
                    </div>
                    <p>
                      {trip.pickup}
                      <ArrowRight size={13} />
                      {trip.destination}
                    </p>
                    <small>
                      {s.customers.find((c) => c.id === trip.customerId)?.name}{" "}
                      · {trip.vehicleClass}
                    </small>
                  </button>
                ))
              : s.drivers.slice(0, 40).map((d) => (
                  <button key={d.id} onClick={() => go("drivers", d.id)}>
                    <Person name={d.name} sub={d.plate} />
                    <small>
                      {eligibility(s, d) || "Available for dispatch"}
                    </small>
                  </button>
                ))}
          </div>
        </Card>
      </div>
    </>
  );
}

export function ApplicationsPage() {
  const { s, panel } = useAdmin();
  const rows = s.drivers.filter(
    (d) => d.status !== "Approved" && d.status !== "Suspended",
  );
  return (
    <>
      <PageHeading
        title="Driver applications"
        detail="Review the people and vehicles joining Zemen Pro."
      />
      <div className="metric-grid">
        <Metric
          label="Applications to review"
          value={rows.length}
          note="Submitted through simulated Zemen Pro"
          icon={<FileText size={17} />}
        />
        <Metric
          label="Second approval"
          value={rows.filter((d) => d.status === "Second review").length}
          note="Requires a different staff account"
          icon={<ShieldCheck size={17} />}
        />
        <Metric
          label="Corrections requested"
          value={rows.filter((d) => d.status === "Corrections needed").length}
          note="Waiting for applicant evidence"
          icon={<RefreshCw size={17} />}
        />
        <Metric
          label="Approved partners"
          value={s.drivers.filter((d) => d.status === "Approved").length}
          note="Driver workspace access granted"
          icon={<CheckCheck size={17} />}
        />
      </div>
      <Card>
        <DataTable
          rows={rows}
          title="applications"
          onRow={(d) => openRecord("applications", d.id, panel)}
          columns={[
            {
              key: "name",
              label: "Applicant",
              render: (d) => (
                <Person name={d.name} sub={d.id} photo={d.id === "DRV-001"} />
              ),
            },
            {
              key: "plate",
              label: "Vehicle",
              render: (d) => (
                <div>
                  <strong>{d.plate}</strong>
                  <small className="block muted">{d.model}</small>
                </div>
              ),
            },
            {
              key: "documents",
              label: "Documents",
              render: (d) => (
                <span>
                  {d.documents.filter((x) => x.status === "Valid").length} /{" "}
                  {d.documents.length} complete
                </span>
              ),
            },
            {
              key: "inspection",
              label: "Inspection",
              render: (d) => (
                <Badge>{d.inspection ? "Passed" : "Required"}</Badge>
              ),
            },
            {
              key: "status",
              label: "Review stage",
              render: (d) => <Badge>{d.status}</Badge>,
            },
            { key: "version", label: "Evidence version" },
          ]}
        />
      </Card>
      <div className="info-strip">
        <ShieldCheck size={18} />
        <div>
          <strong>Independent approval, by design.</strong> The first reviewer
          cannot provide final approval. Changes to evidence restart the review.
        </div>
      </div>
    </>
  );
}
export function DriversPage() {
  const { s, panel, exportRows, allowed } = useAdmin();
  return (
    <>
      <PageHeading
        title="Drivers & vehicles"
        detail="Independent partners, one active car per owner. Rides and deliveries through Zemen Pro."
      />
      <div className="metric-grid">
        <Metric
          label="Total partners"
          value={s.drivers.length}
          note="Including applications"
        />
        <Metric
          label="Approved"
          value={s.drivers.filter((d) => d.status === "Approved").length}
          note="Driver access enabled"
        />
        <Metric
          label="Available now"
          value={s.drivers.filter((d) => !eligibility(s, d)).length}
          note="Eligible for new ride assignment"
        />
        <Metric
          label="Document attention"
          value={
            s.drivers.filter((d) =>
              d.documents.some((x) => x.status !== "Valid"),
            ).length
          }
          note="Missing or expired evidence"
        />
      </div>
      <Card>
        <DataTable
          rows={s.drivers}
          title="drivers"
          onRow={(d) => openRecord("drivers", d.id, panel)}
          onExport={
            allowed("drivers.export")
              ? (r) => void exportRows(r, "drivers", "drivers.export")
              : undefined
          }
          columns={[
            {
              key: "name",
              label: "Driver",
              render: (d) => (
                <Person
                  name={d.name}
                  sub={d.phone}
                  photo={d.id === "DRV-001"}
                />
              ),
            },
            {
              key: "vehicleClass",
              label: "Vehicle",
              render: (d) => (
                <div className="vehicle-cell">
                  <img
                    src={`/images/${d.vehicleClass === "Comfort" ? "comfort" : d.vehicleClass === "XL" ? "xl" : "standard"}.webp`}
                    alt={d.vehicleClass}
                  />
                  <div>
                    <strong>{d.plate}</strong>
                    <small>{d.model}</small>
                  </div>
                </div>
              ),
            },
            {
              key: "status",
              label: "Status",
              render: (d) => <Badge>{d.status}</Badge>,
            },
            { key: "zone", label: "Zone" },
            {
              key: "rating",
              label: "Rating",
              render: (d) => (
                <span className="rating">
                  <Star size={13} />
                  {d.rating.toFixed(1)}
                </span>
              ),
            },
            {
              key: "id",
              label: "Available credit",
              render: (d) => money(balance(s, d.id) - reserved(s, d.id)),
            },
          ]}
        />
      </Card>
    </>
  );
}
function DriverDetails({ id }: { id: string }) {
  const { s, form, run, allowed, panel, notice } = useAdmin();
  const d = s.drivers.find((x) => x.id === id)!;
  const upload = useRef<HTMLInputElement>(null),
    [docName, setDocName] = useState("Identification");
  const evidence = (name: string) =>
    form({
      title: "Update sample evidence",
      description:
        "Updating evidence restarts the two-person review. Uploaded files remain on this laptop.",
      initial: {
        document: name,
        expires: new Date(Date.now() + 365 * 86400000)
          .toISOString()
          .slice(0, 10),
      },
      fields: [
        { name: "expires", label: "Valid until (if applicable)", type: "date" },
        reasonField,
      ],
      onSubmit: (v) =>
        run({
          type: "driverEvidence",
          id,
          data: { document: name, expires: v.expires },
          reason: v.reason,
        }),
    });
  return (
    <>
      <div className="profile-hero">
        <Avatar name={d.name} photo={id === "DRV-001"} />
        <div>
          <h2>{d.name}</h2>
          <p>
            {d.id} · {d.phone}
          </p>
          <Badge>{d.status}</Badge>
        </div>
        <img
          className="hero-car"
          src={`/images/${d.vehicleClass === "Comfort" ? "comfort" : d.vehicleClass === "XL" ? "xl" : "standard"}.webp`}
          alt={d.model}
        />
      </div>
      <Facts
        items={[
          ["Vehicle", `${d.model} · ${d.plate}`],
          ["Owner", d.ownerId],
          ["Class", d.vehicleClass],
          ["Zone", d.zone],
          ["TIN", allowed("applications.documents") ? d.tin : "Restricted"],
          ["Inspection", d.inspection ? "Passed" : "Required"],
          ["Prepaid credit", money(balance(s, id))],
          ["Dispatch", eligibility(s, d) || "Available"],
          ["Services", d.services.join(", ")],
          ["Evidence version", String(d.version)],
        ]}
      />
      <h3 className="section-label">Required documents</h3>
      <div className="document-list">
        {d.documents.map((doc) => (
          <div key={doc.name}>
            <FileText size={20} />
            <div>
              <strong>{doc.name}</strong>
              <small>
                {doc.expires
                  ? "Valid until " +
                    new Date(doc.expires).toLocaleDateString("en-GB")
                  : "Required applicant evidence"}
              </small>
            </div>
            <Badge>{doc.status}</Badge>
            {allowed("applications.documents") && (
              <button
                className="text-link"
                onClick={async () => {
                  if (
                    await run({
                      type: "documentView",
                      id,
                      data: { document: doc.name },
                    })
                  )
                    panel(
                      doc.name,
                      <div className="demo-document">
                        <span>DEMO · SYNTHETIC EVIDENCE</span>
                        <FileCheck size={45} />
                        <h2>{doc.name}</h2>
                        <p>
                          {d.name} · {d.id}
                        </p>
                        <p>
                          {d.plate} · Evidence version {d.version}
                        </p>
                        <Badge>{doc.status}</Badge>
                        {doc.file?.startsWith("data:image/") && (
                          <img src={doc.file} alt="Uploaded sample document" />
                        )}
                        {doc.file?.startsWith("data:application/pdf") && (
                          <iframe title="Uploaded sample PDF" src={doc.file} />
                        )}
                        <p>
                          This sample represents the document review workflow.
                        </p>
                      </div>,
                    );
                }}
              >
                View
              </button>
            )}
            {allowed("applications.edit") && (
              <button
                className="icon-btn"
                title={"Update " + doc.name}
                onClick={() => evidence(doc.name)}
              >
                <RefreshCw size={14} />
              </button>
            )}
          </div>
        ))}
      </div>
      <div className="action-wrap">
        {allowed("applications.edit") && (
          <>
            <select
              aria-label="Sample evidence type"
              value={docName}
              onChange={(e) => setDocName(e.target.value)}
            >
              {d.documents.map((doc) => (
                <option key={doc.name}>{doc.name}</option>
              ))}
            </select>
            <Button
              variant="secondary small"
              onClick={() => {
                upload.current?.click();
              }}
            >
              <Upload size={14} />
              Upload sample evidence
            </Button>
            <input
              type="file"
              hidden
              ref={upload}
              accept="image/png,image/jpeg,image/webp,application/pdf"
              onChange={(e) => {
                const f = e.target.files?.[0];
                if (!f) return;
                if (f.size > 2 * 1024 * 1024) {
                  notice("Use a file below 2 MB.", true);
                  return;
                }
                const reader = new FileReader();
                reader.onload = () =>
                  void run({
                    type: "driverEvidence",
                    id,
                    data: {
                      document: docName,
                      file: reader.result,
                      expires: new Date(
                        Date.now() + 365 * 86400000,
                      ).toISOString(),
                    },
                    reason: "Sample evidence uploaded by staff",
                  });
                reader.readAsDataURL(f);
              }}
            />
            <Button
              variant="secondary small"
              onClick={() =>
                promptReason(form, "Record passed inspection", (r) =>
                  run({
                    type: "driverEvidence",
                    id,
                    data: { passed: true },
                    reason: r,
                  }),
                )
              }
            >
              <Car size={14} />
              Record inspection
            </Button>
          </>
        )}
        {allowed("applications.review") &&
          ["Submitted", "Corrections needed", "Rejected"].includes(
            d.status,
          ) && (
            <Button
              onClick={() =>
                promptReason(form, "Complete first review", (r) =>
                  run({
                    type: "driverReview",
                    id,
                    data: { decision: "First review" },
                    reason: r,
                  }),
                )
              }
            >
              <Check size={15} />
              First review
            </Button>
          )}
        {allowed("applications.approve") && d.status === "Second review" && (
          <Button
            onClick={() =>
              promptReason(
                form,
                "Give final approval",
                (r) =>
                  run({
                    type: "driverReview",
                    id,
                    data: { decision: "Approve" },
                    reason: r,
                  }),
                "A different staff account must approve the same evidence version.",
              )
            }
          >
            <ShieldCheck size={15} />
            Final approval
          </Button>
        )}
        {allowed("applications.review") &&
          !["Approved", "Suspended"].includes(d.status) && (
            <>
              <Button
                variant="secondary"
                onClick={() =>
                  promptReason(form, "Request corrections", (r) =>
                    run({
                      type: "driverReview",
                      id,
                      data: { decision: "Corrections needed" },
                      reason: r,
                    }),
                  )
                }
              >
                Corrections
              </Button>
              <Button
                variant="danger"
                onClick={() =>
                  promptReason(form, "Reject application", (r) =>
                    run({
                      type: "driverReview",
                      id,
                      data: { decision: "Reject" },
                      reason: r,
                    }),
                  )
                }
              >
                Reject
              </Button>
            </>
          )}
        {allowed("drivers.edit") && d.status === "Approved" && (
          <Button
            variant="secondary"
            onClick={() =>
              run({ type: "driverState", id, data: { online: !d.online } })
            }
          >
            {d.online ? "Set offline" : "Set online"}
          </Button>
        )}
        {allowed("drivers.edit") &&
          ["Approved", "Suspended"].includes(d.status) && (
            <Button
              variant="secondary"
              onClick={() =>
                form({
                  title: "Replace vehicle",
                  description:
                    "Past trips keep the previous vehicle. The replacement needs new vehicle documents, an inspection and two staff approvals before dispatch.",
                  fields: [
                    {
                      name: "plate",
                      label: "Replacement plate",
                      required: true,
                    },
                    {
                      name: "model",
                      label: "Vehicle make and model",
                      required: true,
                    },
                    {
                      name: "vehicleClass",
                      label: "Service class",
                      options: ["Standard", "Comfort", "XL"],
                      required: true,
                    },
                    reasonField,
                  ],
                  onSubmit: (values) =>
                    run({
                      type: "vehicleReplace",
                      id,
                      data: values,
                      reason: values.reason,
                    }),
                })
              }
            >
              Replace vehicle
            </Button>
          )}
        {allowed("drivers.suspend") &&
          ["Approved", "Suspended"].includes(d.status) && (
            <Button
              variant="danger"
              onClick={() =>
                promptReason(
                  form,
                  d.status === "Suspended"
                    ? "Reactivate driver"
                    : "Suspend driver",
                  (r) =>
                    run({
                      type: "driverState",
                      id,
                      data: {
                        status:
                          d.status === "Suspended" ? "Approved" : "Suspended",
                      },
                      reason: r,
                    }),
                )
              }
            >
              {d.status === "Suspended" ? "Reactivate" : "Suspend"}
            </Button>
          )}
      </div>
      <Card title="Approval trail">
        <Facts
          items={[
            [
              "First reviewer",
              s.staff.find((x) => x.id === d.firstReviewer)?.name ??
                "Awaiting review",
            ],
            ["Reviewed version", d.reviewedVersion ?? "—"],
            [
              "Final approver",
              s.staff.find((x) => x.id === d.secondReviewer)?.name ??
                "Awaiting approval",
            ],
            ["Latest note", d.notes],
          ]}
        />
      </Card>
      {Boolean(d.vehicleHistory?.length) && (
        <Card title="Previous vehicles">
          <Timeline
            items={d.vehicleHistory!.map((vehicle) => ({
              time: vehicle.retiredAt,
              text: `${vehicle.model} · ${vehicle.plate} · ${vehicle.vehicleClass}. ${vehicle.reason}`,
            }))}
          />
        </Card>
      )}
      <RecordAudit id={id} />
    </>
  );
}
function TripDetails({ id }: { id: string }) {
  const { s, form, run, allowed, go } = useAdmin();
  const t = s.trips.find((x) => x.id === id)!;
  const d = s.drivers.find((x) => x.id === t.driverId),
    c = s.customers.find((x) => x.id === t.customerId);
  const perm = (x: string) =>
    allowed("trips." + x) || allowed("operations." + x);
  return (
    <>
      <div className="trip-detail-head">
        <strong>{money(t.fare)}</strong>
        <Badge>{t.status}</Badge>
        <p>
          {t.method} · <Badge>{t.payment}</Badge>
        </p>
      </div>
      <div className="route-detail">
        <span>
          <i className="route-dot" />
          {t.pickup}
        </span>
        <span>
          <i className="route-dot blue" />
          {t.destination}
        </span>
      </div>
      <Facts
        items={[
          [
            "Customer",
            <button
              className="text-link"
              onClick={() => go("customers", t.customerId)}
            >
              {c?.name}
            </button>,
          ],
          [
            "Driver",
            d ? (
              <button className="text-link" onClick={() => go("drivers", d.id)}>
                {d.name} · {t.vehicle?.plate ?? d.plate}
              </button>
            ) : (
              "Unassigned"
            ),
          ],
          [
            "Vehicle",
            t.vehicle
              ? `${t.vehicle.model} · ${t.vehicle.plate} · ${t.vehicle.vehicleClass}`
              : t.vehicleClass,
          ],
          ["Source", t.source],
          ["Route estimate", `${t.distance} km · ${t.minutes} min`],
          ["Pricing version", String(t.pricingVersion)],
          ["Original quote", money(t.originalFare)],
          ["Commission", money(t.commission)],
          ["Reserved credit", money(t.reservation)],
          ["Collection channel", t.collectionChannel],
          ["Created", dateLabel(t.date)],
          ["Refunded", money(t.refundAmount)],
        ]}
      />
      <div className="action-wrap">
        {perm("assign") &&
          ["Requested", "Assigned", "Accepted", "Arrived"].includes(
            t.status,
          ) && (
            <Button
              onClick={() =>
                form({
                  title: t.driverId
                    ? "Reassign driver"
                    : "Assign eligible driver",
                  description:
                    "Only available, approved drivers with valid documents, matching class and sufficient credit can be assigned.",
                  fields: [
                    {
                      name: "driverId",
                      label: "Available driver",
                      required: true,
                      options: s.drivers
                        .filter((v) => !eligibility(s, v, t.vehicleClass))
                        .map((v) => ({
                          value: v.id,
                          label: `${v.name} · ${v.plate} · ${money(balance(s, v.id) - reserved(s, v.id))}`,
                        })),
                    },
                    reasonField,
                  ],
                  submit: "Assign driver",
                  onSubmit: (v) =>
                    run({
                      type: "tripAssign",
                      id,
                      data: { driverId: v.driverId },
                      reason: v.reason,
                    }),
                })
              }
            >
              <Car size={15} />
              {t.driverId ? "Reassign" : "Assign driver"}
            </Button>
          )}
        {perm("advance") &&
          !["Requested", "Completed", "Cancelled"].includes(t.status) && (
            <Button onClick={() => run({ type: "tripAdvance", id })}>
              {
                (
                  {
                    Assigned: "Simulate acceptance",
                    Accepted: "Mark arrived",
                    Arrived: "Start demo trip",
                    "In progress": "Complete demo trip",
                  } as Record<string, string>
                )[t.status]
              }
              <ArrowRight size={15} />
            </Button>
          )}
        {perm("advance") && t.status === "In progress" && (
          <Button
            variant="secondary"
            onClick={() => run({ type: "tripProgress", id })}
          >
            Advance position
          </Button>
        )}
        {perm("adjust") && !["Completed", "Cancelled"].includes(t.status) && (
          <Button
            variant="secondary"
            onClick={() =>
              form({
                title: "Adjust quoted fare",
                initial: { amount: String(t.fare / 100) },
                fields: [
                  {
                    name: "amount",
                    label: "Updated fare (ETB)",
                    type: "number",
                    required: true,
                  },
                  reasonField,
                ],
                onSubmit: (v) =>
                  run({
                    type: "tripAdjust",
                    id,
                    data: { amount: number(v.amount) },
                    reason: v.reason,
                  }),
              })
            }
          >
            Adjust fare
          </Button>
        )}
        {perm("cancel") && !["Completed", "Cancelled"].includes(t.status) && (
          <Button
            variant="danger"
            onClick={() =>
              promptReason(
                form,
                "Cancel trip",
                (r) => run({ type: "tripCancel", id, reason: r }),
                "This demo cancellation waives the fee and releases reserved credit.",
              )
            }
          >
            Cancel trip
          </Button>
        )}
        {allowed("finance.simulate") &&
          t.status === "Completed" &&
          !["Collected", "Verified", "Refunded"].includes(t.payment) && (
            <Button
              onClick={() =>
                form({
                  title: "Record simulated payment outcome",
                  initial: {
                    outcome: "Success",
                    channel: t.method === "Cash" ? "Cash" : "Chapa",
                  },
                  fields: [
                    {
                      name: "outcome",
                      label: "Outcome",
                      options: ["Success", "Pending", "Failed"],
                      required: true,
                    },
                    ...(t.method === "Cash"
                      ? [
                          {
                            name: "channel",
                            label: "Collection channel",
                            options: ["Cash", "External transfer to driver"],
                          },
                        ]
                      : []),
                    reasonField,
                  ],
                  submit: "Record outcome",
                  onSubmit: (v) =>
                    run({ type: "tripPayment", id, data: v, reason: v.reason }),
                })
              }
            >
              {t.method === "Cash"
                ? "Record driver collection"
                : "Simulate Chapa result"}
            </Button>
          )}
        <Button variant="secondary" onClick={() => window.print()}>
          <FileText size={14} />
          Print / PDF
        </Button>
      </div>
      {d && (
        <Card title="Partner">
          <Person
            name={d.name}
            sub={`${d.model} · ${d.plate}`}
            photo={d.id === "DRV-001"}
          />
        </Card>
      )}
      <h3 className="section-label">Trip timeline</h3>
      <Timeline items={t.history} />
      <h3 className="section-label">Linked financial entries</h3>
      <div className="compact-list">
        {s.ledger
          .filter((l) => l.tripId === id)
          .map((l) => (
            <div key={l.id}>
              <span>
                <strong>{l.kind}</strong>
                <small>
                  {l.account} · {l.reference}
                </small>
              </span>
              <b>{money(l.amount)}</b>
            </div>
          ))}
      </div>
      <RecordAudit id={id} />
    </>
  );
}
function RecordAudit({ id }: { id: string }) {
  const { s, allowed } = useAdmin();
  if (!allowed("audit.view")) return null;
  const records = s.audit.filter((a) => a.entity === id).slice(0, 10);
  return (
    <>
      <h3 className="section-label">Administrative history</h3>
      {records.length ? (
        <Timeline
          items={records.map((a) => ({
            time: a.time,
            text: `${a.actor}: ${a.action}${a.reason ? " · " + a.reason : ""}`,
          }))}
        />
      ) : (
        <p className="muted">No staff changes to this sample record yet.</p>
      )}
    </>
  );
}
export function CustomersPage() {
  const { s, form, run, panel, allowed, exportRows } = useAdmin();
  const create = () =>
    form({
      title: "Create customer",
      fields: [
        { name: "name", label: "Full name", required: true },
        { name: "phone", label: "Ethiopian mobile", required: true },
        { name: "email", label: "Email", type: "email" },
        { name: "notes", label: "Internal note", type: "textarea", wide: true },
      ],
      onSubmit: (v) => run({ type: "customerSave", data: v }),
    });
  return (
    <>
      <PageHeading
        title="Customers"
        detail="People, journeys and customer relationships in one place."
        action={
          allowed("customers.create") && (
            <Button onClick={create}>
              <Plus size={16} />
              Add customer
            </Button>
          )
        }
      />
      <Card>
        <DataTable
          rows={s.customers}
          title="customers"
          onRow={(c) => openRecord("customers", c.id, panel)}
          onExport={
            allowed("customers.export")
              ? (r) => void exportRows(r, "customers", "customers.export")
              : undefined
          }
          columns={[
            {
              key: "name",
              label: "Customer",
              render: (c) => <Person name={c.name} sub={c.id} />,
            },
            { key: "phone", label: "Phone" },
            { key: "source", label: "Joined through" },
            {
              key: "status",
              label: "Account",
              render: (c) => <Badge>{c.status}</Badge>,
            },
            {
              key: "id",
              label: "Trips",
              render: (c) =>
                s.trips.filter((t) => t.customerId === c.id).length,
            },
            {
              key: "joined",
              label: "Joined",
              render: (c) => new Date(c.joined).toLocaleDateString("en-GB"),
            },
          ]}
        />
      </Card>
    </>
  );
}

export function FinanceRequestButton({
  type = "Top-up",
  driverId,
  tripId,
}: {
  type?: FinanceRequest["type"];
  driverId?: string;
  tripId?: string;
}) {
  const { s, form, run, allowed } = useAdmin();
  const permission =
    type === "Top-up"
      ? "wallets.create"
      : type === "Credit adjustment"
        ? "wallets.adjust"
        : "finance.create";
  if (!allowed(permission)) return null;
  return (
    <Button
      variant={type === "Top-up" ? "" : "secondary"}
      onClick={() =>
        form({
          title: `Request ${type.toLowerCase()}`,
          description:
            type === "Refund"
              ? "Refund approval and actual refund confirmation are separate. Choose the driver linked to the collected trip."
              : "A different staff account must approve the request.",
          initial: {
            type,
            driverId: driverId ?? "",
            tripId: tripId ?? "",
            reverseCommission: "No",
          },
          fields: [
            {
              name: "driverId",
              label: "Driver",
              options: driverOptions(s),
              required: true,
            },
            ...(type === "Refund"
              ? [
                  {
                    name: "tripId",
                    label: "Collected trip",
                    options: s.trips
                      .filter((t) =>
                        ["Collected", "Verified"].includes(t.payment),
                      )
                      .slice(0, 150)
                      .map((t) => ({
                        value: t.id,
                        label: `${t.id} · ${money(t.fare - t.refundAmount)} · ${s.drivers.find((d) => d.id === t.driverId)?.name}`,
                      })),
                    required: true,
                  },
                  {
                    name: "reverseCommission",
                    label: "Request commission reversal",
                    options: ["No", "Yes"],
                    required: true,
                  },
                ]
              : []),
            {
              name: "amount",
              label: "Amount (ETB)",
              type: "number",
              required: true,
            },
            reasonField,
          ],
          submit: "Submit for approval",
          onSubmit: (v) =>
            run({
              type: "financeRequest",
              data: {
                ...v,
                type,
                amount: number(v.amount),
                reverseCommission: v.reverseCommission === "Yes",
              },
              reason: v.reason,
            }),
        })
      }
    >
      <Plus size={15} />
      {type === "Top-up" ? "Record top-up" : type}
    </Button>
  );
}
function RequestTable({ rows }: { rows: FinanceRequest[] }) {
  const { s, panel } = useAdmin();
  return (
    <DataTable
      rows={rows}
      title="financial requests"
      onRow={(r) => openRecord("finance", r.id, panel)}
      columns={[
        {
          key: "id",
          label: "Reference",
          render: (r) => <span className="record-id">{r.id}</span>,
        },
        { key: "type", label: "Request type" },
        {
          key: "driverId",
          label: "Partner",
          render: (r) => s.drivers.find((x) => x.id === r.driverId)?.name,
        },
        {
          key: "amount",
          label: "Amount",
          render: (r) => <strong>{money(r.amount)}</strong>,
        },
        {
          key: "status",
          label: "Status",
          render: (r) => <Badge>{r.status}</Badge>,
        },
        {
          key: "createdBy",
          label: "Submitted by",
          render: (r) => s.staff.find((x) => x.id === r.createdBy)?.name,
        },
      ]}
    />
  );
}
export function WalletsPage() {
  const { s, allowed, panel, exportRows } = useAdmin(),
    [tab, setTab] = useState("Balances");
  const rows = s.drivers.map((d) => ({
    ...d,
    posted: balance(s, d.id),
    held: reserved(s, d.id),
    available: balance(s, d.id) - reserved(s, d.id),
  }));
  return (
    <>
      <PageHeading
        title="Driver prepaid balances"
        detail="Every deposit, reservation and commission deduction has a traceable entry."
        action={
          <>
            <FinanceRequestButton type="Credit adjustment" />
            <FinanceRequestButton />
          </>
        }
      />
      <div className="metric-grid">
        <Metric
          label="Prepaid deposits, net"
          value={money(rows.reduce((a, x) => a + x.posted, 0))}
          note="Driver credit · not company revenue"
        />
        <Metric
          label="Commission reserved"
          value={money(rows.reduce((a, x) => a + x.held, 0))}
          note="Cash jobs awaiting completion"
        />
        <Metric
          label="Below minimum credit"
          value={
            rows.filter((x) => x.available < s.pricing.minimumBalance).length
          }
          note={`Minimum ${money(s.pricing.minimumBalance)}`}
        />
        <Metric
          label="Awaiting approval"
          value={
            s.requests.filter(
              (x) =>
                ["Top-up", "Credit adjustment"].includes(x.type) &&
                x.status === "Pending approval",
            ).length
          }
          note="Independent finance review"
        />
      </div>
      <div className="tabs">
        {["Balances", "Top-ups & adjustments", "Ledger"].map((x) => (
          <button
            className={tab === x ? "active" : ""}
            onClick={() => setTab(x)}
            key={x}
          >
            {x}
          </button>
        ))}
      </div>
      <Card>
        {tab === "Balances" ? (
          <DataTable
            rows={rows}
            title="driver balances"
            onRow={(d) => openRecord("wallets", d.id, panel)}
            onExport={
              allowed("wallets.export")
                ? (r) => void exportRows(r, "driver-balances", "wallets.export")
                : undefined
            }
            columns={[
              {
                key: "name",
                label: "Driver",
                render: (d) => <Person name={d.name} sub={d.plate} />,
              },
              {
                key: "posted",
                label: "Posted balance",
                render: (d) => money(d.posted),
              },
              { key: "held", label: "Reserved", render: (d) => money(d.held) },
              {
                key: "available",
                label: "Available credit",
                render: (d) => <strong>{money(d.available)}</strong>,
              },
              {
                key: "status",
                label: "Credit status",
                render: (d) => (
                  <Badge>
                    {d.available < s.pricing.minimumBalance
                      ? "Blocked · low balance"
                      : "Eligible credit"}
                  </Badge>
                ),
              },
            ]}
          />
        ) : tab === "Ledger" ? (
          <LedgerTable rows={s.ledger.filter((l) => l.account === "wallet")} />
        ) : (
          <RequestTable
            rows={s.requests.filter((r) =>
              ["Top-up", "Credit adjustment"].includes(r.type),
            )}
          />
        )}
      </Card>
    </>
  );
}
function LedgerTable({ rows }: { rows: State["ledger"] }) {
  const { s } = useAdmin();
  return (
    <DataTable
      rows={rows}
      title="ledger entries"
      columns={[
        { key: "date", label: "Posted", render: (l) => dateLabel(l.date) },
        {
          key: "reference",
          label: "Reference",
          render: (l) => <span className="record-id">{l.reference}</span>,
        },
        {
          key: "driverId",
          label: "Partner",
          render: (l) => s.drivers.find((x) => x.id === l.driverId)?.name,
        },
        { key: "kind", label: "Entry" },
        { key: "account", label: "Account" },
        {
          key: "amount",
          label: "Amount",
          render: (l) => (
            <strong className={l.amount < 0 ? "negative" : "positive"}>
              {money(l.amount)}
            </strong>
          ),
        },
      ]}
    />
  );
}
export function FinancePage() {
  const { s, panel, allowed, exportRows } = useAdmin(),
    [tab, setTab] = useState("Payments");
  const complete = s.trips.filter((t) => t.status === "Completed"),
    commission = s.ledger
      .filter((l) => l.account === "commission")
      .reduce((a, x) => a + x.amount, 0);
  return (
    <>
      <PageHeading
        title="Payments & settlements"
        detail="Clear separation between booking value, collections, earned commission and partner payouts."
        action={
          <>
            <FinanceRequestButton type="Refund" />
            <FinanceRequestButton type="Payout" />
          </>
        }
      />
      <div className="metric-grid">
        <Metric
          label="Completed booking value"
          value={money(complete.reduce((a, t) => a + t.fare, 0))}
          note="Gross ride value before refunds"
        />
        <Metric
          label="Earned commission"
          value={money(commission)}
          note="After approved reversals"
        />
        <Metric
          label="Driver earnings payable"
          value={money(
            s.ledger
              .filter((l) => l.account === "payable")
              .reduce((a, x) => a + x.amount, 0),
          )}
          note="Chapa earnings less payouts / recoveries"
        />
        <Metric
          label="Collection exceptions"
          value={
            complete.filter(
              (t) => !["Collected", "Verified", "Refunded"].includes(t.payment),
            ).length
          }
          note="Pending, failed or unpaid trips"
        />
      </div>
      <div className="tabs">
        {["Payments", "Exceptions", "Approvals & payouts", "Ledger"].map(
          (x) => (
            <button
              className={tab === x ? "active" : ""}
              key={x}
              onClick={() => setTab(x)}
            >
              {x}
            </button>
          ),
        )}
      </div>
      <Card>
        {tab === "Approvals & payouts" ? (
          <RequestTable
            rows={s.requests.filter((r) =>
              ["Refund", "Payout"].includes(r.type),
            )}
          />
        ) : tab === "Ledger" ? (
          <LedgerTable rows={s.ledger} />
        ) : (
          <DataTable
            rows={complete.filter(
              (t) =>
                tab !== "Exceptions" ||
                !["Collected", "Verified", "Refunded"].includes(t.payment),
            )}
            title="payments"
            onRow={(t) => openRecord("trips", t.id, panel)}
            onExport={
              allowed("finance.export")
                ? (r) => void exportRows(r, "payments", "finance.export")
                : undefined
            }
            columns={[
              {
                key: "id",
                label: "Trip reference",
                render: (t) => <span className="record-id">{t.id}</span>,
              },
              { key: "method", label: "Payment choice" },
              {
                key: "fare",
                label: "Booking value",
                render: (t) => money(t.fare),
              },
              {
                key: "commission",
                label: "Company commission",
                render: (t) => money(t.settled ? t.commission : 0),
              },
              {
                key: "payment",
                label: "Collection status",
                render: (t) => <Badge>{t.payment}</Badge>,
              },
              {
                key: "refundAmount",
                label: "Refunded",
                render: (t) => money(t.refundAmount),
              },
              {
                key: "date",
                label: "Created",
                render: (t) => dateLabel(t.date),
              },
            ]}
          />
        )}
      </Card>
      <div className="info-strip">
        <ShieldCheck size={18} />
        <div>
          <strong>Chapa outcomes are simulated.</strong> Successful gateway
          collections withhold commission once. Cash commissions use driver
          prepaid credit. Finance owns exceptions and payout approval.
        </div>
      </div>
    </>
  );
}
function RequestDetails({ id }: { id: string }) {
  const { s, allowed, form, run } = useAdmin();
  const r = s.requests.find((x) => x.id === id)!;
  const view = s.drivers.find((d) => d.id === r.driverId)!;
  const approval = allowed(
    ["Top-up", "Credit adjustment"].includes(r.type)
      ? "wallets.approve"
      : "finance.approve",
  );
  return (
    <>
      <div className="trip-detail-head">
        <strong>{money(r.amount)}</strong>
        <Badge>{r.status}</Badge>
        <p>{r.type}</p>
      </div>
      <Facts
        items={[
          ["Partner", view.name],
          ["Created by", s.staff.find((x) => x.id === r.createdBy)?.name],
          [
            "Approved by",
            s.staff.find((x) => x.id === r.approvedBy)?.name ??
              "Awaiting approval",
          ],
          ["Trip", r.tripId ?? "—"],
          ["Refund issued by", r.refundParty ?? "—"],
          ["Reason / evidence reference", r.reason],
          [
            "Available payable",
            money(
              balance(s, r.driverId, "payable") -
                payableReserved(s, r.driverId),
            ),
          ],
          ["Date", dateLabel(r.date)],
        ]}
      />
      <div className="action-wrap">
        {approval && r.status === "Pending approval" && (
          <>
            <Button
              onClick={() =>
                promptReason(
                  form,
                  "Approve request",
                  (reason) =>
                    run({
                      type: "financeApprove",
                      id,
                      data: { approve: true },
                      reason,
                    }),
                  "The requester cannot approve their own financial request.",
                )
              }
            >
              <Check size={15} />
              Approve
            </Button>
            <Button
              variant="danger"
              onClick={() =>
                promptReason(form, "Reject request", (reason) =>
                  run({
                    type: "financeApprove",
                    id,
                    data: { approve: false },
                    reason,
                  }),
                )
              }
            >
              Reject
            </Button>
          </>
        )}
        {allowed("finance.simulate") && r.status === "Approved" && (
          <>
            <Button
              onClick={() =>
                promptReason(
                  form,
                  "Confirm simulated execution",
                  (reason) =>
                    run({
                      type: "financeExecute",
                      id,
                      data: { success: true },
                      reason,
                    }),
                  "This records a simulated money movement only.",
                )
              }
            >
              <CheckCheck size={15} />
              Confirm execution
            </Button>
            <Button
              variant="danger"
              onClick={() =>
                promptReason(form, "Record failed execution", (reason) =>
                  run({
                    type: "financeExecute",
                    id,
                    data: { success: false },
                    reason,
                  }),
                )
              }
            >
              Execution failed
            </Button>
          </>
        )}
      </div>
      <RecordAudit id={id} />
    </>
  );
}

export function PricingPage() {
  const { s, allowed, form, run } = useAdmin();
  const [km, setKm] = useState(7.1);
  const labels: {
    key: keyof State["pricing"];
    label: string;
    money?: boolean;
  }[] = [
    { key: "base", label: "Base fare", money: true },
    { key: "perKm", label: "Per kilometre", money: true },
    { key: "perMinute", label: "Per minute", money: true },
    { key: "waiting", label: "Waiting / minute", money: true },
    { key: "cancellation", label: "Configured cancellation fee", money: true },
    { key: "deliveryFee", label: "Package base fee", money: true },
    { key: "commissionPercent", label: "Commission (%)" },
    { key: "minimumBalance", label: "Minimum driver credit", money: true },
    { key: "radius", label: "Coverage radius (km)" },
  ];
  const edit = () =>
    form({
      title: "Publish new pricing version",
      description:
        "Existing trips retain their saved pricing. Cancellation fees are configured here; office cancellations currently waive them.",
      initial: Object.fromEntries(
        labels.map((x) => [
          x.key,
          String(Number(s.pricing[x.key]) / (x.money ? 100 : 1)),
        ]),
      ),
      fields: [
        ...labels.map((x) => ({
          name: x.key,
          label: x.label + (x.money ? " (ETB)" : ""),
          type: "number",
          required: true,
        })),
        reasonField,
      ],
      submit: "Publish pricing",
      onSubmit: (v) =>
        run({
          type: "pricingSave",
          data: Object.fromEntries(
            labels.map((x) => [
              x.key,
              x.money ? number(v[x.key]) : Number(v[x.key]),
            ]),
          ),
          reason: v.reason,
        }),
    });
  return (
    <>
      <PageHeading
        title="Pricing & service areas"
        detail="Versioned commercial rules for Addis Ababa. Changes apply to new quotes."
        action={
          allowed("pricing.edit") && (
            <Button onClick={edit}>
              <Plus size={15} />
              Update pricing
            </Button>
          )
        }
      />
      <div className="two-column">
        <Card
          title="Ride pricing"
          subtitle={`Sample rules · version ${s.pricing.version}`}
        >
          <Facts
            items={labels.map((x) => [
              x.label,
              x.money
                ? money(Number(s.pricing[x.key]))
                : String(s.pricing[x.key]),
            ])}
          />
        </Card>
        <Card
          title="Quote preview"
          subtitle="Standard · sample distance estimate"
        >
          <div className="quote-preview">
            <img src="/images/standard.webp" alt="Standard car" />
            <label>
              Route distance (km)
              <input
                aria-label="Quote distance in km"
                type="number"
                min=".1"
                max="100"
                value={km}
                onChange={(e) => setKm(Number(e.target.value))}
              />
            </label>
            <strong>
              {money(Math.round(s.pricing.base + km * s.pricing.perKm))}
            </strong>
            <span>Estimated fare · time/waiting charges excluded</span>
            <p>
              Commission:{" "}
              {money(
                Math.round(
                  ((s.pricing.base + km * s.pricing.perKm) *
                    s.pricing.commissionPercent) /
                    100,
                ),
              )}
            </p>
          </div>
        </Card>
      </div>
      <Card
        title="Addis Ababa coverage"
        subtitle={`Configured radius ${s.pricing.radius} km · visual demonstration boundary`}
      >
        <OperationsMap compact drivers={[]} trips={[]} />
      </Card>
      <Card title="Pricing version history">
        {s.pricingHistory.length ? (
          <DataTable
            rows={s.pricingHistory.map((p, i) => ({ ...p, id: String(i) }))}
            title="price changes"
            columns={[
              {
                key: "date",
                label: "Changed",
                render: (p) => dateLabel(p.date),
              },
              {
                key: "actor",
                label: "By",
                render: (p) => s.staff.find((x) => x.id === p.actor)?.name,
              },
              {
                key: "value",
                label: "Previous version",
                render: (p) => p.value.version,
              },
              { key: "reason", label: "Reason" },
            ]}
          />
        ) : (
          <p className="card-pad muted">
            Version 1 is the seeded sample configuration. Publishing a change
            records the previous version here.
          </p>
        )}
      </Card>
    </>
  );
}

export function RestaurantsPage() {
  const { s, form, run, panel, allowed } = useAdmin();
  return (
    <>
      <PageHeading
        title="Restaurant partners"
        detail="Onboarding and platform oversight. Restaurant teams use their own Zemen Pro workspace."
        action={
          allowed("restaurants.create") && (
            <Button
              onClick={() =>
                form({
                  title: "Register restaurant application",
                  fields: [
                    { name: "name", label: "Restaurant name", required: true },
                    {
                      name: "owner",
                      label: "Owner / operator",
                      required: true,
                    },
                    { name: "phone", label: "Contact mobile", required: true },
                    {
                      name: "category",
                      label: "Cuisine",
                      options: [
                        "Ethiopian",
                        "Coffee & pastries",
                        "Continental",
                      ],
                    },
                  ],
                  onSubmit: (v) => run({ type: "restaurantSave", data: v }),
                })
              }
            >
              <Plus size={16} />
              Register restaurant
            </Button>
          )
        }
      />
      <div className="restaurant-feature">
        <img
          src="/images/habesha.webp"
          alt="Illustrative Ethiopian restaurant cuisine"
        />
        <div>
          <span className="eyebrow">A TASTE OF ADDIS</span>
          <h2>Great food. Connected partners.</h2>
          <p>
            Restaurant applications, commercial oversight and partner
            performance in one place.
          </p>
          <span className="partner-note">
            Partner self-service is planned in Zemen Pro
          </span>
        </div>
      </div>
      <Card>
        <DataTable
          rows={s.restaurants}
          title="restaurants"
          onRow={(r) => openRecord("restaurants", r.id, panel)}
          columns={[
            {
              key: "name",
              label: "Restaurant",
              render: (r) => (
                <div className="person">
                  <img
                    className="restaurant-thumb"
                    src={`/images/${r.image}.webp`}
                    alt="Illustrative cuisine"
                  />
                  <div>
                    <strong>{r.name}</strong>
                    <small>{r.category}</small>
                  </div>
                </div>
              ),
            },
            { key: "owner", label: "Owner / operator" },
            { key: "branches", label: "Branches" },
            {
              key: "commission",
              label: "Commission",
              render: (r) => r.commission + "%",
            },
            {
              key: "status",
              label: "Status",
              render: (r) => <Badge>{r.status}</Badge>,
            },
            {
              key: "id",
              label: "Delivered orders",
              render: (r) =>
                s.orders.filter(
                  (o) => o.restaurantId === r.id && o.status === "Delivered",
                ).length,
            },
          ]}
        />
      </Card>
    </>
  );
}
export function FoodPage() {
  const { s, panel } = useAdmin();
  return (
    <>
      <PageHeading
        title="Food orders"
        detail="Connected order samples, prepared for the Zemen Pro restaurant and courier integration."
      />
      <div className="metric-grid">
        <Metric
          label="Sample orders"
          value={s.orders.length}
          note="All statuses"
        />
        <Metric
          label="Delivered"
          value={s.orders.filter((o) => o.status === "Delivered").length}
          note="Completed food service"
        />
        <Metric
          label="Delivered food sales"
          value={money(
            s.orders
              .filter((o) => o.status === "Delivered")
              .reduce((a, o) => a + o.total, 0),
          )}
          note="Restaurant gross sales · sample"
        />
        <Metric
          label="Awaiting action"
          value={
            s.orders.filter((o) => ["Submitted", "Ready"].includes(o.status))
              .length
          }
          note="Restaurant / courier stages"
        />
      </div>
      <Card>
        <DataTable
          rows={s.orders}
          title="food orders"
          onRow={(o) => openRecord("food", o.id, panel)}
          columns={[
            {
              key: "id",
              label: "Order",
              render: (o) => <span className="record-id">{o.id}</span>,
            },
            {
              key: "restaurantId",
              label: "Restaurant",
              render: (o) =>
                s.restaurants.find((r) => r.id === o.restaurantId)?.name,
            },
            { key: "items", label: "Items" },
            {
              key: "total",
              label: "Order total",
              render: (o) => money(o.total),
            },
            {
              key: "status",
              label: "Status",
              render: (o) => <Badge>{o.status}</Badge>,
            },
            {
              key: "driverId",
              label: "Courier",
              render: (o) => s.drivers.find((d) => d.id === o.driverId)?.name,
            },
          ]}
        />
      </Card>
    </>
  );
}
export function DeliveriesPage() {
  const { s, panel } = useAdmin();
  return (
    <>
      <PageHeading
        title="Packages & documents"
        detail="Delivery oversight, recipient confirmation and return handling."
      />
      <div className="metric-grid">
        <Metric
          label="Delivery requests"
          value={s.deliveries.length}
          note="Sample package jobs"
        />
        <Metric
          label="Delivered"
          value={s.deliveries.filter((d) => d.status === "Delivered").length}
          note="Recorded recipient proof"
        />
        <Metric
          label="Failed / returning"
          value={
            s.deliveries.filter((d) =>
              ["Failed", "Returning"].includes(d.status),
            ).length
          }
          note="Requires follow-up"
        />
        <Metric
          label="Collected fees"
          value={money(
            s.deliveries
              .filter((d) => d.status === "Delivered")
              .reduce((a, d) => a + d.fee, 0),
          )}
          note="Delivery sample gross · separate from rides"
        />
      </div>
      <Card>
        <DataTable
          rows={s.deliveries}
          title="deliveries"
          onRow={(d) => openRecord("deliveries", d.id, panel)}
          columns={[
            {
              key: "id",
              label: "Delivery",
              render: (d) => <span className="record-id">{d.id}</span>,
            },
            { key: "sender", label: "Sender" },
            { key: "category", label: "Category" },
            { key: "destination", label: "Destination" },
            { key: "receiver", label: "Receiver" },
            { key: "fee", label: "Fee", render: (d) => money(d.fee) },
            {
              key: "status",
              label: "Status",
              render: (d) => <Badge>{d.status}</Badge>,
            },
          ]}
        />
      </Card>
    </>
  );
}

export function SupportPage() {
  const { s, panel, form, run, allowed, notice } = useAdmin();
  const create = () =>
    form({
      title: "Create support case",
      initial: { channel: "Phone", priority: "Normal", category: "General" },
      fields: [
        { name: "subject", label: "Subject", required: true, wide: true },
        {
          name: "channel",
          label: "Received through",
          options: ["Phone", "In-app", "Chat", "Email"],
          required: true,
        },
        {
          name: "priority",
          label: "Priority",
          options: ["Normal", "High", "Urgent"],
          required: true,
        },
        {
          name: "category",
          label: "Category",
          options: [
            "General",
            "Lost item",
            "Refund",
            "Delivery",
            "Safety",
            "Appeal",
          ],
        },
        {
          name: "assignedTo",
          label: "Assigned staff",
          options: staffOptions(s),
        },
        {
          name: "customerId",
          label: "Customer reference",
          options: s.customers
            .slice(0, 100)
            .map((c) => ({ value: c.id, label: c.name })),
        },
        {
          name: "tripId",
          label: "Trip reference",
          options: s.trips.slice(0, 100).map((t) => t.id),
        },
        {
          name: "note",
          label: "Case description / call notes",
          type: "textarea",
          wide: true,
        },
      ],
      onSubmit: (v) => run({ type: "ticketSave", data: v }),
    });
  return (
    <>
      <PageHeading
        title="Support & safety"
        detail="One connected case history for customers, drivers and restaurant partners."
        action={
          allowed("support.create") && (
            <Button onClick={create}>
              <Plus size={16} />
              New case
            </Button>
          )
        }
      />
      <div className="metric-grid">
        <Metric
          label="Open cases"
          value={s.tickets.filter((t) => t.status === "Open").length}
          note="Awaiting staff action"
        />
        <Metric
          label="In progress"
          value={s.tickets.filter((t) => t.status === "In progress").length}
          note="Assigned and being handled"
        />
        <Metric
          label="Urgent incidents"
          value={
            s.tickets.filter(
              (t) => t.priority === "Urgent" && t.status !== "Resolved",
            ).length
          }
          note="Prioritize safety response"
        />
        <Metric
          label="Resolved"
          value={s.tickets.filter((t) => t.status === "Resolved").length}
          note="Can be reopened if required"
        />
      </div>
      <Card>
        <DataTable
          rows={s.tickets}
          title="support cases"
          onRow={(t) => openRecord("support", t.id, panel)}
          bulk={
            allowed("support.edit")
              ? (ids) =>
                  form({
                    title: `Assign ${ids.length} support cases`,
                    fields: [
                      {
                        name: "assignedTo",
                        label: "Assign to",
                        options: staffOptions(s),
                        required: true,
                      },
                      reasonField,
                    ],
                    onSubmit: async (v) => {
                      let ok = 0;
                      for (const id of ids)
                        if (
                          await run({
                            type: "ticketSave",
                            id,
                            data: { assignedTo: v.assignedTo },
                            reason: v.reason,
                          })
                        )
                          ok++;
                      notice(
                        `${ok} of ${ids.length} cases assigned. Each result is audited.`,
                      );
                      return ok === ids.length;
                    },
                  })
              : undefined
          }
          columns={[
            {
              key: "id",
              label: "Case",
              render: (t) => <span className="record-id">{t.id}</span>,
            },
            { key: "subject", label: "Subject" },
            { key: "channel", label: "Channel" },
            {
              key: "priority",
              label: "Priority",
              render: (t) => <Badge>{t.priority}</Badge>,
            },
            {
              key: "status",
              label: "Status",
              render: (t) => <Badge>{t.status}</Badge>,
            },
            {
              key: "assignedTo",
              label: "Owner",
              render: (t) =>
                s.staff.find((x) => x.id === t.assignedTo)?.name ??
                "Unassigned",
            },
            {
              key: "due",
              label: "Target response",
              render: (t) => dateLabel(t.due),
            },
          ]}
        />
      </Card>
    </>
  );
}

export function GrowthPage() {
  const { s, form, run, allowed } = useAdmin(),
    [tab, setTab] = useState("Offers & incentives");
  return (
    <>
      <PageHeading
        title="Growth & communications"
        detail="Offers, referrals, partner incentives and targeted announcements."
        action={
          tab === "Offers & incentives"
            ? allowed("growth.create") && (
                <Button
                  onClick={() =>
                    form({
                      title: "Create campaign",
                      initial: {
                        type: "Promo code",
                        audience: "All customers",
                      },
                      fields: [
                        {
                          name: "name",
                          label: "Campaign / code",
                          required: true,
                        },
                        {
                          name: "type",
                          label: "Type",
                          options: [
                            "Promo code",
                            "Referral",
                            "Driver incentive",
                            "Restaurant offer",
                          ],
                          required: true,
                        },
                        {
                          name: "value",
                          label: "Reward value (sample)",
                          type: "number",
                          required: true,
                        },
                        {
                          name: "budget",
                          label: "Budget cap (ETB)",
                          type: "number",
                          required: true,
                        },
                        {
                          name: "audience",
                          label: "Audience",
                          options: [
                            "All customers",
                            "New customers",
                            "Drivers",
                            "Restaurant customers",
                          ],
                        },
                        reasonField,
                      ],
                      onSubmit: (v) =>
                        run({
                          type: "promoSave",
                          data: { ...v, budget: number(v.budget) },
                          reason: v.reason,
                        }),
                    })
                  }
                >
                  <Plus size={16} />
                  Create campaign
                </Button>
              )
            : allowed("growth.send") && (
                <Button
                  onClick={() =>
                    form({
                      title: "Compose announcement",
                      description:
                        "Messages are simulated. The audience and channel are saved with the delivery record.",
                      initial: { channel: "Push", audience: "All customers" },
                      fields: [
                        {
                          name: "title",
                          label: "Title",
                          required: true,
                          wide: true,
                        },
                        {
                          name: "body",
                          label: "Message",
                          type: "textarea",
                          required: true,
                          wide: true,
                        },
                        {
                          name: "channel",
                          label: "Channel",
                          options: ["Push", "SMS"],
                          required: true,
                        },
                        {
                          name: "audience",
                          label: "Audience",
                          options: [
                            "All customers",
                            "New customers",
                            "Drivers",
                            "Restaurants",
                          ],
                          required: true,
                        },
                        {
                          name: "scheduled",
                          label: "Schedule for (optional)",
                          type: "datetime-local",
                        },
                        reasonField,
                      ],
                      submit: "Simulate announcement",
                      onSubmit: (v) =>
                        run({ type: "messageSend", data: v, reason: v.reason }),
                    })
                  }
                >
                  <Plus size={16} />
                  Compose announcement
                </Button>
              )
        }
      />
      <div className="tabs">
        {["Offers & incentives", "Announcements"].map((x) => (
          <button
            className={tab === x ? "active" : ""}
            onClick={() => setTab(x)}
            key={x}
          >
            {x}
          </button>
        ))}
      </div>
      <Card>
        {tab === "Offers & incentives" ? (
          <DataTable
            rows={s.promotions}
            title="campaigns"
            columns={[
              {
                key: "name",
                label: "Campaign",
                render: (p) => <strong>{p.name}</strong>,
              },
              { key: "type", label: "Type" },
              { key: "audience", label: "Audience" },
              {
                key: "budget",
                label: "Budget",
                render: (p) => money(p.budget),
              },
              { key: "used", label: "Recorded redemptions" },
              {
                key: "status",
                label: "Status",
                render: (p) => <Badge>{p.status}</Badge>,
              },
              {
                key: "id",
                label: "Action",
                render: (p) =>
                  allowed("growth.edit") && (
                    <button
                      className="text-link"
                      onClick={() =>
                        promptReason(
                          form,
                          p.status === "Active"
                            ? "Pause campaign"
                            : "Activate campaign",
                          (r) =>
                            run({ type: "promoSave", id: p.id, reason: r }),
                        )
                      }
                    >
                      {p.status === "Active" ? "Pause" : "Activate"}
                    </button>
                  ),
              },
            ]}
          />
        ) : s.messages.length ? (
          <DataTable
            rows={s.messages}
            title="announcements"
            columns={[
              { key: "title", label: "Title" },
              { key: "channel", label: "Channel" },
              { key: "audience", label: "Audience" },
              {
                key: "status",
                label: "Simulated delivery",
                render: (m) => <Badge>{m.status}</Badge>,
              },
              {
                key: "date",
                label: "Created",
                render: (m) => dateLabel(m.date),
              },
            ]}
          />
        ) : (
          <Empty
            title="Your announcement history starts here"
            detail="Compose a push or SMS announcement to preview its audience and simulated delivery."
          />
        )}
      </Card>
      <div className="info-strip">
        <Activity size={17} />
        <div>
          Campaigns start as drafts. Redemptions and spend remain zero until
          events are recorded. No SMS or push notification is sent from this
          demonstration.
        </div>
      </div>
    </>
  );
}

export function AnalyticsPage() {
  const { s, allowed, exportRows } = useAdmin(),
    [family, setFamily] = useState("Operations"),
    [days, setDays] = useState(30);
  const reports = [
    "Operations",
    "Drivers",
    "Customers",
    "Finance",
    "Restaurants & food",
    "Packages",
    "Support & safety",
    "Growth",
    "Staff",
  ];
  const from = Date.now() - days * 86400000;
  const trips = s.trips.filter((t) => new Date(t.date).getTime() >= from),
    ledger = s.ledger.filter((l) => new Date(l.date).getTime() >= from),
    orders = s.orders.filter((o) => new Date(o.date).getTime() >= from),
    deliveries = s.deliveries.filter((d) => new Date(d.date).getTime() >= from);
  let report: {
    name: string;
    value: number;
    currency?: boolean;
    definition: string;
  }[] = [];
  let ranking: { name: string; value: number }[] = [];
  let source: { date: string; value: number }[] = trips.map((t) => ({
    date: t.date,
    value: 1,
  }));
  let chartTitle = "Ride requests by date",
    moneyAxis = false;
  const metric = (
    name: string,
    value: number,
    definition: string,
    currency = false,
  ) => ({ name, value, definition, currency });
  const sum = (account: State["ledger"][number]["account"]) =>
    ledger
      .filter((l) => l.account === account)
      .reduce((a, x) => a + x.amount, 0);
  if (family === "Operations") {
    report = [
      metric(
        "Requests",
        trips.length,
        "All ride requests created in the selected period.",
      ),
      metric(
        "Completed",
        trips.filter((t) => t.status === "Completed").length,
        "Trips with completed service status.",
      ),
      metric(
        "Cancelled",
        trips.filter((t) => t.status === "Cancelled").length,
        "Trips closed by cancellation.",
      ),
      metric(
        "Office bookings",
        trips.filter((t) => t.source === "Office").length,
        "Trips created by office staff.",
      ),
    ];
    ranking = ["Standard", "Comfort", "XL"].map((name) => ({
      name,
      value: trips.filter((t) => t.vehicleClass === name).length,
    }));
  }
  if (family === "Drivers") {
    report = [
      metric(
        "Partners",
        s.drivers.length,
        "Current partner and applicant records.",
      ),
      metric(
        "Approved",
        s.drivers.filter((d) => d.status === "Approved").length,
        "Current approved driver accounts.",
      ),
      metric(
        "Available",
        s.drivers.filter((d) => !eligibility(s, d)).length,
        "Current dispatch eligibility, including credit and document checks.",
      ),
      metric(
        "Low credit",
        s.drivers.filter(
          (d) =>
            balance(s, d.id) - reserved(s, d.id) < s.pricing.minimumBalance,
        ).length,
        "Drivers below the configured current minimum credit.",
      ),
    ];
    ranking = s.drivers
      .map((d) => ({
        name: d.name,
        value: trips.filter(
          (t) => t.driverId === d.id && t.status === "Completed",
        ).length,
      }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 6);
  }
  if (family === "Customers") {
    const ids = new Set(trips.map((t) => t.customerId));
    report = [
      metric(
        "Registered",
        s.customers.filter((c) => new Date(c.joined).getTime() >= from).length,
        "Customer records created during selected dates.",
      ),
      metric(
        "Booking customers",
        ids.size,
        "Unique customers with a request in the period.",
      ),
      metric(
        "Repeat customers",
        [...ids].filter(
          (id) =>
            trips.filter((t) => t.customerId === id && t.status === "Completed")
              .length >= 2,
        ).length,
        "Customers completing at least two rides in this available period; not long-term retention.",
      ),
      metric(
        "Restricted accounts",
        s.customers.filter((c) => c.status === "Restricted").length,
        "Current account restrictions.",
      ),
    ];
    ranking = Array.from({ length: Math.ceil(days / 7) }, (_, i) => ({
      name: `Cohort week ${i + 1}`,
      value: s.customers.filter((c) => {
        const age = (Date.now() - new Date(c.joined).getTime()) / 86400000;
        return age >= i * 7 && age < Math.min((i + 1) * 7, days);
      }).length,
    }));
    chartTitle = "Customer registrations by date";
    source = s.customers.map((c) => ({ date: c.joined, value: 1 }));
  }
  if (family === "Finance") {
    report = [
      metric(
        "Gross booking value",
        trips
          .filter((t) => t.status === "Completed")
          .reduce((a, t) => a + t.fare, 0),
        "Completed ride fares before refunds. Excludes prepaid deposits.",
        true,
      ),
      metric(
        "Earned commission",
        sum("commission"),
        "Posted ride commission less approved reversals.",
        true,
      ),
      metric(
        "Platform collections",
        sum("collection"),
        "Verified Chapa collections less refunds.",
        true,
      ),
      metric(
        "Driver payable",
        s.ledger
          .filter((l) => l.account === "payable")
          .reduce((a, l) => a + l.amount, 0),
        "Current outstanding driver earnings; may include refund recovery.",
        true,
      ),
      metric(
        "Driver-reported collections",
        sum("driverCollection"),
        "Cash and external pay-driver collections, net of confirmed refunds.",
        true,
      ),
      metric(
        "Refunds",
        sum("refund"),
        "Confirmed refunds in selected period.",
        true,
      ),
      metric(
        "Prepaid credit",
        s.ledger
          .filter((l) => l.account === "wallet")
          .reduce((a, l) => a + l.amount, 0),
        "Current driver credit liability; not company earnings.",
        true,
      ),
      metric(
        "Pending payout reservations",
        s.requests
          .filter(
            (r) =>
              r.type === "Payout" &&
              ["Approved", "Pending approval"].includes(r.status),
          )
          .reduce((a, r) => a + r.amount, 0),
        "Payables reserved by outstanding payout requests.",
        true,
      ),
    ];
    chartTitle = "Earned ride commission by date";
    moneyAxis = true;
    source = ledger
      .filter((l) => l.account === "commission")
      .map((l) => ({ date: l.date, value: l.amount / 100 }));
    ranking = s.drivers
      .map((d) => ({
        name: d.name,
        value: ledger
          .filter((l) => l.driverId === d.id && l.account === "commission")
          .reduce((a, l) => a + l.amount, 0),
      }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 6);
  }
  if (family === "Restaurants & food") {
    report = [
      metric(
        "Restaurant accounts",
        s.restaurants.length,
        "Current restaurant partner records.",
      ),
      metric(
        "Food orders",
        orders.length,
        "Sample food requests created in the period.",
      ),
      metric(
        "Delivered",
        orders.filter((o) => o.status === "Delivered").length,
        "Orders with delivered status.",
      ),
      metric(
        "Delivered food sales",
        orders
          .filter((o) => o.status === "Delivered")
          .reduce((a, o) => a + o.total, 0),
        "Sample restaurant gross sales, reported separately from ride revenue.",
        true,
      ),
    ];
    ranking = s.restaurants
      .map((r) => ({
        name: r.name,
        value: orders.filter((o) => o.restaurantId === r.id).length,
      }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 6);
    source = orders.map((o) => ({ date: o.date, value: 1 }));
    chartTitle = "Sample food orders by date";
  }
  if (family === "Packages") {
    report = [
      metric(
        "Requests",
        deliveries.length,
        "Sample package requests in period.",
      ),
      metric(
        "Delivered",
        deliveries.filter((d) => d.status === "Delivered").length,
        "Delivered samples with recorded proof.",
      ),
      metric(
        "Failed / returned",
        deliveries.filter((d) =>
          ["Failed", "Returned", "Returning"].includes(d.status),
        ).length,
        "Cases requiring exception handling.",
      ),
      metric(
        "Delivered fees",
        deliveries
          .filter((d) => d.status === "Delivered")
          .reduce((a, d) => a + d.fee, 0),
        "Package sample gross fees, separate from ride revenue.",
        true,
      ),
    ];
    ranking = ["Documents", "Parcel", "Keys"].map((name) => ({
      name,
      value: deliveries.filter((d) => d.category === name).length,
    }));
    source = deliveries.map((d) => ({ date: d.date, value: 1 }));
    chartTitle = "Package requests by date";
  }
  if (family === "Support & safety") {
    report = [
      metric(
        "Open",
        s.tickets.filter((t) => t.status === "Open").length,
        "Current open support queue.",
      ),
      metric(
        "In progress",
        s.tickets.filter((t) => t.status === "In progress").length,
        "Current assigned work.",
      ),
      metric(
        "Urgent",
        s.tickets.filter(
          (t) => t.priority === "Urgent" && t.status !== "Resolved",
        ).length,
        "Current unresolved urgent cases.",
      ),
      metric(
        "Resolved",
        s.tickets.filter((t) => t.status === "Resolved").length,
        "Cases currently marked resolved.",
      ),
    ];
    ranking = ["Phone", "In-app", "Chat", "Email"].map((name) => ({
      name,
      value: s.tickets.filter((t) => t.channel === name).length,
    }));
    source = s.tickets.map((t) => ({ date: t.date, value: 1 }));
    chartTitle = "Support cases received by date";
  }
  if (family === "Growth") {
    report = [
      metric(
        "Campaigns",
        s.promotions.length,
        "Configured promotional campaigns.",
      ),
      metric(
        "Active campaigns",
        s.promotions.filter((p) => p.status === "Active").length,
        "Currently active offers and incentives.",
      ),
      metric(
        "Recorded redemptions",
        s.promotions.reduce((a, p) => a + p.used, 0),
        "Actual seeded/local redemptions; no invented campaign results.",
      ),
      metric(
        "Announcements",
        s.messages.length,
        "Simulated push/SMS messages created.",
      ),
    ];
    ranking = s.promotions.map((p) => ({ name: p.name, value: p.used }));
    source = s.messages.map((m) => ({ date: m.date, value: 1 }));
    chartTitle = "Simulated announcements created by date";
  }
  if (family === "Staff") {
    report = [
      metric(
        "Active staff",
        s.staff.filter((a) => a.active).length,
        "Current active demo staff accounts.",
      ),
      metric(
        "Custom role definitions",
        s.roles.length,
        "Defined roles including protected owner.",
      ),
      metric(
        "Recorded actions",
        s.audit.length,
        "All sample/local audit entries.",
      ),
      metric(
        "Rejected actions",
        s.audit.filter((a) => a.outcome === "Rejected").length,
        "Actions blocked by permissions or domain rules.",
      ),
    ];
    ranking = s.staff
      .map((a) => ({
        name: a.name,
        value: s.audit.filter((e) => e.actorId === a.id).length,
      }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 6);
    source = s.audit.map((a) => ({ date: a.time, value: 1 }));
    chartTitle = "Recorded staff actions by date";
  }
  const values = Array.from({ length: days }, (_, i) =>
      source
        .filter(
          (t) =>
            Math.floor((Date.now() - new Date(t.date).getTime()) / 86400000) ===
            days - i - 1,
        )
        .reduce((a, x) => a + x.value, 0),
    ),
    labels = Array.from({ length: days }, (_, i) =>
      new Date(Date.now() - (days - i - 1) * 86400000).toLocaleDateString(
        "en-GB",
        { month: "short", day: "numeric" },
      ),
    );
  return (
    <>
      <PageHeading
        title="Analytics & reports"
        detail="One source of truth. Every figure is calculated from connected sample records."
        action={
          <>
            <select
              aria-label="Report date range"
              value={days}
              onChange={(e) => setDays(Number(e.target.value))}
            >
              <option value={7}>Last 7 days</option>
              <option value={30}>Last 30 days</option>
            </select>
            {allowed("analytics.export") && (
              <Button
                variant="secondary"
                onClick={() =>
                  exportRows(
                    report.map((r, i) => ({
                      ...r,
                      id: String(i),
                      value: r.currency ? r.value / 100 : r.value,
                      unit: r.currency ? "ETB" : "count",
                    })),
                    family + "-report",
                    "analytics.export",
                  )
                }
              >
                <Download size={15} />
                Export CSV
              </Button>
            )}
            <Button variant="secondary" onClick={() => window.print()}>
              <FileText size={15} />
              Print / PDF
            </Button>
          </>
        }
      />
      <div className="report-tabs">
        {reports.map((x) => (
          <button
            className={family === x ? "active" : ""}
            key={x}
            onClick={() => setFamily(x)}
          >
            {x}
          </button>
        ))}
      </div>
      <div className="metric-grid">
        {report.slice(0, 4).map((r) => (
          <Metric
            key={r.name}
            label={r.name}
            value={r.currency ? money(r.value) : r.value.toLocaleString()}
            note="See metric definition below"
          />
        ))}
      </div>
      <div className="dashboard-middle">
        <Card
          title={chartTitle}
          subtitle={`Last ${days} days · synthetic/local records`}
        >
          <LineChart values={values} labels={labels} moneyAxis={moneyAxis} />
        </Card>
        <Card
          title={
            family === "Finance"
              ? "Commission by driver"
              : family === "Operations"
                ? "Requests by vehicle class"
                : "Report breakdown"
          }
          subtitle="Based on the selected report source"
        >
          <BarList rows={ranking} moneyValues={family === "Finance"} />
        </Card>
      </div>
      <Card title="Report details & definitions">
        <DataTable
          rows={report.map((r, i) => ({ ...r, id: String(i) }))}
          title="report metrics"
          columns={[
            {
              key: "name",
              label: "Metric",
              render: (r) => <strong>{r.name}</strong>,
            },
            {
              key: "value",
              label: "Value",
              render: (r) =>
                r.currency ? money(r.value) : r.value.toLocaleString(),
            },
            { key: "definition", label: "Definition / scope" },
          ]}
        />
      </Card>
      <p className="caption">
        Historical metrics use the selected dates; current account/balance
        metrics are labelled current. Retention is limited to the available
        30-day sample. Food/package gross values are kept separate from ride
        ledger revenue.
      </p>
    </>
  );
}

export function StaffPage() {
  const { s, allowed, form, run, actor } = useAdmin(),
    [tab, setTab] = useState("Staff accounts"),
    [roleId, setRoleId] = useState(""),
    [name, setName] = useState(""),
    [permissions, setPermissions] = useState<string[]>([]);
  const editRole = (id: string) => {
    const r = s.roles.find((x) => x.id === id);
    setRoleId(id);
    setName(r?.name ?? "");
    setPermissions(r?.permissions.filter((x) => x !== "*") ?? []);
  };
  const staffForm = (id?: string) => {
    const u = s.staff.find((x) => x.id === id);
    form({
      title: u ? "Edit staff access" : "Create staff account",
      description:
        "These are local demo staff identities. Real invitations and authentication will use the shared backend.",
      initial: u
        ? {
            name: u.name,
            email: u.email,
            roleId: u.roleId,
            active: u.active ? "Active" : "Inactive",
          }
        : {},
      fields: [
        { name: "name", label: "Full name", required: true },
        { name: "email", label: "Email", type: "email", required: true },
        {
          name: "roleId",
          label: "Role",
          required: true,
          options: s.roles.map((r) => ({ value: r.id, label: r.name })),
        },
        ...(u
          ? [
              {
                name: "active",
                label: "Account status",
                options: ["Active", "Inactive"],
                required: true,
              },
            ]
          : []),
        reasonField,
      ],
      onSubmit: (v) =>
        run({
          type: "staffSave",
          id,
          data: { ...v, active: v.active !== "Inactive" },
          reason: v.reason,
        }),
    });
  };
  return (
    <>
      <PageHeading
        title="Staff & permissions"
        detail="Define what each role can see and do. Permissions apply to actions as well as navigation."
        action={
          allowed("staff.create") && (
            <Button onClick={() => staffForm()}>
              <Plus size={16} />
              Create staff
            </Button>
          )
        }
      />
      <div className="tabs">
        {["Staff accounts", "Roles & permissions"].map((x) => (
          <button
            className={tab === x ? "active" : ""}
            key={x}
            onClick={() => setTab(x)}
          >
            {x}
          </button>
        ))}
      </div>
      {tab === "Staff accounts" ? (
        <Card>
          <DataTable
            rows={s.staff}
            title="staff"
            onRow={(u) => {
              if (allowed("staff.edit")) staffForm(u.id);
            }}
            columns={[
              {
                key: "name",
                label: "Staff member",
                render: (u) => <Person name={u.name} sub={u.email} />,
              },
              {
                key: "roleId",
                label: "Role",
                render: (u) => s.roles.find((r) => r.id === u.roleId)?.name,
              },
              {
                key: "active",
                label: "Status",
                render: (u) => (
                  <Badge>{u.active ? "Active" : "Inactive"}</Badge>
                ),
              },
              {
                key: "id",
                label: "Session",
                render: (u) => (u.id === actor ? "Current demo session" : "—"),
              },
            ]}
          />
        </Card>
      ) : (
        <div className="roles-layout">
          <Card
            title="Custom roles"
            action={
              allowed("staff.roles") && (
                <button
                  className="icon-btn"
                  title="New role"
                  onClick={() => editRole("new")}
                >
                  <Plus size={18} />
                </button>
              )
            }
          >
            <div className="role-list">
              {s.roles.map((r) => (
                <button
                  key={r.id}
                  className={roleId === r.id ? "selected" : ""}
                  onClick={() => editRole(r.id)}
                >
                  <ShieldCheck size={18} />
                  <span>
                    <strong>{r.name}</strong>
                    <small>
                      {r.permissions.includes("*")
                        ? "Protected full access"
                        : r.permissions.length + " action permissions"}
                    </small>
                  </span>
                  <ArrowRight size={14} />
                </button>
              ))}
            </div>
          </Card>
          <Card
            title={
              roleId === "new" ? "Create custom role" : name || "Choose a role"
            }
            subtitle="Each toggle grants an implemented action. New software features are added through development."
          >
            {roleId ? (
              <div className="role-editor">
                <label>
                  Role name
                  <input
                    aria-label="Role name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    disabled={roleId === "owner" || !allowed("staff.roles")}
                  />
                </label>
                {roleId === "owner" ? (
                  <div className="info-strip">
                    <ShieldCheck size={18} />
                    The owner role is protected. At least one active owner must
                    remain.
                  </div>
                ) : (
                  <>
                    <div className="permission-grid">
                      {Object.entries(modules).map(([module, actions]) => (
                        <div key={module}>
                          <strong>{module}</strong>
                          <div>
                            {actions.map((action) => {
                              const p = module + "." + action;
                              return (
                                <label key={action} className="toggle-label">
                                  <span>{action}</span>
                                  <input
                                    aria-label={`${module} ${action}`}
                                    type="checkbox"
                                    checked={permissions.includes(p)}
                                    disabled={
                                      !allowed("staff.roles") ||
                                      !can(s, actor, p)
                                    }
                                    onChange={(e) =>
                                      setPermissions(
                                        e.target.checked
                                          ? [...permissions, p]
                                          : permissions.filter((x) => x !== p),
                                      )
                                    }
                                  />
                                </label>
                              );
                            })}
                          </div>
                        </div>
                      ))}
                    </div>
                    {allowed("staff.roles") && (
                      <Button
                        onClick={() =>
                          promptReason(
                            form,
                            "Save role permissions",
                            async (reason) => {
                              const ok = await run({
                                type: "roleSave",
                                id: roleId === "new" ? undefined : roleId,
                                data: { name, permissions },
                                reason,
                              });
                              if (ok && roleId === "new") setRoleId("");
                              return ok;
                            },
                          )
                        }
                      >
                        Save role permissions
                        <Check size={15} />
                      </Button>
                    )}
                  </>
                )}
              </div>
            ) : (
              <Empty
                title="Select a role to inspect its permissions"
                detail="Create a named role, then turn on the actions that staff need."
              />
            )}
          </Card>
        </div>
      )}
    </>
  );
}

export function AuditPage() {
  const { s, panel, allowed, form, run, exportRows } = useAdmin(),
    [tab, setTab] = useState("Activity log");
  return (
    <>
      <PageHeading
        title="Audit & reviews"
        detail="Who acted, what changed, when it happened and where the action originated."
        action={
          allowed("audit.export") && (
            <Button
              variant="secondary"
              onClick={() =>
                exportRows(s.audit, "audit-history", "audit.export")
              }
            >
              <Download size={15} />
              Export audit
            </Button>
          )
        }
      />
      <div className="tabs">
        {["Activity log", "Suspicious activity"].map((x) => (
          <button
            className={tab === x ? "active" : ""}
            onClick={() => setTab(x)}
            key={x}
          >
            {x}
          </button>
        ))}
      </div>
      <Card>
        {tab === "Activity log" ? (
          <DataTable
            rows={s.audit}
            title="audit events"
            onRow={(a) =>
              panel(
                a.action,
                <>
                  <Facts
                    items={[
                      ["Actor", a.actor],
                      ["Role", a.role],
                      ["When", dateLabel(a.time)],
                      ["Record", a.entity],
                      ["Source / where", a.source],
                      ["Outcome", <Badge>{a.outcome}</Badge>],
                      ["Reason", a.reason || "—"],
                    ]}
                  />
                  <h3 className="section-label">Before</h3>
                  <pre className="audit-json">
                    {a.before || "No previous value captured for this action"}
                  </pre>
                  <h3 className="section-label">After</h3>
                  <pre className="audit-json">
                    {a.after || "See linked record and action details"}
                  </pre>
                </>,
              )
            }
            columns={[
              { key: "time", label: "When", render: (a) => dateLabel(a.time) },
              {
                key: "actor",
                label: "Staff / role",
                render: (a) => (
                  <div>
                    <strong>{a.actor}</strong>
                    <small className="block muted">{a.role}</small>
                  </div>
                ),
              },
              { key: "action", label: "Action" },
              { key: "entity", label: "Record" },
              {
                key: "outcome",
                label: "Result",
                render: (a) => <Badge>{a.outcome}</Badge>,
              },
              { key: "source", label: "Source" },
            ]}
          />
        ) : (
          <DataTable
            rows={s.reviews}
            title="review flags"
            columns={[
              {
                key: "subject",
                label: "Flag",
                render: (r) => <strong>{r.subject}</strong>,
              },
              { key: "type", label: "Category" },
              { key: "entity", label: "Linked record" },
              {
                key: "status",
                label: "Status",
                render: (r) => <Badge>{r.status}</Badge>,
              },
              { key: "note", label: "Review note" },
              {
                key: "id",
                label: "Action",
                render: (r) =>
                  allowed("audit.review") &&
                  r.status === "Open" && (
                    <button
                      className="text-link"
                      onClick={() =>
                        promptReason(
                          form,
                          "Record investigation outcome",
                          (reason) =>
                            run({ type: "reviewClose", id: r.id, reason }),
                        )
                      }
                    >
                      Review
                    </button>
                  ),
              },
            ]}
          />
        )}
      </Card>
      <p className="caption">
        Audit history is read-only through the dashboard. It records local demo
        actions; production tamper resistance and verified network/session
        evidence require the shared backend.
      </p>
    </>
  );
}

export function SettingsPage() {
  const { s, actor, allowed, form, run, replaceData, notice } = useAdmin();
  const restore = useRef<HTMLInputElement>(null);
  const backup = async () => {
    if (!allowed("settings.backup")) return;
    if (
      await run({
        type: "export",
        data: { permission: "settings.backup", report: "Full local backup" },
      })
    )
      download(
        new Blob([JSON.stringify(s)], { type: "application/json" }),
        "zemengo-admin-backup.json",
      );
  };
  const edit = () =>
    form({
      title: "Update operating settings",
      initial: {
        company: s.settings.company,
        supportEmail: s.settings.supportEmail,
      },
      fields: [
        { name: "company", label: "Business name", required: true },
        {
          name: "supportEmail",
          label: "Support email",
          type: "email",
          required: true,
        },
        reasonField,
      ],
      onSubmit: (v) => run({ type: "settingsSave", data: v, reason: v.reason }),
    });
  return (
    <>
      <PageHeading
        title="Settings & system health"
        detail="Operating configuration, integration readiness and local demo recovery."
        action={
          allowed("settings.edit") && (
            <Button variant="secondary" onClick={edit}>
              Edit business settings
            </Button>
          )
        }
      />
      <div className="two-column">
        <Card
          title="Operating configuration"
          subtitle="Addis Ababa · English · ETB"
        >
          <Facts
            items={[
              ["Business", s.settings.company],
              ["Support email", s.settings.supportEmail],
              ["Timezone", "Africa/Addis_Ababa · UTC+3"],
              ["Storage", "IndexedDB · local browser"],
              ["Schema version", String(s.schema)],
              ["Data revision", String(s.revision)],
            ]}
          />
          {["rides", "food", "packages", "sms", "push"].map((k) => (
            <label key={k} className="setting-row">
              <div>
                <strong>
                  {
                    {
                      rides: "New ride bookings",
                      food: "Food service readiness",
                      packages: "Package service readiness",
                      sms: "SMS simulation",
                      push: "Push simulation",
                    }[k]
                  }
                </strong>
                <small>
                  {k === "rides"
                    ? "Pause or allow new office bookings"
                    : k === "food" || k === "packages"
                      ? "Readiness flag · admin sample workflows remain available"
                      : "No external messages are sent"}
                </small>
              </div>
              <input
                type="checkbox"
                aria-label={k + " enabled"}
                disabled={!allowed("settings.edit")}
                checked={s.settings[k as keyof typeof s.settings] === true}
                onChange={(e) =>
                  void run({
                    type: "settingsSave",
                    data: { [k]: e.target.checked },
                    reason: "Operating preference updated by staff",
                  })
                }
              />
            </label>
          ))}
        </Card>
        <Card
          title="Integrations"
          subtitle="Honest service status for the presentation"
        >
          <div className="integration-list">
            {[
              [
                "Gebeta Maps",
                import.meta.env.VITE_GEBETA_API_KEY
                  ? "Configured · browser map"
                  : "Map preview · no browser key",
              ],
              ["Chapa", "Simulated · no merchant transactions"],
              ["Zemen Pro", "Simulated partner events"],
              ["Customer application", "Separate device-local demo"],
              ["SMS & push", "Simulated delivery only"],
              ["Email & chat", "Staff-entered sample cases"],
            ].map(([name, status]) => (
              <div key={name}>
                <span className="integration-symbol">{name[0]}</span>
                <span>
                  <strong>{name}</strong>
                  <small>{status}</small>
                </span>
                <Badge tone="neutral">
                  {name === "Gebeta Maps" ? "Map adapter" : "Demo"}
                </Badge>
              </div>
            ))}
          </div>
        </Card>
      </div>
      <Card
        title="Local backup & recovery"
        subtitle="Back up the complete demo, including relationships and audit history."
      >
        <div className="recovery-actions">
          {allowed("settings.backup") && (
            <>
              <Button variant="secondary" onClick={backup}>
                <Download size={16} />
                Export backup
              </Button>
              <Button
                variant="secondary"
                onClick={() => restore.current?.click()}
              >
                <Upload size={16} />
                Restore backup
              </Button>
              <input
                ref={restore}
                hidden
                type="file"
                accept="application/json,.json"
                onChange={async (e) => {
                  const file = e.target.files?.[0];
                  if (!file) return;
                  try {
                    if (file.size > 20 * 1024 * 1024)
                      throw Error("Backup exceeds 20 MB.");
                    const value: unknown = JSON.parse(await file.text());
                    validateBackup(value);
                    form({
                      title: "Replace local data from backup",
                      description: `${value.drivers.length} drivers, ${value.trips.length} trips, ${value.audit.length} audit records. This replaces the current demo.`,
                      fields: [
                        {
                          name: "confirm",
                          label: "Type RESTORE to confirm",
                          required: true,
                        },
                      ],
                      submit: "Restore data",
                      onSubmit: async (v) => {
                        if (v.confirm !== "RESTORE") {
                          notice("Type RESTORE to confirm.", true);
                          return false;
                        }
                        await replaceData(value, "Backup restored");
                      },
                    });
                  } catch (error) {
                    notice((error as Error).message, true);
                  }
                  e.target.value = "";
                }}
              />
            </>
          )}
          {allowed("settings.reset") && (
            <Button
              variant="danger"
              onClick={() =>
                form({
                  title: "Reset demo scenario",
                  description:
                    "Replaces local edits with the known sample scenario. Export a backup first if you need to retain changes.",
                  fields: [
                    {
                      name: "confirm",
                      label: "Type RESET to confirm",
                      required: true,
                    },
                  ],
                  submit: "Reset local demo",
                  onSubmit: async (v) => {
                    if (v.confirm !== "RESET") {
                      notice("Type RESET to confirm.", true);
                      return false;
                    }
                    await replaceData(seed(), "Demo reset");
                  },
                })
              }
            >
              <RefreshCw size={16} />
              Reset demo data
            </Button>
          )}
        </div>
      </Card>
    </>
  );
}

export function RecordDetails({ page, id }: { page: Page; id: string }) {
  const { s, form, run, allowed, go } = useAdmin();
  if (!allowed(page + ".view"))
    return (
      <Empty
        title="Access is restricted"
        detail="Your role cannot view this record."
      />
    );
  if (page === "drivers" || page === "applications")
    return <DriverDetails id={id} />;
  if (page === "trips") return <TripDetails id={id} />;
  if (page === "finance") return <RequestDetails id={id} />;
  if (page === "wallets") {
    const d = s.drivers.find((x) => x.id === id)!;
    return (
      <>
        <Person name={d.name} sub={d.plate} />
        <Facts
          items={[
            ["Prepaid balance", money(balance(s, id))],
            ["Reserved", money(reserved(s, id))],
            ["Available credit", money(balance(s, id) - reserved(s, id))],
            ["Driver payable", money(balance(s, id, "payable"))],
            ["Dispatch eligibility", eligibility(s, d) || "Available"],
          ]}
        />
        <div className="action-wrap">
          <FinanceRequestButton driverId={id} />
          <FinanceRequestButton driverId={id} type="Payout" />
        </div>
        <LedgerTable rows={s.ledger.filter((l) => l.driverId === id)} />
      </>
    );
  }
  if (page === "customers") {
    const c = s.customers.find((x) => x.id === id)!;
    return (
      <>
        <Person name={c.name} sub={c.phone} />
        <Facts
          items={[
            ["Customer", c.id],
            ["Account", <Badge>{c.status}</Badge>],
            ["Email", c.email],
            ["Registered through", c.source],
            ["Joined", dateLabel(c.joined)],
            ["Internal notes", c.notes],
          ]}
        />
        <div className="action-wrap">
          {allowed("customers.edit") && (
            <Button
              variant="secondary"
              onClick={() =>
                form({
                  title: "Edit customer",
                  initial: {
                    name: c.name,
                    phone: c.phone,
                    email: c.email,
                    notes: c.notes,
                  },
                  fields: [
                    { name: "name", label: "Name", required: true },
                    { name: "phone", label: "Phone", required: true },
                    { name: "email", label: "Email", type: "email" },
                    {
                      name: "notes",
                      label: "Internal notes",
                      type: "textarea",
                      wide: true,
                    },
                  ],
                  onSubmit: (v) => run({ type: "customerSave", id, data: v }),
                })
              }
            >
              Edit profile
            </Button>
          )}
          {allowed("customers.suspend") && (
            <Button
              variant="danger"
              onClick={() =>
                promptReason(
                  form,
                  c.status === "Active"
                    ? "Restrict customer"
                    : "Reactivate customer",
                  (reason) => run({ type: "customerStatus", id, reason }),
                )
              }
            >
              {c.status === "Active" ? "Restrict account" : "Reactivate"}
            </Button>
          )}
        </div>
        <h3 className="section-label">Customer trips</h3>
        <TripTable rows={s.trips.filter((t) => t.customerId === id)} />
        <h3 className="section-label">Support history</h3>
        {s.tickets
          .filter((t) => t.customerId === id)
          .map((t) => (
            <button
              className="list-link"
              key={t.id}
              onClick={() => go("support", t.id)}
            >
              {t.subject}
              <Badge>{t.status}</Badge>
            </button>
          ))}
        <RecordAudit id={id} />
      </>
    );
  }
  if (page === "restaurants") {
    const r = s.restaurants.find((x) => x.id === id)!;
    const delivered = s.orders.filter(
        (o) => o.restaurantId === id && o.status === "Delivered",
      ),
      sales = delivered.reduce((a, o) => a + o.total, 0);
    return (
      <>
        <img
          className="detail-food"
          src={`/images/${r.image}.webp`}
          alt="Illustrative restaurant food"
        />
        <h2>{r.name}</h2>
        <Badge>{r.status}</Badge>
        <Facts
          items={[
            ["Owner", r.owner],
            ["Phone", r.phone],
            ["Branches", String(r.branches)],
            ["Commission", r.commission + "%"],
            ["Delivered gross sales", money(sales)],
            [
              "Sample commission",
              money(Math.round((sales * r.commission) / 100)),
            ],
            [
              "Indicative restaurant net",
              money(Math.round(sales * (1 - r.commission / 100))),
            ],
            ["Documents", r.documents ? "Reviewed" : "Pending"],
            ["Partner workspace", "Zemen Pro · restaurant role"],
          ]}
        />
        <div className="action-wrap">
          {allowed("restaurants.review") && r.status === "Submitted" && (
            <Button
              onClick={() =>
                promptReason(form, "Review restaurant documents", (reason) =>
                  run({
                    type: "restaurantReview",
                    id,
                    data: { step: "First review", documents: true },
                    reason,
                  }),
                )
              }
            >
              Confirm documents & first review
            </Button>
          )}
          {allowed("restaurants.approve") && r.status === "Second review" && (
            <Button
              onClick={() =>
                promptReason(form, "Approve restaurant", (reason) =>
                  run({
                    type: "restaurantReview",
                    id,
                    data: { step: "Approve" },
                    reason,
                  }),
                )
              }
            >
              Final approval
            </Button>
          )}
          {allowed("restaurants.suspend") &&
            ["Approved", "Suspended"].includes(r.status) && (
              <Button
                variant="danger"
                onClick={() =>
                  promptReason(form, "Change restaurant access", (reason) =>
                    run({
                      type: "restaurantReview",
                      id,
                      data: { step: "Suspend" },
                      reason,
                    }),
                  )
                }
              >
                {r.status === "Suspended" ? "Reactivate" : "Suspend restaurant"}
              </Button>
            )}
        </div>
        <div className="info-strip">
          Restaurant operators will manage branches, menu availability, prices
          and orders in Zemen Pro. These figures are oversight samples, not a
          settled payment ledger.
        </div>
        <h3 className="section-label">Sample branch & menu overview</h3>
        {Array.from({ length: r.branches }, (_, i) => (
          <div className="list-link" key={i}>
            <span>
              {r.name} · {["Bole", "Sarbet", "Kazanchis"][i]} branch
            </span>
            <Badge>Sample branch</Badge>
          </div>
        ))}
        <div className="menu-preview">
          <img src={`/images/${r.image}.webp`} alt="Sample menu item" />
          <div>
            <strong>
              {r.category === "Ethiopian"
                ? "Beyaynetu"
                : r.image === "coffee"
                  ? "Macchiato & croissant"
                  : "House pizza"}
            </strong>
            <small>Menu managed by the restaurant in Zemen Pro</small>
          </div>
        </div>
        <RecordAudit id={id} />
      </>
    );
  }
  if (page === "food") {
    const o = s.orders.find((x) => x.id === id)!;
    return (
      <>
        <h2>{o.id}</h2>
        <Badge>{o.status}</Badge>
        <Facts
          items={[
            [
              "Restaurant",
              s.restaurants.find((r) => r.id === o.restaurantId)?.name,
            ],
            ["Customer", s.customers.find((c) => c.id === o.customerId)?.name],
            ["Items", o.items],
            ["Order total", money(o.total)],
            ["Delivery fee", money(o.fee)],
            [
              "Zemen Pro courier",
              s.drivers.find((d) => d.id === o.driverId)?.name,
            ],
            ["Created", dateLabel(o.date)],
          ]}
        />
        {allowed("food.edit") &&
          !["Delivered", "Cancelled"].includes(o.status) && (
            <Button onClick={() => run({ type: "orderAdvance", id })}>
              Advance sample order
              <ArrowRight size={15} />
            </Button>
          )}
        <RecordAudit id={id} />
      </>
    );
  }
  if (page === "deliveries") {
    const d = s.deliveries.find((x) => x.id === id)!;
    const actions: Record<string, string[]> = {
      Requested: ["Assigned"],
      Assigned: ["Collected", "Failed"],
      Collected: ["Failed"],
      Failed: ["Returning", "Assigned"],
      Returning: ["Returned"],
    };
    return (
      <>
        <div className="package-hero">
          <img src="/images/parcel.webp" alt="Parcel illustration" />
          <div>
            <h2>{d.id}</h2>
            <Badge>{d.status}</Badge>
          </div>
        </div>
        <Facts
          items={[
            ["Sender", d.sender],
            ["Receiver", d.receiver],
            ["Recipient phone", d.phone],
            ["Destination", d.destination],
            ["Category", d.category],
            ["Delivery fee", money(d.fee)],
            ["Attempts", String(d.attempts)],
            ["Courier", s.drivers.find((x) => x.id === d.driverId)?.name],
            ["Proof", d.proof ?? "Awaiting receiver confirmation"],
            ["Latest note", d.note || "—"],
          ]}
        />
        {allowed("deliveries.verify") && d.status === "Collected" && (
          <>
            <div className="info-strip">
              <Phone size={18} />
              <div>
                <strong>Demo recipient SMS preview</strong>
                <p>
                  Recipient {d.phone} receives code <b>{d.otp}</b>. Valid until{" "}
                  {dateLabel(d.otpExpires)}. No SMS is sent.
                </p>
              </div>
            </div>
            <div className="action-wrap">
              <Button
                onClick={() =>
                  form({
                    title: "Confirm recipient OTP",
                    fields: [
                      { name: "otp", label: "Receiver code", required: true },
                    ],
                    submit: "Verify delivery",
                    onSubmit: (v) =>
                      run({
                        type: "deliveryUpdate",
                        id,
                        data: { action: "Verify OTP", otp: v.otp },
                      }),
                  })
                }
              >
                Verify receiver code
              </Button>
              <Button
                variant="secondary"
                onClick={() =>
                  run({
                    type: "deliveryUpdate",
                    id,
                    data: { action: "Resend OTP" },
                  })
                }
              >
                Resend demo code
              </Button>
            </div>
          </>
        )}
        {allowed("deliveries.edit") && (
          <div className="action-wrap">
            {(actions[d.status] ?? []).map((action) => (
              <Button
                key={action}
                variant="secondary"
                onClick={() =>
                  promptReason(
                    form,
                    "Mark delivery " + action.toLowerCase(),
                    (reason) =>
                      run({
                        type: "deliveryUpdate",
                        id,
                        data: { action },
                        reason,
                      }),
                  )
                }
              >
                {action}
              </Button>
            ))}
          </div>
        )}
        <RecordAudit id={id} />
      </>
    );
  }
  if (page === "support") {
    const t = s.tickets.find((x) => x.id === id)!;
    return (
      <>
        <h2>{t.subject}</h2>
        <Badge>{t.status}</Badge>
        <Facts
          items={[
            ["Channel", t.channel],
            ["Category", t.category],
            ["Priority", <Badge>{t.priority}</Badge>],
            [
              "Assigned to",
              s.staff.find((x) => x.id === t.assignedTo)?.name ?? "Unassigned",
            ],
            ["Customer", t.customerId],
            ["Driver", t.driverId],
            ["Trip", t.tripId],
            ["Created", dateLabel(t.date)],
            ["Target response", dateLabel(t.due)],
            ["Case note", t.note],
          ]}
        />
        <div className="action-wrap">
          {allowed("support.edit") && (
            <Button
              onClick={() =>
                form({
                  title: "Update case",
                  initial: {
                    status: t.status,
                    assignedTo: t.assignedTo,
                    priority: t.priority,
                  },
                  fields: [
                    {
                      name: "status",
                      label: "Status",
                      options: ["Open", "In progress", "Escalated", "Resolved"],
                      required: true,
                    },
                    {
                      name: "assignedTo",
                      label: "Assigned staff",
                      options: staffOptions(s),
                    },
                    {
                      name: "priority",
                      label: "Priority",
                      options: ["Normal", "High", "Urgent"],
                      required: true,
                    },
                    reasonField,
                  ],
                  onSubmit: (v) =>
                    run({ type: "ticketSave", id, data: v, reason: v.reason }),
                })
              }
            >
              Update / assign case
            </Button>
          )}
          {t.tripId && allowed("trips.view") && (
            <Button variant="secondary" onClick={() => go("trips", t.tripId)}>
              View linked trip
            </Button>
          )}
          {t.driverId && allowed("drivers.view") && (
            <Button
              variant="secondary"
              onClick={() => go("drivers", t.driverId)}
            >
              View partner / restriction
            </Button>
          )}
        </div>
        <RecordAudit id={id} />
      </>
    );
  }
  return <Empty title="Record not found" />;
}
