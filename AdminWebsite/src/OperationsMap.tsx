import type { Feature, LineString } from "geojson";
import { useEffect, useRef, useState } from "react";
import maplibregl from "maplibre-gl";
import "maplibre-gl/dist/maplibre-gl.css";
import { Expand, MapPin, RefreshCw } from "lucide-react";
import type { Driver, Trip } from "./domain/model";
export default function OperationsMap({
  drivers,
  trips,
  selected,
  onTrip,
  compact = false,
}: {
  drivers: Driver[];
  trips: Trip[];
  selected?: Trip;
  onTrip?: (t: Trip) => void;
  compact?: boolean;
}) {
  const container = useRef<HTMLDivElement>(null),
    map = useRef<maplibregl.Map | null>(null),
    markers = useRef<maplibregl.Marker[]>([]),
    [loaded, setLoaded] = useState(false),
    [failed, setFailed] = useState(false),
    [retry, setRetry] = useState(0);
  const key = import.meta.env.VITE_GEBETA_API_KEY as string | undefined;
  useEffect(() => {
    if (!key || !container.current) return;
    setFailed(false);
    setLoaded(false);
    const m = new maplibregl.Map({
      container: container.current,
      style: `https://tiles.gebeta.app/styles/standard/style.json?apiKey=${encodeURIComponent(key)}`,
      center: [38.775, 9.009],
      zoom: 12,
      attributionControl: { compact: true },
      transformRequest: (url) => {
        if (url.includes("gebeta.app") && !url.includes("apiKey="))
          return {
            url:
              url +
              (url.includes("?") ? "&" : "?") +
              "apiKey=" +
              encodeURIComponent(key),
          };
        return { url };
      },
    });
    map.current = m;
    m.addControl(
      new maplibregl.NavigationControl({ showCompass: false }),
      "bottom-right",
    );
    m.on("load", () => setLoaded(true));
    m.on("error", () => {
      if (!m.isStyleLoaded()) setFailed(true);
    });
    const timer = setTimeout(() => {
      if (!m.isStyleLoaded()) setFailed(true);
    }, 16000);
    return () => {
      clearTimeout(timer);
      markers.current.forEach((x) => x.remove());
      markers.current = [];
      m.remove();
      map.current = null;
    };
  }, [key, retry]);
  useEffect(() => {
    const m = map.current;
    if (!m || !loaded) return;
    markers.current.forEach((x) => x.remove());
    markers.current = [];
    drivers
      .filter((d) => d.status === "Approved" && d.online)
      .slice(0, 30)
      .forEach((d) => {
        const el = document.createElement("div");
        el.className = "map-car";
        el.title = `${d.name} · ${d.plate} · simulated position`;
        const img = document.createElement("img");
        img.src = "/images/map_car.png";
        img.alt = d.plate;
        el.append(img);
        markers.current.push(
          new maplibregl.Marker({ element: el })
            .setLngLat([d.lng, d.lat])
            .addTo(m),
        );
      });
    if (selected) {
      const points = [
        selected.pickupCoords,
        [selected.pickupCoords[0] + 0.012, selected.pickupCoords[1] + 0.008],
        selected.destCoords,
      ] as [number, number][];
      const data: Feature<LineString> = {
        type: "Feature",
        properties: {},
        geometry: { type: "LineString", coordinates: points },
      };
      if (m.getSource("demo-route"))
        (m.getSource("demo-route") as maplibregl.GeoJSONSource).setData(data);
      else {
        m.addSource("demo-route", { type: "geojson", data });
        m.addLayer({
          id: "demo-route",
          type: "line",
          source: "demo-route",
          paint: {
            "line-color": "#1b50eb",
            "line-width": 5,
            "line-dasharray": [2, 1],
          },
        });
      }
      for (const [i, point] of [
        selected.pickupCoords,
        selected.destCoords,
      ].entries())
        markers.current.push(
          new maplibregl.Marker({ color: i ? "#1b50eb" : "#15b887" })
            .setLngLat(point)
            .addTo(m),
        );
      const p = selected.progress;
      const pos: [number, number] = [
        selected.pickupCoords[0] +
          (selected.destCoords[0] - selected.pickupCoords[0]) * p,
        selected.pickupCoords[1] +
          (selected.destCoords[1] - selected.pickupCoords[1]) * p,
      ];
      const el = document.createElement("div");
      el.className = "map-car selected";
      el.innerHTML =
        '<img src="/images/map_car.png" alt="Simulated trip car"/>';
      markers.current.push(
        new maplibregl.Marker({ element: el }).setLngLat(pos).addTo(m),
      );
      m.fitBounds(
        new maplibregl.LngLatBounds(selected.pickupCoords, selected.destCoords),
        { padding: 70, maxZoom: 13, duration: 600 },
      );
    }
  }, [drivers, selected, loaded]);
  const xy = (lng: number, lat: number) => [
    ((lng - 38.72) / 0.17) * 900,
    ((9.055 - lat) / 0.085) * 520,
  ];
  const fallback = !key || failed;
  return (
    <div className={`operations-map ${compact ? "compact" : ""}`}>
      <div
        className="real-map"
        ref={container}
        style={{ visibility: fallback ? "hidden" : "visible" }}
      />
      {fallback && (
        <svg
          className="preview-map"
          viewBox="0 0 900 520"
          role="img"
          aria-label="Addis Ababa map preview with simulated positions"
        >
          <rect width="900" height="520" fill="#f0f3ef" />
          {Array.from({ length: 15 }, (_, i) => (
            <path
              key={i}
              d={`M ${i * 80 - 200} 0 L ${i * 80 + 180} 520`}
              stroke={i % 3 ? "#fff" : "#e2e8df"}
              strokeWidth={i % 3 ? 8 : 32}
            />
          ))}
          {Array.from({ length: 10 }, (_, i) => (
            <path
              key={i}
              d={`M 0 ${i * 75 - 100} Q 450 ${i * 75 + 50} 900 ${i * 75 - 40}`}
              fill="none"
              stroke="white"
              strokeWidth={i % 3 ? 7 : 20}
            />
          ))}
          <path
            d="M 420 0 Q 510 220 650 520"
            fill="none"
            stroke="#b7d5f4"
            strokeWidth="4"
          />
          <path
            d="M 50 100 Q 250 40 400 150 L 330 220 130 230 Z"
            fill="#dfe9d7"
          />
          <ellipse cx="740" cy="430" rx="70" ry="42" fill="#e0e7db" />
          {[
            ["Arada", 180, 110],
            ["Yeka", 650, 100],
            ["Kirkos", 360, 320],
            ["Bole", 620, 350],
            ["Addis Ababa", 410, 230],
            ["Bole Airport", 720, 470],
          ].map(([n, x, y]) => (
            <text
              key={n}
              x={x}
              y={y}
              className={n === "Addis Ababa" ? "city-label" : "district-label"}
            >
              {n}
            </text>
          ))}
          {drivers
            .filter((d) => d.status === "Approved" && d.online)
            .slice(0, 25)
            .map((d) => {
              const [x, y] = xy(d.lng, d.lat);
              return (
                <g key={d.id}>
                  <circle cx={x} cy={y} r="12" fill="white" stroke="#d5ded7" />
                  <image
                    href="/images/map_car.png"
                    x={x - 7}
                    y={y - 10}
                    width="14"
                    height="20"
                  />
                </g>
              );
            })}
          {selected &&
            (() => {
              const a = xy(...selected.pickupCoords),
                b = xy(...selected.destCoords);
              return (
                <g>
                  <path
                    d={`M ${a.join(" ")} L ${a[0] + 40} ${a[1] - 60} L ${b.join(" ")}`}
                    fill="none"
                    stroke="#1b50eb"
                    strokeWidth="5"
                    strokeDasharray="8 4"
                  />
                  <circle
                    cx={a[0]}
                    cy={a[1]}
                    r="9"
                    fill="#20c997"
                    stroke="white"
                    strokeWidth="3"
                  />
                  <circle
                    cx={b[0]}
                    cy={b[1]}
                    r="9"
                    fill="#1b50eb"
                    stroke="white"
                    strokeWidth="3"
                  />
                </g>
              );
            })()}
        </svg>
      )}
      <div className="map-top">
        <span className="map-label">
          <i className={fallback ? "" : "online-dot"} />
          {fallback
            ? "Map preview"
            : loaded
              ? "Live basemap"
              : "Loading map…"}{" "}
          <span>· simulated positions</span>
        </span>
        {failed && (
          <button
            className="icon-btn"
            title="Retry live map"
            onClick={() => setRetry((x) => x + 1)}
          >
            <RefreshCw size={16} />
          </button>
        )}
        <button
          className="icon-btn"
          title="Recenter Addis Ababa"
          onClick={() =>
            map.current?.flyTo({ center: [38.775, 9.009], zoom: 12 })
          }
        >
          <Expand size={16} />
        </button>
      </div>
      {!compact && (
        <div className="map-bottom">
          <span>
            <i className="legend-dot green" />
            Online partners
          </span>
          <span>
            <i className="legend-dot blue" />
            Simulated trip
          </span>
          <span>
            <MapPin size={12} />
            Addis Ababa
          </span>
        </div>
      )}
      {compact && onTrip && trips.find((t) => t.status === "In progress") && (
        <button
          className="map-link"
          onClick={() => onTrip(trips.find((t) => t.status === "In progress")!)}
        >
          Open dispatch map →
        </button>
      )}
    </div>
  );
}
