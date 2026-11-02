import {
  useCallback,
  useEffect,
  useRef,
  useState,
  type ReactNode,
} from "react";
import {
  Activity,
  ArrowRight,
  BarChart3,
  Bell,
  Building2,
  Car,
  CheckCheck,
  ChevronDown,
  ChevronRight,
  ClipboardCheck,
  FileClock,
  Gift,
  Headphones,
  LayoutDashboard,
  Map,
  Menu,
  Package,
  Search,
  Settings,
  ShieldCheck,
  SlidersHorizontal,
  Users,
  UtensilsCrossed,
  Wallet,
  X,
} from "lucide-react";
import { Context } from "./context";
import { audit } from "./domain/engine";
import {
  can,
  dateLabel,
  modules,
  type State,
  type Page,
  type Command,
} from "./domain/model";
import { load, commit, onExternalChange, replace } from "./domain/storage";
import {
  Button,
  Drawer,
  DownloadCSV,
  FormModal,
  type FormSpec,
} from "./components";
import {
  AnalyticsPage,
  ApplicationsPage,
  AuditPage,
  CustomersPage,
  DeliveriesPage,
  DispatchPage,
  DriversPage,
  FinancePage,
  FoodPage,
  GrowthPage,
  openRecord,
  Overview,
  PricingPage,
  RestaurantsPage,
  SettingsPage,
  StaffPage,
  SupportPage,
  TripsPage,
  WalletsPage,
} from "./pages";
import "./styles.css";
const navigation: {
  group: string;
  items: { id: Page; label: string; icon: typeof LayoutDashboard }[];
}[] = [
  {
    group: "WORKSPACE",
    items: [
      { id: "overview", label: "Overview", icon: LayoutDashboard },
      { id: "operations", label: "Live operations", icon: Map },
      { id: "trips", label: "Trips", icon: Car },
    ],
  },
  {
    group: "PEOPLE & PARTNERS",
    items: [
      {
        id: "applications",
        label: "Driver applications",
        icon: ClipboardCheck,
      },
      { id: "drivers", label: "Drivers & vehicles", icon: Car },
      { id: "customers", label: "Customers", icon: Users },
      { id: "restaurants", label: "Restaurants", icon: Building2 },
      { id: "food", label: "Food orders", icon: UtensilsCrossed },
      { id: "deliveries", label: "Packages & documents", icon: Package },
    ],
  },
  {
    group: "BUSINESS",
    items: [
      { id: "wallets", label: "Driver balances", icon: Wallet },
      { id: "finance", label: "Payments & settlements", icon: CheckCheck },
      { id: "support", label: "Support & safety", icon: Headphones },
      { id: "growth", label: "Growth & campaigns", icon: Gift },
      { id: "analytics", label: "Analytics & reports", icon: BarChart3 },
    ],
  },
  {
    group: "ADMINISTRATION",
    items: [
      { id: "staff", label: "Staff & permissions", icon: ShieldCheck },
      { id: "audit", label: "Audit & reviews", icon: FileClock },
      {
        id: "pricing",
        label: "Pricing & service areas",
        icon: SlidersHorizontal,
      },
      { id: "settings", label: "Settings", icon: Settings },
    ],
  },
];
const pageComponents: Record<Page, () => ReactNode> = {
  overview: Overview,
  operations: DispatchPage,
  trips: TripsPage,
  applications: ApplicationsPage,
  drivers: DriversPage,
  customers: CustomersPage,
  wallets: WalletsPage,
  finance: FinancePage,
  pricing: PricingPage,
  restaurants: RestaurantsPage,
  food: FoodPage,
  deliveries: DeliveriesPage,
  support: SupportPage,
  growth: GrowthPage,
  analytics: AnalyticsPage,
  staff: StaffPage,
  audit: AuditPage,
  settings: SettingsPage,
};
export default function App() {
  const [s, setS] = useState<State | null>(null),
    [actor, setActor] = useState(
      sessionStorage.getItem("zemengo-staff") ?? "staff-owner",
    ),
    [page, setPage] = useState<Page>("overview"),
    [form, setForm] = useState<FormSpec | null>(null),
    [drawer, setDrawer] = useState<{
      title: string;
      content: ReactNode;
      subtitle?: string;
    } | null>(null),
    [toast, setToast] = useState<{ text: string; error: boolean } | null>(null),
    [search, setSearch] = useState(""),
    [searchOpen, setSearchOpen] = useState(false),
    [notifications, setNotifications] = useState(false),
    [sidebar, setSidebar] = useState(false),
    [fatal, setFatal] = useState("");
  const stateRef = useRef(s),
    actorRef = useRef(actor),
    toastTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  stateRef.current = s;
  actorRef.current = actor;
  const notice = useCallback((text: string, error = false) => {
    setToast({ text, error });
    if (toastTimer.current) clearTimeout(toastTimer.current);
    toastTimer.current = setTimeout(() => setToast(null), 7000);
  }, []);
  const panel = useCallback(
    (title: string, content: ReactNode, subtitle?: string) =>
      setDrawer({ title, content, subtitle }),
    [],
  );
  const closePanel = useCallback(() => setDrawer(null), []);
  useEffect(() => {
    load()
      .then(setS)
      .catch((e) => setFatal(e.message));
    return onExternalChange(() =>
      load().then((next) => {
        setS(next);
        notice("Local records updated from another tab.");
      }),
    );
  }, [notice]);
  const go = useCallback((p: Page, id?: string) => {
    location.hash = p + (id ? "?id=" + encodeURIComponent(id) : "");
    setSidebar(false);
    setSearchOpen(false);
    setNotifications(false);
    setDrawer(null);
    window.scrollTo({ top: 0, behavior: "instant" });
  }, []);
  useEffect(() => {
    const update = () => {
      const [route, q] = location.hash.slice(1).split("?"),
        p = route in modules ? (route as Page) : "overview";
      setPage(p);
      const id = new URLSearchParams(q).get("id");
      setDrawer(null);
      if (
        id &&
        stateRef.current &&
        can(stateRef.current, actorRef.current, p + ".view")
      ) {
        const collection = (
          {
            trips: "trips",
            drivers: "drivers",
            applications: "drivers",
            customers: "customers",
            wallets: "drivers",
            finance: "requests",
            restaurants: "restaurants",
            food: "orders",
            deliveries: "deliveries",
            support: "tickets",
          } as Record<string, string>
        )[p];
        const records = collection
          ? (stateRef.current as unknown as Record<string, { id: string }[]>)[
              collection
            ]
          : undefined;
        if (records?.some((r) => r.id === id)) openRecord(p, id, panel);
      }
    };
    update();
    window.addEventListener("hashchange", update);
    return () => window.removeEventListener("hashchange", update);
  }, [Boolean(s), panel]);
  const run = useCallback(
    async (c: Command) => {
      const current = stateRef.current;
      if (!current) return false;
      try {
        const result = await commit(current, actorRef.current, c);
        stateRef.current = result.state;
        setS(result.state);
        if (result.error) {
          notice(result.error, true);
          return false;
        }
        notice(
          c.type === "session"
            ? "Demo staff session selected."
            : c.type === "export"
              ? "Export recorded in the audit history."
              : "Changes saved to the local demo.",
        );
        return true;
      } catch (e) {
        notice((e as Error).message, true);
        try {
          setS(await load());
        } catch {}
        return false;
      }
    },
    [notice],
  );
  const switchActor = async (id: string) => {
    if (!s?.staff.find((x) => x.id === id)?.active) return;
    setActor(id);
    actorRef.current = id;
    sessionStorage.setItem("zemengo-staff", id);
    setDrawer(null);
    await run({ type: "session" });
    go("overview");
  };
  const replaceData = async (next: State, kind: string) => {
    const current = stateRef.current;
    if (!current) return;
    if (
      !can(
        current,
        actorRef.current,
        kind === "Demo reset" ? "settings.reset" : "settings.backup",
      )
    ) {
      notice("Your role does not allow data replacement.", true);
      return;
    }
    try {
      const fresh = await replace(current, actorRef.current, next, kind);
      stateRef.current = fresh;
      setS(fresh);
      setDrawer(null);
      if (!fresh.staff.some((u) => u.id === actorRef.current && u.active)) {
        setActor("staff-owner");
        actorRef.current = "staff-owner";
        sessionStorage.setItem("zemengo-staff", "staff-owner");
      }
      notice("Local data restored successfully.");
      go("overview");
    } catch (e) {
      notice((e as Error).message, true);
    }
  };
  if (fatal)
    return (
      <div className="boot-error">
        <img src="/images/logo.png" alt="ZemenGo" />
        <h1>Local storage needs attention</h1>
        <p>{fatal}</p>
        <Button onClick={() => location.reload()}>Retry loading</Button>
      </div>
    );
  if (!s)
    return (
      <div className="boot-error">
        <img src="/images/logo.png" alt="ZemenGo" />
        <h2>Preparing your workspace…</h2>
        <p>Loading the local demonstration.</p>
      </div>
    );
  const allowed = (permission: string) => can(s, actor, permission);
  const user = s.staff.find((x) => x.id === actor && x.active);
  if (!user) {
    return (
      <div className="boot-error">
        <h1>Choose an active demo staff account</h1>
        {s.staff
          .filter((x) => x.active)
          .map((x) => (
            <Button key={x.id} onClick={() => switchActor(x.id)}>
              {x.name}
            </Button>
          ))}
      </div>
    );
  }
  const role = s.roles.find((x) => x.id === user.roleId);
  const title =
    navigation.flatMap((g) => g.items).find((x) => x.id === page)?.label ??
    "Overview";
  const PageComponent = pageComponents[page];
  const searchRows = [
    ...(allowed("drivers.view")
      ? s.drivers.map((d) => ({
          id: d.id,
          name: d.name,
          sub: d.plate,
          page: "drivers" as Page,
        }))
      : []),
    ...(allowed("trips.view")
      ? s.trips.map((t) => ({
          id: t.id,
          name: t.id,
          sub: t.pickup + " → " + t.destination,
          page: "trips" as Page,
        }))
      : []),
    ...(allowed("customers.view")
      ? s.customers.map((c) => ({
          id: c.id,
          name: c.name,
          sub: c.phone,
          page: "customers" as Page,
        }))
      : []),
    ...(allowed("restaurants.view")
      ? s.restaurants.map((r) => ({
          id: r.id,
          name: r.name,
          sub: r.owner,
          page: "restaurants" as Page,
        }))
      : []),
  ]
    .filter(
      (x) =>
        search &&
        `${x.id} ${x.name} ${x.sub}`
          .toLowerCase()
          .includes(search.toLowerCase()),
    )
    .slice(0, 14);
  const queues = [
    {
      label: "Applications awaiting final review",
      count: s.drivers.filter((d) => d.status === "Second review").length,
      page: "applications" as Page,
    },
    {
      label: "Financial approvals pending",
      count: s.requests.filter((r) => r.status === "Pending approval").length,
      page: "wallets" as Page,
    },
    {
      label: "Open support cases",
      count: s.tickets.filter((t) => t.status !== "Resolved").length,
      page: "support" as Page,
    },
  ].filter((q) => allowed(q.page + ".view"));
  const context = {
    s,
    actor,
    run,
    allowed,
    form: setForm,
    notice,
    go,
    panel,
    closePanel,
    replaceData,
    exportRows: async (rows: unknown[], name: string, permission: string) => {
      if (await run({ type: "export", data: { permission, report: name } })) {
        try {
          DownloadCSV(rows, name);
        } catch (e) {
          notice((e as Error).message, true);
        }
      }
    },
  };
  return (
    <Context.Provider value={context}>
      <div className={`app-shell ${sidebar ? "sidebar-open" : ""}`}>
        <aside className="sidebar">
          <a className="brand" href="#overview">
            <img src="/images/logo.png" alt="ZemenGo logo" />
            <strong>
              ZemenGo<span>ADMIN CONSOLE</span>
            </strong>
          </a>
          <div className="workspace">
            <span className="workspace-icon">Z</span>
            <div>
              <strong>ZemenGo headquarters</strong>
              <small>Addis Ababa, Ethiopia</small>
            </div>
            <ChevronDown size={13} />
          </div>
          <nav aria-label="Main navigation">
            {navigation.map((group) => {
              const items = group.items.filter((item) =>
                allowed(item.id + ".view"),
              );
              return items.length ? (
                <div className="nav-group" key={group.group}>
                  <span>{group.group}</span>
                  {items.map((item) => (
                    <button
                      key={item.id}
                      className={page === item.id ? "active" : ""}
                      onClick={() => go(item.id)}
                    >
                      <item.icon size={18} />
                      <span>{item.label}</span>
                      {item.id === "applications" &&
                        s.drivers.filter((d) =>
                          ["Submitted", "Second review"].includes(d.status),
                        ).length > 0 && (
                          <b>
                            {
                              s.drivers.filter((d) =>
                                ["Submitted", "Second review"].includes(
                                  d.status,
                                ),
                              ).length
                            }
                          </b>
                        )}
                    </button>
                  ))}
                </div>
              ) : null;
            })}
          </nav>
          <div className="sidebar-foot">
            <span className="local-dot" />
            <div>
              <strong>Presentation workspace</strong>
              <small>Local demo · sample data</small>
            </div>
            <ShieldCheck size={15} />
          </div>
        </aside>
        {sidebar && (
          <button
            className="sidebar-backdrop"
            aria-label="Close navigation"
            onClick={() => setSidebar(false)}
          />
        )}
        <div className="main-shell">
          <header className="topbar">
            <div className="breadcrumb">
              <button
                className="icon-btn mobile-menu"
                aria-label="Open navigation"
                onClick={() => setSidebar(!sidebar)}
              >
                <Menu size={20} />
              </button>
              <span>Workspace</span>
              <ChevronRight size={12} />
              <strong>{title}</strong>
            </div>
            <div className="topbar-right">
              <div className="global-search">
                <Search size={16} />
                <input
                  aria-label="Global search"
                  placeholder="Search anything…"
                  value={search}
                  onFocus={() => setSearchOpen(true)}
                  onChange={(e) => {
                    setSearch(e.target.value);
                    setSearchOpen(true);
                  }}
                />
                <kbd>⌕</kbd>
              </div>
              <span className="demo-chip">
                <i />
                Demo
              </span>
              <button
                className="notification-button icon-btn"
                aria-label="Open work queues"
                onClick={() => setNotifications(!notifications)}
              >
                <Bell size={18} />
                <b>{queues.reduce((a, q) => a + q.count, 0)}</b>
              </button>
              <div className="staff-picker">
                <span className="staff-avatar">
                  {user.name
                    .split(" ")
                    .map((x) => x[0])
                    .slice(0, 2)
                    .join("")}
                </span>
                <label>
                  <strong>{user.name}</strong>
                  <select
                    aria-label="Demo staff account"
                    value={actor}
                    onChange={(e) => void switchActor(e.target.value)}
                  >
                    {s.staff
                      .filter((x) => x.active)
                      .map((x) => (
                        <option value={x.id} key={x.id}>
                          {x.name} ·{" "}
                          {s.roles.find((r) => r.id === x.roleId)?.name}
                        </option>
                      ))}
                  </select>
                  <small>{role?.name}</small>
                </label>
                <ChevronDown size={12} />
              </div>
            </div>
          </header>
          <main className="main-content">
            {allowed(page + ".view") ? (
              <PageComponent />
            ) : (
              <div className="access-denied">
                <ShieldCheck size={38} />
                <h1>Access is restricted</h1>
                <p>
                  Your current role does not have access to{" "}
                  {title.toLowerCase()}.
                </p>
                <Button variant="secondary" onClick={() => go("overview")}>
                  Back to overview
                </Button>
              </div>
            )}
          </main>
        </div>
      </div>
      {searchOpen && (
        <div className="search-overlay">
          <div>
            <h3>
              Search across your workspace
              <button
                className="icon-btn"
                aria-label="Close search"
                onClick={() => setSearchOpen(false)}
              >
                <X size={18} />
              </button>
            </h3>
            {!search ? (
              <p className="muted">
                Search a name, plate, phone number or trip reference.
              </p>
            ) : searchRows.length ? (
              searchRows.map((x) => (
                <button key={x.page + x.id} onClick={() => go(x.page, x.id)}>
                  <Search size={15} />
                  <div>
                    <strong>{x.name}</strong>
                    <small>{x.sub}</small>
                  </div>
                  <span>{x.page}</span>
                  <ArrowRight size={14} />
                </button>
              ))
            ) : (
              <p className="muted">No permitted records match your search.</p>
            )}
          </div>
        </div>
      )}
      {notifications && (
        <div className="notification-panel">
          <header>
            <h3>Your work queues</h3>
            <button
              className="icon-btn"
              aria-label="Close queues"
              onClick={() => setNotifications(false)}
            >
              <X size={18} />
            </button>
          </header>
          {queues.map((q) => (
            <button key={q.page} onClick={() => go(q.page)}>
              <span>{q.label}</span>
              <b>{q.count}</b>
              <ArrowRight size={14} />
            </button>
          ))}
          <small>Calculated from local sample records.</small>
        </div>
      )}
      {drawer && (
        <Drawer
          title={drawer.title}
          subtitle={drawer.subtitle}
          onClose={closePanel}
        >
          {drawer.content}
        </Drawer>
      )}
      {form && (
        <FormModal key={form.title} spec={form} onClose={() => setForm(null)} />
      )}{" "}
      {toast && (
        <div role="status" className={`toast ${toast.error ? "error" : ""}`}>
          {toast.error ? <X size={17} /> : <CheckCheck size={17} />}
          <span>{toast.text}</span>
          <button aria-label="Dismiss message" onClick={() => setToast(null)}>
            <X size={15} />
          </button>
        </div>
      )}
    </Context.Provider>
  );
}
