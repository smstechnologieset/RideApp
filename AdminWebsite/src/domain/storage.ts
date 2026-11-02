import { audit, execute, validateBackup } from "./engine";
import { seed } from "./seed";
import type { State, Command } from "./model";
const channel =
  typeof BroadcastChannel !== "undefined"
    ? new BroadcastChannel("zemengo-admin")
    : null;
let dbPromise: Promise<IDBDatabase> | undefined;
function db() {
  return (dbPromise ??= new Promise((resolve, reject) => {
    const r = indexedDB.open("zemengo-admin-demo", 1);
    r.onupgradeneeded = () => r.result.createObjectStore("state");
    r.onsuccess = () => resolve(r.result);
    r.onerror = () => reject(r.error);
  }));
}
export async function load(): Promise<State> {
  const d = await db();
  return new Promise((resolve, reject) => {
    const r = d.transaction("state").objectStore("state").get("current");
    r.onsuccess = () => resolve(r.result ?? seed());
    r.onerror = () => reject(r.error);
  });
}
export async function commit(
  snapshot: State,
  actor: string,
  command: Command,
): Promise<{ state: State; error?: string }> {
  const database = await db();
  return new Promise((resolve, reject) => {
    const tx = database.transaction("state", "readwrite"),
      store = tx.objectStore("state"),
      get = store.get("current");
    let result: { state: State; error?: string };
    get.onsuccess = () => {
      const current: State = get.result ?? snapshot;
      if (current.revision !== snapshot.revision) {
        tx.abort();
        return reject(
          Error(
            "Records changed in another tab. Reloading the current data; retry your action.",
          ),
        );
      }
      try {
        result = { state: execute(current, actor, command) };
      } catch (e) {
        const fresh = structuredClone(current);
        const message = (e as Error).message;
        const p = fresh.deliveries.find((x) => x.id === command.id);
        if (
          command.type === "deliveryUpdate" &&
          command.data?.action === "Verify OTP" &&
          message === "Incorrect recipient code." &&
          p
        )
          p.otpAttempts++;
        audit(
          fresh,
          actor,
          command.type,
          command.id ?? "",
          message,
          "",
          "",
          "Rejected",
        );
        fresh.revision++;
        result = { state: fresh, error: message };
      }
      store.put(result.state, "current");
    };
    tx.oncomplete = () => {
      channel?.postMessage("changed");
      resolve(result);
    };
    tx.onerror = () =>
      reject(
        Error("Unable to save local data. Check browser storage and retry."),
      );
  });
}
export async function replace(
  current: State,
  actor: string,
  next: State,
  kind: string,
) {
  validateBackup(next);
  const database = await db();
  next = structuredClone(next);
  next.revision = current.revision + 1;
  audit(next, actor, kind, "Local dataset", "Confirmed local data replacement");
  return new Promise<State>((resolve, reject) => {
    const tx = database.transaction("state", "readwrite");
    tx.objectStore("state").put(next, "current");
    tx.oncomplete = () => {
      channel?.postMessage("changed");
      resolve(next);
    };
    tx.onerror = () => reject(Error("Could not replace local data."));
  });
}
export function onExternalChange(callback: () => void) {
  if (!channel) return () => {};
  const handler = () => callback();
  channel.addEventListener("message", handler);
  return () => channel.removeEventListener("message", handler);
}
