import { useEffect, useState, type ReactNode } from "react";
import {
  ArrowDown,
  ArrowUp,
  ArrowUpRight,
  Check,
  ChevronDown,
  ChevronLeft,
  ChevronRight,
  Download,
  Filter,
  Search,
  SlidersHorizontal,
  X,
} from "lucide-react";
import { dateLabel, money } from "./domain/model";
export function Badge({
  children,
  tone,
}: {
  children: ReactNode;
  tone?: string;
}) {
  const value = String(children);
  const good =
    /Approved|Active|Settled|Verified|Collected|Completed|Delivered|Valid|Resolved|Success|Online/.test(
      value,
    );
  const bad =
    /Rejected|Failed|Expired|Suspended|Urgent|Restricted|Missing|Cancelled|Blocked/.test(
      value,
    );
  return (
    <span
      className={`badge ${tone ?? (good ? "good" : bad ? "bad" : /Pending|review|Submitted|Open|progress|Assigned|Returning|Unpaid|Corrections/.test(value) ? "warn" : "neutral")}`}
    >
      <i />
      {children}
    </span>
  );
}
export function Button({
  children,
  onClick,
  variant = "",
  disabled = false,
  type = "button",
  title,
}: {
  children: ReactNode;
  onClick?: () => void;
  variant?: string;
  disabled?: boolean;
  type?: "button" | "submit";
  title?: string;
}) {
  return (
    <button
      type={type}
      title={title}
      className={`btn ${variant}`}
      onClick={onClick}
      disabled={disabled}
    >
      {children}
    </button>
  );
}
export function Empty({ title, detail }: { title: string; detail?: string }) {
  return (
    <div className="empty">
      <Search size={27} />
      <h3>{title}</h3>
      <p>{detail ?? "Try a different search or filter."}</p>
    </div>
  );
}
export function Card({
  title,
  subtitle,
  action,
  children,
  className = "",
}: {
  title?: string;
  subtitle?: string;
  action?: ReactNode;
  children: ReactNode;
  className?: string;
}) {
  return (
    <section className={`card ${className}`}>
      {title && (
        <header className="card-head">
          <div>
            <h3>{title}</h3>
            {subtitle && <p>{subtitle}</p>}
          </div>
          {action}
        </header>
      )}
      {children}
    </section>
  );
}
export function Metric({
  label,
  value,
  note,
  icon,
  change,
}: {
  label: string;
  value: ReactNode;
  note?: string;
  icon?: ReactNode;
  change?: number;
}) {
  return (
    <div className="metric">
      <div className="metric-label">
        {label}
        <span className="metric-icon">{icon}</span>
      </div>
      <strong>{value}</strong>
      <div className="metric-foot">
        {change !== undefined ? (
          <span className={change >= 0 ? "positive" : "negative"}>
            {change >= 0 ? <ArrowUp size={12} /> : <ArrowDown size={12} />}{" "}
            {Math.abs(change).toFixed(1)}%
          </span>
        ) : null}
        <span>{note}</span>
      </div>
    </div>
  );
}
export type Column<T> = {
  key: string;
  label: string;
  render?: (v: T) => ReactNode;
};
export function DataTable<T extends { id: string }>({
  rows,
  columns,
  onRow,
  onExport,
  title = "records",
  extra,
  initialSearch = "",
  bulk,
}: {
  rows: T[];
  columns: Column<T>[];
  onRow?: (v: T) => void;
  onExport?: (v: T[]) => void;
  title?: string;
  extra?: ReactNode;
  initialSearch?: string;
  bulk?: (ids: string[]) => void;
}) {
  const [search, setSearch] = useState(initialSearch),
    [filter, setFilter] = useState("All statuses"),
    [page, setPage] = useState(0),
    [sort, setSort] = useState(""),
    [reverse, setReverse] = useState(false),
    [selected, setSelected] = useState<string[]>([]),
    [saved, setSaved] = useState(""),
    [columnMenu, setColumnMenu] = useState(false),
    [visibleColumns, setVisibleColumns] = useState(columns.map((c) => c.key));
  const displayedColumns = columns.filter((c) =>
    visibleColumns.includes(c.key),
  );
  const statusOf = (v: T) =>
    String(
      (v as Record<string, unknown>).status ??
        (v as Record<string, unknown>).payment ??
        "",
    );
  const statuses = [...new Set(rows.map(statusOf).filter(Boolean))];
  let filtered = rows.filter(
    (v) =>
      (filter === "All statuses" || statusOf(v) === filter) &&
      Object.values(v).some(
        (x) =>
          typeof x !== "object" &&
          String(x).toLowerCase().includes(search.toLowerCase()),
      ),
  );
  if (sort)
    filtered = [...filtered].sort(
      (a, b) =>
        String((a as Record<string, unknown>)[sort] ?? "").localeCompare(
          String((b as Record<string, unknown>)[sort] ?? ""),
          undefined,
          { numeric: true },
        ) * (reverse ? -1 : 1),
    );
  const maxPage = Math.max(0, Math.ceil(filtered.length / 10) - 1),
    currentPage = Math.min(page, maxPage),
    shown = filtered.slice(currentPage * 10, currentPage * 10 + 10);
  const saveView = () => {
    localStorage.setItem(
      "zemengo-view-" + title,
      JSON.stringify({ search, filter, columns: visibleColumns }),
    );
    setSaved("View saved");
  };
  return (
    <div className="data-table">
      <div className="table-toolbar">
        <div className="search-input">
          <Search size={16} />
          <input
            aria-label={`Search ${title}`}
            placeholder={`Search ${title}...`}
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              setPage(0);
            }}
          />
          {search && (
            <button title="Clear search" onClick={() => setSearch("")}>
              <X size={14} />
            </button>
          )}
        </div>
        <div className="toolbar-right">
          {statuses.length > 0 && (
            <label className="select-wrap">
              <Filter size={14} />
              <select
                aria-label="Filter status"
                value={filter}
                onChange={(e) => {
                  setFilter(e.target.value);
                  setPage(0);
                }}
              >
                <option>All statuses</option>
                {statuses.map((x) => (
                  <option key={x}>{x}</option>
                ))}
              </select>
            </label>
          )}
          <button
            className="icon-btn"
            title="Choose columns"
            aria-label="Choose columns"
            onClick={() => setColumnMenu(!columnMenu)}
          >
            <SlidersHorizontal size={17} />
          </button>
          {columnMenu && (
            <div className="column-menu">
              {columns.map((c) => (
                <label key={c.key}>
                  <input
                    type="checkbox"
                    checked={visibleColumns.includes(c.key)}
                    disabled={
                      visibleColumns.length === 1 &&
                      visibleColumns.includes(c.key)
                    }
                    onChange={(e) =>
                      setVisibleColumns(
                        e.target.checked
                          ? [...visibleColumns, c.key]
                          : visibleColumns.filter((x) => x !== c.key),
                      )
                    }
                  />
                  {c.label}
                </label>
              ))}
              <button
                className="text-link"
                onClick={() => {
                  saveView();
                  setColumnMenu(false);
                }}
              >
                Save current view
              </button>
            </div>
          )}
          <button
            className="subtle"
            onClick={() => {
              const v = localStorage.getItem("zemengo-view-" + title);
              if (v) {
                const x = JSON.parse(v);
                setSearch(x.search);
                setFilter(x.filter);
                if (Array.isArray(x.columns)) setVisibleColumns(x.columns);
                setSaved("Saved view restored");
              } else setSaved("Save a view first");
            }}
          >
            {saved || "Saved view"}
          </button>
          {onExport && (
            <Button
              variant="small secondary"
              onClick={() => onExport(filtered)}
            >
              <Download size={14} />
              Export
            </Button>
          )}
          {extra}
        </div>
      </div>
      {selected.length > 0 && (
        <div className="selection-bar">
          {selected.length} selected{" "}
          {bulk && (
            <Button variant="small secondary" onClick={() => bulk(selected)}>
              Assign selected cases
            </Button>
          )}
          <button onClick={() => setSelected([])}>Clear selection</button>
        </div>
      )}
      <div className="table-scroll">
        <table>
          <thead>
            <tr>
              {bulk && (
                <th>
                  <input
                    aria-label="Select visible records"
                    type="checkbox"
                    checked={
                      shown.length > 0 &&
                      shown.every((x) => selected.includes(x.id))
                    }
                    onChange={(e) =>
                      setSelected(
                        e.target.checked
                          ? [
                              ...new Set([
                                ...selected,
                                ...shown.map((x) => x.id),
                              ]),
                            ]
                          : selected.filter(
                              (id) => !shown.some((x) => x.id === id),
                            ),
                      )
                    }
                  />
                </th>
              )}
              {displayedColumns.map((c) => (
                <th key={c.key}>
                  <button
                    onClick={() => {
                      setSort(c.key);
                      setReverse(sort === c.key ? !reverse : false);
                    }}
                  >
                    {c.label}
                    {sort === c.key ? (
                      <ArrowDown size={12} />
                    ) : (
                      <ChevronDown size={12} />
                    )}
                  </button>
                </th>
              ))}
              {onRow && <th />}
            </tr>
          </thead>
          <tbody>
            {shown.map((row) => (
              <tr
                key={row.id}
                className={onRow ? "clickable" : ""}
                onClick={() => onRow?.(row)}
              >
                {bulk && (
                  <td onClick={(e) => e.stopPropagation()}>
                    <input
                      aria-label={`Select ${row.id}`}
                      type="checkbox"
                      checked={selected.includes(row.id)}
                      onChange={(e) =>
                        setSelected(
                          e.target.checked
                            ? [...selected, row.id]
                            : selected.filter((x) => x !== row.id),
                        )
                      }
                    />
                  </td>
                )}
                {displayedColumns.map((c) => (
                  <td key={c.key}>
                    {c.render
                      ? c.render(row)
                      : String((row as Record<string, unknown>)[c.key] ?? "—")}
                  </td>
                ))}
                {onRow && (
                  <td>
                    <ArrowUpRight size={15} className="muted" />
                  </td>
                )}
              </tr>
            ))}
          </tbody>
        </table>
        {shown.length === 0 && <Empty title="No matching records" />}
      </div>
      <footer className="table-footer">
        <span>
          Showing {filtered.length ? currentPage * 10 + 1 : 0}–
          {Math.min((currentPage + 1) * 10, filtered.length)} of{" "}
          {filtered.length.toLocaleString()} {title}
        </span>
        <div>
          <button
            className="icon-btn"
            aria-label="Previous page"
            disabled={currentPage === 0}
            onClick={() => setPage(currentPage - 1)}
          >
            <ChevronLeft size={16} />
          </button>
          <span className="page-count">
            {currentPage + 1} / {maxPage + 1}
          </span>
          <button
            className="icon-btn"
            aria-label="Next page"
            disabled={currentPage === maxPage}
            onClick={() => setPage(currentPage + 1)}
          >
            <ChevronRight size={16} />
          </button>
        </div>
      </footer>
    </div>
  );
}
export interface Field {
  name: string;
  label: string;
  type?: string;
  options?: (string | { label: string; value: string })[];
  required?: boolean;
  wide?: boolean;
  hint?: string;
}
export interface FormSpec {
  title: string;
  description?: string;
  fields: Field[];
  initial?: Record<string, string>;
  submit?: string;
  onSubmit: (
    values: Record<string, string>,
  ) => Promise<boolean | void> | boolean | void;
}
export function FormModal({
  spec,
  onClose,
}: {
  spec: FormSpec;
  onClose: () => void;
}) {
  useDialogFocus(".modal", onClose);
  const [values, setValues] = useState(spec.initial ?? {}),
    [busy, setBusy] = useState(false);
  return (
    <div
      className="modal-scrim"
      onMouseDown={(e) => {
        if (e.target === e.currentTarget) onClose();
      }}
    >
      <section
        role="dialog"
        aria-modal="true"
        aria-label={spec.title}
        className="modal"
      >
        <header>
          <div>
            <span className="eyebrow">ZEMENGO ADMINISTRATION</span>
            <h2>{spec.title}</h2>
          </div>
          <button
            className="icon-btn"
            aria-label="Close dialog"
            onClick={onClose}
          >
            <X size={20} />
          </button>
        </header>
        {spec.description && (
          <p className="modal-description">{spec.description}</p>
        )}
        <form
          onSubmit={async (e) => {
            e.preventDefault();
            setBusy(true);
            try {
              const ok = await spec.onSubmit(values);
              if (ok !== false) onClose();
            } finally {
              setBusy(false);
            }
          }}
        >
          <div className="form-grid">
            {spec.fields.map((f) => (
              <label className={f.wide ? "wide" : ""} key={f.name}>
                {f.label}
                {f.required && <span className="required"> *</span>}
                {f.options ? (
                  <select
                    value={values[f.name] ?? ""}
                    required={f.required}
                    onChange={(e) =>
                      setValues({ ...values, [f.name]: e.target.value })
                    }
                  >
                    <option value="">Select an option</option>
                    {f.options.map((x) => (
                      <option
                        key={typeof x === "string" ? x : x.value}
                        value={typeof x === "string" ? x : x.value}
                      >
                        {typeof x === "string" ? x : x.label}
                      </option>
                    ))}
                  </select>
                ) : f.type === "textarea" ? (
                  <textarea
                    rows={3}
                    required={f.required}
                    value={values[f.name] ?? ""}
                    onChange={(e) =>
                      setValues({ ...values, [f.name]: e.target.value })
                    }
                  />
                ) : (
                  <input
                    type={f.type ?? "text"}
                    step={f.type === "number" ? "0.01" : undefined}
                    required={f.required}
                    value={values[f.name] ?? ""}
                    onChange={(e) =>
                      setValues({ ...values, [f.name]: e.target.value })
                    }
                  />
                )}{" "}
                {f.hint && <small>{f.hint}</small>}
              </label>
            ))}
          </div>
          <footer className="modal-footer">
            <Button variant="secondary" onClick={onClose}>
              Cancel
            </Button>
            <Button type="submit" disabled={busy}>
              {busy ? "Saving…" : (spec.submit ?? "Save changes")}
              <Check size={15} />
            </Button>
          </footer>
        </form>
      </section>
    </div>
  );
}
export function Drawer({
  title,
  subtitle,
  children,
  onClose,
}: {
  title: string;
  subtitle?: string;
  children: ReactNode;
  onClose: () => void;
}) {
  useDialogFocus(".drawer", onClose);
  return (
    <div
      className="drawer-scrim"
      onMouseDown={(e) => {
        if (e.target === e.currentTarget) onClose();
      }}
    >
      <aside
        role="dialog"
        aria-modal="true"
        aria-label={title}
        className="drawer"
      >
        <header>
          <div>
            <span className="eyebrow">RECORD DETAILS</span>
            <h2>{title}</h2>
            {subtitle && <p>{subtitle}</p>}
          </div>
          <button
            className="icon-btn"
            aria-label="Close record"
            onClick={onClose}
          >
            <X size={20} />
          </button>
        </header>
        <div className="drawer-body">{children}</div>
      </aside>
    </div>
  );
}
export function Facts({ items }: { items: [string, ReactNode][] }) {
  return (
    <dl className="facts">
      {items.map(([label, value]) => (
        <div key={label}>
          <dt>{label}</dt>
          <dd>{value ?? "—"}</dd>
        </div>
      ))}
    </dl>
  );
}
export function Timeline({
  items,
}: {
  items: { time: string; text: string }[];
}) {
  return (
    <div className="timeline">
      {items.map((x, i) => (
        <div key={i}>
          <i />
          <div>
            <p>{x.text}</p>
            <small>{dateLabel(x.time)}</small>
          </div>
        </div>
      ))}
    </div>
  );
}
export function LineChart({
  values,
  labels,
  height = 210,
  moneyAxis = false,
}: {
  values: number[];
  labels: string[];
  height?: number;
  moneyAxis?: boolean;
}) {
  const max = Math.max(...values, 1) * 1.15;
  const w = 740,
    h = height,
    left = 55,
    bottom = 35;
  const points = values
    .map(
      (v, i) =>
        `${left + (i * (w - left - 15)) / Math.max(1, values.length - 1)},${h - bottom - (v / max) * (h - bottom - 15)}`,
    )
    .join(" ");
  return (
    <svg
      className="line-chart"
      viewBox={`0 0 ${w} ${h}`}
      role="img"
      aria-label={`${moneyAxis ? "Revenue in ETB" : "Record count"} by date`}
    >
      <title>{moneyAxis ? "Commission in ETB" : "Booking count"} by date</title>
      {Array.from({ length: 5 }, (_, i) => {
        const y = 15 + (i * (h - bottom - 15)) / 4;
        const v = max * (1 - i / 4);
        return (
          <g key={i}>
            <line
              x1={left}
              x2={w - 10}
              y1={y}
              y2={y}
              stroke="#edf0f4"
              strokeDasharray="4 4"
            />
            <text x={left - 10} y={y + 4} textAnchor="end">
              {v > 1000 ? (v / 1000).toFixed(1) + "k" : Math.round(v)}
            </text>
          </g>
        );
      })}
      <polygon
        points={`${left},${h - bottom} ${points} ${w - 15},${h - bottom}`}
        fill="#edf2ff"
      />
      <polyline
        points={points}
        fill="none"
        stroke="#1b50eb"
        strokeWidth="3"
        strokeLinejoin="round"
      />
      {labels.map((x, i) =>
        i % Math.max(1, Math.floor(labels.length / 7)) === 0 ? (
          <text
            key={i}
            x={left + (i * (w - left - 15)) / Math.max(1, labels.length - 1)}
            y={h - 10}
            textAnchor="middle"
          >
            {x}
          </text>
        ) : null,
      )}
      <text x="12" y="12">
        {moneyAxis ? "ETB" : "Count"}
      </text>
    </svg>
  );
}
export function BarList({
  rows,
  moneyValues = false,
}: {
  rows: { name: string; value: number }[];
  moneyValues?: boolean;
}) {
  const max = Math.max(...rows.map((x) => x.value), 1);
  return (
    <div className="bar-list">
      {rows.map((r, i) => (
        <div key={r.name}>
          <header>
            <span>
              <b className="rank">{String(i + 1).padStart(2, "0")}</b>
              {r.name}
            </span>
            <strong>
              {moneyValues ? money(r.value) : r.value.toLocaleString()}
            </strong>
          </header>
          <div className="bar-track">
            <i style={{ width: `${(r.value / max) * 100}%` }} />
          </div>
        </div>
      ))}
    </div>
  );
}
export function DownloadCSV(rows: unknown[], name: string) {
  if (!rows.length) throw Error("No records to export.");
  const keys = Object.keys(rows[0] as object).filter(
    (k) => !["documents", "file", "otp", "history"].includes(k),
  );
  const esc = (v: unknown) => {
    const t = typeof v === "object" ? JSON.stringify(v) : String(v ?? "");
    return (
      '"' + (/^[=+@\-]/.test(t) ? "'" : "") + t.replaceAll('"', '""') + '"'
    );
  };
  const csv =
    "\ufeff" +
    [
      keys.map(esc).join(","),
      ...rows.map((r) =>
        keys.map((k) => esc((r as Record<string, unknown>)[k])).join(","),
      ),
    ].join("\r\n");
  download(new Blob([csv], { type: "text/csv;charset=utf-8" }), name + ".csv");
}
export function download(blob: Blob, name: string) {
  const url = URL.createObjectURL(blob),
    a = document.createElement("a");
  a.href = url;
  a.download = name;
  a.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}

function useDialogFocus(selector: string, onClose: () => void) {
  useEffect(() => {
    const previous = document.activeElement as HTMLElement | null;
    const root = document.querySelector(selector) as HTMLElement | null;
    const targets = () =>
      Array.from(
        root?.querySelectorAll<HTMLElement>(
          "button:not([disabled]),input:not([type=hidden]):not([disabled]),select:not([disabled]),textarea:not([disabled]),a[href]",
        ) ?? [],
      ).filter((e) => e.offsetParent !== null);
    targets()[0]?.focus();
    const handle = (e: KeyboardEvent) => {
      if (selector === ".drawer" && document.querySelector(".modal")) return;
      if (e.key === "Escape") {
        e.preventDefault();
        onClose();
      }
      if (e.key === "Tab") {
        const list = targets(),
          first = list[0],
          last = list.at(-1);
        if (e.shiftKey && document.activeElement === first) {
          e.preventDefault();
          last?.focus();
        } else if (!e.shiftKey && document.activeElement === last) {
          e.preventDefault();
          first?.focus();
        }
      }
    };
    window.addEventListener("keydown", handle);
    return () => {
      window.removeEventListener("keydown", handle);
      previous?.focus();
    };
  }, [selector, onClose]);
}
