import { createContext, useContext, type ReactNode } from "react";
import type { Command, State, Page } from "./domain/model";
import type { FormSpec } from "./components";
export interface AdminContext {
  s: State;
  actor: string;
  run: (c: Command) => Promise<boolean>;
  allowed: (permission: string) => boolean;
  form: (spec: FormSpec) => void;
  notice: (text: string, error?: boolean) => void;
  go: (page: Page, id?: string) => void;
  exportRows: (
    rows: unknown[],
    name: string,
    permission: string,
  ) => Promise<void>;
  panel: (title: string, content: ReactNode, subtitle?: string) => void;
  closePanel: () => void;
  replaceData: (next: State, kind: string) => Promise<void>;
}
export const Context = createContext<AdminContext | null>(null);
export function useAdmin() {
  const v = useContext(Context);
  if (!v) throw Error("Admin context missing");
  return v;
}
