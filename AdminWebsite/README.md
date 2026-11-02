# ZemenGo Admin

A local administration demo for the ZemenGo client presentation. English, Addis Ababa, ETB, with ZemenGo branding and connected synthetic records.

## Start the demo

Double-click **Start-Admin.cmd** in this folder, then open **http://127.0.0.1:5173/**. Keep its terminal window open. Press Ctrl+C when finished.

The build and dependencies are already present on this laptop. No hosting, domain, payment account, or SMS purchase is needed. The launch file uses the compiled build for presentation. If the website is already running on port 5173, use that browser tab instead of starting a second server.

For development, open PowerShell in this folder:

```powershell
npm.cmd run dev
```

After source changes, refresh the presentation build:

```powershell
npm.cmd run build
```

On another laptop, Node.js 22+ and npm are required. Run `npm.cmd ci` once to install the versions in package-lock.json. The launch file also does this if dependencies are missing. Installation requires internet; ordinary local workflows do not. The live basemap requires internet and the configured map key.

## Presentation flows

- Overview, booking charts, work queues, global search, detailed records, filters, saved columns, CSV exports, and analytics.
- Driver application documents and inspection, first review, independent second approval, suspension, service eligibility, and audit trail.
- Office booking, assign/reassign, cancel, adjust fare, and simulated partner trip progress on an actual Gebeta basemap.
- Prepaid commission reservations, top-ups with a separate approver, cash collections, simulated Chapa outcomes, refunds, payout holds, and traceable ledger entries.
- Customer records, support and safety cases, restaurant onboarding, food order previews, package returns and recipient OTP proof previews.
- Custom roles with module/action toggles, staff accounts, announcements, promotions, service settings, review flags, and local backup/restore.

See **[the rehearsal guide](docs/DEMO_HANDOFF.md)** for examples, sample staff identities, and verification notes. The original scope remains in [ADMIN_WEBSITE_PLAN.md](ADMIN_WEBSITE_PLAN.md).

## Demo data and integrations

Initial records include 60 drivers, 800 customers, 1,200 trips, 12 restaurants, 200 food orders, and 100 package deliveries. Changes persist in this browser's IndexedDB. Use the same browser profile and `127.0.0.1:5173` address; `localhost`, another port, or another browser has separate local data. Private browsing and clearing site data can discard the scenario.

Use **Settings → Export backup** before a rehearsal if you want to restore the same scenario. Reset is also available with a typed confirmation. A backup includes local documents you chose to attach.

The existing map key is in ignored `.env.local`. `.env.example` documents the variable without including a key. Restart the dev server after changing environment variables; rebuild for the presentation launcher. A map preview with a retry control is available if the live map fails. Provider attribution is retained.

This is a browser-local demo. Staff selection demonstrates permission behavior without real sign-in. Payments, OTP/SMS, push messages, driver events, and financial approvals do not contact real services. Sample documents are marked as samples; uploaded evidence remains local. The Flutter customer app and future Zemen Pro app do not yet share a backend with this website. Restaurant branches, menus, and partner order handling belong in the future Zemen Pro restaurant workspace.

Office locations are curated Addis Ababa landmarks; distances and duration are entered for the sample quote. Displayed routes and vehicle positions are simulated. Live search, directions, GPS and dispatch integrations require the shared backend and provider adapters.

## Checks

```powershell
npm.cmd test
npm.cmd run build
```

The domain suite verifies permissions, independent approvals, evidence expiry and review invalidation, dispatch eligibility, reservations, cash/Chapa accounting, refund/payout rules, OTP confirmation, owner protection, audit values, and backup validation. TypeScript checking runs as part of the build.

## Source layout

- `src/domain/`: typed records, connected seed data, command rules, IndexedDB persistence and domain tests.
- `src/pages.tsx`: administration modules and record workflows.
- `src/components.tsx`: shared tables, charts, forms and dialogs.
- `src/OperationsMap.tsx`: basemap and simulated tracking adapter.
- `public/images/`: existing ZemenGo imagery reused from CustomerApp.
- `dist/`: generated presentation build; regenerate after changes.

## Following this demo

Build the shared API and server-side authentication/permissions, then connect CustomerApp and the Zemen Pro driver/restaurant workspaces. Server validation, document storage, webhook verification, real notifications, operational security and payment reconciliation are required before live use. The local command rules and data types provide examples for that implementation; browser state and local audit history are editable and are not production controls.
