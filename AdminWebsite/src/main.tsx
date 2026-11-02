import { createRoot } from "react-dom/client";
import { Component, type ReactNode } from "react";
import App from "./App";
class ErrorBoundary extends Component<
  { children: ReactNode },
  { error: string }
> {
  state = { error: "" };
  static getDerivedStateFromError(e: Error) {
    return { error: e.message };
  }
  render() {
    return this.state.error ? (
      <div style={{ padding: 48, fontFamily: "sans-serif" }}>
        <h1>This view needs attention</h1>
        <p>{this.state.error}</p>
        <button onClick={() => location.reload()}>Reload local demo</button>
      </div>
    ) : (
      this.props.children
    );
  }
}
createRoot(document.getElementById("root")!).render(
  <ErrorBoundary>
    <App />
  </ErrorBoundary>,
);
