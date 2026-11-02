# ZemenGo Admin — comprehensive demo plan

**Status:** Approved. Local admin demo implemented; presentation validation and launch guidance are recorded in [docs/DEMO_HANDOFF.md](docs/DEMO_HANDOFF.md). RestaurantWebsite removed. Production integrations remain later work.

**Prepared:** 28 October 2026. The existing presentation target is 29 October; this plan brings the admin demonstration into that presentation. Delivery checkpoints below establish the build order, rather than promising a production platform within that deadline.

**Location:** `C:\SMS\RideApp\AdminWebsite`.

## 1. What we are building

A substantial, polished staff administration website that runs on your laptop and demonstrates how ZemenGo will be operated. It will use connected sample records, working forms and actions, persistent local changes, meaningful reports, and realistic exception cases.

Rides receive the deepest end-to-end implementation: driver applications, independent approval, dispatch, trip management, pricing, prepaid driver balances, payments, support, and reporting. Restaurant, food, and package sections will have useful sample workflows and administrative oversight, ready for later integration.

The initial operating context is Addis Ababa, English, ETB, and local Addis Ababa time. The website follows the existing ZemenGo logo, royal blue, white/light neutral surfaces, typography hierarchy, and restrained green status accents.

No hosting, domain, merchant activation, SMS purchase, or new paid account is needed for this demo. Its records and external-service events are simulated. Existing Gebeta access may provide the real basemap when browser access is verified; driver movement remains simulated.

### What the client should be able to see

- Staff create a custom role and immediately see its permitted pages and actions.
- Two different staff accounts review and approve a driver application with documents and an inspection.
- A call operator books a ride, assigns an eligible driver, and follows its progress on the operations map.
- A driver with insufficient credit is blocked from new work, then becomes eligible after an approved top-up.
- A completed trip produces consistent payment, commission, wallet, and reporting records.
- Staff investigate a payment exception, customer complaint, document expiry, or safety incident.
- Restaurant onboarding and package delivery previews demonstrate the wider platform.
- The owner follows each change through a searchable audit history.

## 2. Platform decisions and boundaries

**CustomerApp:** The existing ZemenGo customer application remains the customer experience. Its current records are stored on the phone. This admin demo will use its own coherent sample dataset; it will not claim to receive live records from that APK.

**DriverApp / Zemen Pro:** Your latest decision expands Zemen Pro into a partner mobile app with distinct driver and restaurant workspaces. Drivers apply and later manage jobs there. Restaurant operators apply and later manage their restaurants there. Someone with both approved roles can switch workspaces; the two experiences keep separate permissions and navigation. The directory can remain named `DriverApp` while the product is called Zemen Pro.

**AdminWebsite:** Access is for staff invited or created by the owner/admin. Driver approval unlocks the driver workspace in Zemen Pro; restaurant approval unlocks the restaurant workspace. Approval does not create staff access to AdminWebsite. This is the proposed interpretation of “full access after approval.”

**RestaurantWebsite:** Removed at your request. Restaurant self-service has moved to the planned Zemen Pro restaurant workspace. Building that mobile workspace is a later task; this plan only defines its relationship with administration.

**Shared backend:** A future backend will connect these experiences. For the presentation, incoming Zemen Pro applications, app support messages, GPS events, payment outcomes, SMS, and push notifications are explicitly simulated.

## 3. Website structure and page inventory

Navigation will be grouped into Operations, People & Partners, Finance, Growth & Insights, and Administration. Each group contains only the sections available to the current staff member. The owner sees the complete navigation.

### 3.1 Overview and work queues

- Overview cards for trips, available drivers, gross booking value, platform commission, unpaid amounts, pending approvals, and open incidents.
- Date, service, vehicle class, and Addis service-zone filters.
- Work queues for unassigned trips, driver reviews, expired documents, insufficient balances, payment exceptions, support deadlines, and second approvals.
- Recent activity, operational trends, and shortcuts into the underlying records.
- Every statistic opens a filtered list explaining its total.

### 3.2 Operations map and dispatch

- Addis map with available, assigned, busy, and offline driver states; pickup/drop-off points; active trips; unassigned requests; and service boundaries.
- Driver clustering, map legend, route selection, driver detail panel, and last-update time.
- Search by trip, customer phone, driver, or plate number.
- Manual booking for callers, driver eligibility checks, assignment, reassignment, cancellation, and an exception queue.
- Controls to advance or pause simulated trip events for a reliable presentation.
- Clear connection/error/retry behavior and a labelled map preview if live tiles are unavailable.

### 3.3 Trips

- Searchable, sortable, paginated trip list with status, booking source, payment status, vehicle class, date, zone, and assigned-staff filters.
- Trip detail with customer, driver, vehicle, pickup/drop-off, route, quote, final fare, payment, wallet entries, communication history, and support links.
- A timeline covering request, assignment offers, acceptance, arrival, start, completion, cancellation, and administrative changes.
- Permission-controlled reassignment, cancellation, fare adjustment, notes, and printable trip summaries.
- Original quoted fare and pricing version remain visible after adjustments.

### 3.4 Driver application centre

- Applications received from the simulated Zemen Pro source, with draft/submitted/review/corrections/second-review/approved/rejected states.
- Applicant identification, driving licence, profile photo, vehicle registration, insurance, vehicle photos, payment details, TIN number, and inspection evidence.
- Document viewer with document type, validity dates where applicable, status, review notes, and access restrictions.
- Inspection checklist with result, inspector, date, findings, and supporting images.
- Missing-document and duplicate-identity/plate warnings, correction requests, rejection reasons, and resubmission history.
- First review and independent second approval, with a visible approval chain.
- Synthetic sample documents clearly marked as demo material.

### 3.5 Drivers and vehicles

- Approved-driver profiles, one active car per independent owner, current service eligibility, availability, and account status.
- Vehicle plate, make/model, colour, class, seats, photos, registration, insurance, and inspection details.
- Driver trip/delivery history, earnings, prepaid balance, statements, ratings, incidents, and document history.
- Ride and delivery eligibility can be granted separately to the same driver.
- Vehicle replacement retires the previous association and triggers appropriate review; historical trips retain their actual recorded vehicle.
- Suspension, reactivation, restriction reasons, appeals, and upcoming document-expiry queues.

### 3.6 Customers

- Customer profiles, contact details, registration source, account state, trip/order history, payments, refunds, support cases, and internal notes.
- Minimal customer creation during a phone booking, with duplicate-phone detection and a clear office-created source.
- Permission-controlled corrections, temporary restrictions, suspensions, reactivation, and appeals.
- Restricted access to sensitive information and controlled exports.
- Historical transactions remain available when an account is deactivated.

### 3.7 Driver prepaid balances

- Posted balance, reserved commission, available balance, debt, and job-eligibility status.
- Top-up submissions, evidence/reference review, approval, rejection, commission deductions, releases, reversals, and statements.
- Low-balance and blocked-driver queues, with a configurable minimum balance policy.
- No direct editing of balance totals: changes are recorded as transactions with reasons and approval where required.
- A driver cannot approve their own top-up or generate credit by claiming a payment succeeded.

### 3.8 Payments, reconciliation, refunds, and settlements

- Cash and Chapa payment records, separate from trip completion status.
- Completed-but-unpaid, pending, failed, disputed, refunded, and reconciled filters.
- Payment attempts, collection references, driver receivables/payables, processor-fee fields, and linked ledger entries.
- Finance exception queue, manual collection review, refund requests, payout batches, approval, failed payouts, and reconciliation.
- Restaurant settlement previews with sales, commission, refunds, adjustments, and net payable.
- Cash paid directly to a driver is not also paid out to that driver by the platform.

### 3.9 Pricing and service areas

- Admin-managed vehicle classes and base, distance, time, waiting, minimum, and cancellation charges.
- Ride/delivery commissions, package delivery fees, and future restaurant commercial rules.
- Addis service zones, coverage boundaries, service hours, and service enable/disable controls.
- Pricing preview calculator, validation, effective date, change reason, and version history.
- New prices apply to new quotes. Existing bookings keep their saved pricing and commission rules unless an authorized adjustment is explicitly recorded.
- Undecided commercial rates are configurable sample values, never represented as agreed client rates.

### 3.10 Restaurant applications and accounts

- Register or review a restaurant, review documents, request corrections, approve/reject, restrict/suspend, and record the full history.
- Restaurant owner, account contacts, commercial terms, documents, branches, service status, and settlement summary.
- Admin oversight of branch/menu/order data, including moderation or emergency intervention with an audit reason.
- Routine branch management, menus, prices, availability, order processing, and settlement views belong to the restaurant workspace in Zemen Pro.
- Restaurant operators can view statements and raise settlement queries; staff finance permissions control platform payout approval and reconciliation.
- Recommend the same two-person approval mechanism for restaurant onboarding, configurable separately from the mandatory driver rule.

### 3.11 Food orders

- Seeded orders with customer, branch, items, totals, preparation status, courier, delivery status, payment, and complaint links.
- Representative acceptance, preparation, ready-for-pickup, collection, delivery, cancellation, and refund transitions.
- Deliveries use eligible Zemen Pro drivers; no separate restaurant courier application is planned.
- Restaurant performance, late orders, failed deliveries, and settlement previews.
- Restaurant-operated delivery and pickup ordering are outside the initial commitment unless added during review.

### 3.12 Packages and documents

- Sender/receiver, recipient phone, category, pickup/drop-off, courier, delivery fee, attempts, and return information.
- Fee configuration, failed-delivery handling, return initiation, and linked support cases.
- Recipient-phone OTP confirmation and proof-of-delivery record, simulated for the demo.
- Wrong, expired, used, or excessively retried codes do not complete delivery. Resending invalidates the old code and follows a cooldown.
- A delivery exception stays visibly unresolved or follows an approved return process; it does not silently count as successful delivery.

### 3.13 Support and safety

- Unified case inbox for staff-entered phone calls and simulated in-app, chat, and email requests.
- Queues, priority, category, assignment, response deadlines, internal notes, evidence, replies, escalation, resolution, and reopening.
- Refunds, lost items, safety incidents, suspensions, and appeals connected to customer, driver, restaurant, trip, or delivery records.
- Urgent incidents can trigger an immediate permitted safety restriction; the action is logged and reviewed afterward.
- Demo communication previews remain inside the system. No email or phone service is contacted.

### 3.14 Promotions and communications

- Promo codes, referrals, driver incentives, and restaurant offers with dates, audience, limits, budgets, eligibility, and redemption history.
- Promotions identify who funds each discount so reports and settlements remain consistent.
- Announcements by push and SMS, with audience preview, templates, scheduling, and simulated delivery/failure history.
- Recipient preferences and suppression controls for promotional messages.
- Editing a promotion does not rewrite discounts already applied to completed bookings.

### 3.15 Analytics and reports

All requested analytics are included as report families, with equal access and consistent filters rather than forcing every measure onto the first screen:

- Operations: requests, completed/cancelled trips, assignment times, pickup delays, utilization, service zones, and service mix.
- Drivers: approval conversion, availability, acceptance/completion, ratings, earnings, balances, expiry, and restrictions.
- Customers: registrations, active/repeat customers, cohorts, trip frequency, cancellations, complaints, and promotional use.
- Finance: gross booking value, earned commission, recorded collections, unpaid amounts, prepaid deposits, driver payables, payouts, refunds, reversals, fees, and incentive costs.
- Restaurants/food: sales, orders, preparation time, cancellations, delivery performance, branch performance, and settlement balances.
- Packages: volume, delivery time, failed attempts, OTP confirmations, returns, fees, and courier performance.
- Support/safety: open cases, aging, response/resolution times, reopened cases, incident categories, and appeals.
- Growth: promo/referral redemptions, campaign costs, incentive eligibility, and simulated message results.
- Staff: approval turnaround, dispatch activity, workload, and administrative changes.

Charts have named metrics, ETB/time/count units, date ranges, and sample-data labels. Definitions are available beside financial and operational measures. Cohort and retention denominators are explicit and use the available seeded period; unavailable longer-period comparisons are not invented. Reports drill into source records. CSV exports must open cleanly in Excel; printable reports support Save as PDF. Sensitive and bulk exports require their own permission and audit entry. Scheduled report delivery is a visible demo simulation until email/SMS services are connected.

### 3.16 Staff and custom roles

- Owner creates staff accounts, invites simulated users, deactivates access, and assigns custom roles.
- Role editor groups permission toggles by module and action: view, create, edit, assign, approve, suspend, adjust money, export, and manage configuration.
- Separate permissions cover viewing identity/payment documents, first review, second approval, manual credits, refunds, payouts, and role management.
- Optional scope controls limit access to assigned cases, a service, or a zone.
- Suggested starting templates: Owner, Operations Manager, Call Operator/Dispatcher, Application Reviewer, Approval Officer, Support, Finance, Restaurant Operations, Analyst, and Auditor. The admin can create and modify roles instead of being locked to these names.
- Changes affect both navigation and action handling. Direct links and disabled UI controls cannot bypass demo permission checks.
- Preserve at least one active owner. Staff cannot grant privileges beyond their authority. A person with several roles still cannot approve their own first review.
- Toggles grant access to implemented features; adding a new software capability remains development work.

### 3.17 Audit history and suspicious-activity review

- Search/filter by staff member, role, time, action, entity, outcome, source screen/session, and approval state.
- Detail shows before/after values with sensitive fields masked, required reason, related records, and the approval chain.
- Log staff session events, role changes, sensitive-document views/downloads, document review, account actions, assignment, fare changes, financial entries, exports, settings changes, and rejected sensitive actions.
- “Where” records the affected page, record, and available action source. Physical location or verified IP information is not invented.
- Audit records cannot be edited or deleted through ordinary admin screens. Corrections create new linked events.
- Duplicate identity/phone/plate and suspicious refund, cancellation, or promotion patterns create review cases. Flags prompt investigation rather than automatic guilt or permanent bans.
- Browser-local audit history demonstrates the workflow; server enforcement and durable tamper-resistant storage belong to the later backend.

### 3.18 Settings, integrations, and recovery

- Brand/business settings, locale/currency/timezone, service availability, document requirements, expiry thresholds, balance rules, and support categories.
- Integration cards for Gebeta, Chapa, push, SMS, email, customer app, and Zemen Pro with honest simulated/live/unconnected status.
- Error history, retry actions, and simulated integration health incidents.
- Local demo backup export, validated restore, data-version checks, and a confirmation-protected scenario reset.
- Backup/restore creates an audit event; production backup integrity and access control remain backend requirements.
- Demo storage failures or quota errors show a clear message instead of pretending changes were saved.

## 4. Core workflow rules

### Driver application and activation

1. A simulated Zemen Pro application arrives with a versioned document set.
2. Reviewer A checks required information, document validity, duplicate indicators, and a passed vehicle inspection.
3. Incomplete applications receive correction requests. Rejections require reasons.
4. A complete application moves to second review. Reviewer B must have a different staff account from Reviewer A and approve the exact document/inspection version reviewed by Reviewer A. Recheck eligibility and expiry at final approval; changed evidence or newly expired documents return the application to review.
5. Approval activates the driver role in the simulated partner record. Required material changes invalidate the relevant prior reviews and require review again.
6. Dispatch eligibility additionally requires an approved, unrestricted driver, valid vehicle/documents/inspection, enabled service, online/available state, no conflicting assignment, and acceptable balance/debt status.

Approval and immediate job eligibility are separate states. An approved driver with an expired inspection or insufficient balance cannot receive a new trip.

### Office-created booking and dispatch

1. Operator finds a caller by normalized phone number or creates a minimal customer record.
2. Operator enters pickup/drop-off by place search or map selection, vehicle class, payment choice, and notes; the customer location is explicitly confirmed.
3. System calculates and stores the quote with its pricing/commission version.
4. Operator sees eligible drivers, reasons for ineligible drivers, and simulated distance/arrival estimates.
5. Assignment creates a recorded offer/acceptance transition. Two bookings cannot simultaneously reserve the same driver.
6. Assigned → accepted/en route to pickup → arrived → in progress → completed. Cancellation remains a distinct path with recorded initiator, reason, and fee decision.
7. Standard reassignment happens before pickup. After trip start, a supervisor uses an incident/continuation workflow so the active passenger record is not silently transferred.
8. Completion updates the trip; payment and settlement follow their own rules below. Calls, notifications, driver acceptance, and movement are simulated.

### Pricing and fare adjustments

An admin can edit and publish pricing/commission rules, with validation, a reason, an effective time, and history. Operators require a separate fare-adjustment permission. Adjustments retain the original quote and reason; material post-completion changes route to a finance correction/refund workflow rather than rewriting a settled receipt.

### Driver credit eligibility

Use a posted prepaid balance plus commission reservations, with available balance calculated from those entries. For a cash job, reserve the estimated commission when an assignment offer is created. Release it if the offer is declined, expires, or is withdrawn. Reassignment releases the previous driver's reservation and reserves the replacement driver's credit as one consistent action. Cancellation applies the saved cancellation-fee/commission policy and releases the unused reservation; a completed commissionable service posts its final deduction exactly once.

An overdue debt or failure of the configured minimum balance rule blocks new jobs. Cash jobs also require enough available credit for their commission reservation. Chapa jobs still follow account/debt eligibility rules, but their commission is withheld from the gateway receipt instead of being deducted a second time from the prepaid wallet.

If a later fare adjustment creates a shortfall, complete the current passenger journey, record the shortfall for finance, and block subsequent jobs as required. Do not strand an active trip because the driver's balance changes.

## 5. Payment and money-handling recommendation

### Separate the three events

**Trip complete** means the service finished. **Payment confirmed** means its collection has been recorded or verified. **Payout settled** means funds owed by the platform have been paid out and reconciled. These appear as separate statuses in the website.

The two customer payment choices remain Cash and Chapa. A direct transfer to a driver's own Telebirr account can be recorded as an external collection channel under the pay-driver/cash workflow, with a reported reference and confirmation status. It is not presented as a verified Chapa transaction or an additional integrated payment option.

### Cash / customer pays the driver

- Driver records collection or reports non-payment at completion; staff can review disputes.
- The saved commission is charged once from the prepaid balance for a completed commissionable ride. A disputed collection remains visible; finance can approve a linked reversal where policy requires it.
- The driver's retained earnings are the recorded customer collection less the applicable commission and adjustments. The platform does not also generate a payout for cash already received by the driver.
- Top-ups are credit deposits, not ride revenue. Manual top-ups become usable only after authorized finance confirmation; adjustments require reasons and independent approval where configured.

### Chapa

- Recommended customer flow: completion finalizes the fare and starts an explicit payment request/checkout. A driver completing a ride does not by itself trigger an assumed successful charge.
- Demo controls simulate pending, success, failure, cancellation, duplicate notification, and refund cases. This first build uses no Chapa account, secret key, checkout, or real transfer.
- In later live integration, the backend verifies provider events and matches the transaction reference, amount, currency, and environment to the expected booking before posting settlement. Provider notifications must be authenticated and repeat processing must not double-credit funds. These requirements follow [Chapa payment verification](https://developer.chapa.co/integrations/verify-payments) and [Chapa webhook guidance](https://developer.chapa.co/integrations/webhooks).
- A successful payment records platform collection, withholds the saved commission, and credits the driver's net payable. The same commission is not deducted again from prepaid credit.
- Processor charges are recorded separately using actual/configured values; no fee rate or universal payment-method support is assumed.
- Verified routine collections can post automatically. Finance handles exceptions, cash disputes, adjustments, refunds, reconciliation, and approval of payout batches. Automatic money transfers can be considered after live controls and reconciliation are proven.
- Refund approval and refund success are separate states. Failed or pending refunds and payouts remain in the finance queue.

### Refund and payout controls

- Pending payout batches reserve the available driver/restaurant payable amount so overlapping batches cannot pay the same earnings twice. Only confirmed success settles the payout; failure releases its reservation for review or retry.
- Refunds cannot exceed the original collected amount less prior refunds. Partial refunds apply the corresponding fare/commission allocation. If the partner was already paid, record an explicit recovery or adjustment instead of silently changing the settled payout.
- For cash or an external pay-driver collection, record who must issue the refund: driver or platform. Approval leaves the refund pending until its simulated execution is confirmed. The linked commission reversal is a separate financial decision; a refund does not automatically create unrelated driver prepaid credit.
- Manual credits/adjustments, refunds, and payout batches default to independent review by a staff account other than the initiating account. Policy settings can define additional amount-based review requirements. All decisions and execution outcomes remain linked.

### Illustrative accounting example

For a sample 200 ETB ride with a sample 10% commission and no other fees: the company commission is 20 ETB. A cash ride deducts 20 ETB from prepaid driver credit; the driver has already received the customer's 200 ETB. A successful Chapa ride creates 180 ETB driver payable and 20 ETB company commission, with no second prepaid deduction. These are demonstration values, not agreed pricing.

Use an append-only demo ledger with linked reversals for corrections. Store monetary values in integer minor units and display ETB consistently. Gross booking value, paid collections, commission earned, prepaid deposits, refunds, driver payables, and outstanding debt each have their own report definition. Repeated completion, approvals, callbacks, and payout clicks cannot duplicate money movements.

## 6. Demonstration data and behavior

Use one deterministic, related dataset anchored to the demonstration date. Proposed scale: roughly 60 drivers/applicants, 800 customers, 1,200 trips across 30 days, 12 restaurant accounts with sample branches, 200 food orders, 100 package jobs, 12 staff accounts, and 35 support cases. These figures are adjustable presentation fixtures and do not describe real usage.

Include approved/pending/rejected applications; expired inspection; low balance; an unassigned trip; cash collected/unpaid/disputed; Chapa pending/failed/success; a requested refund; an OTP delivery failure; restaurant onboarding; and an urgent incident.

Lists, detail pages, maps, ledger entries, reports, and audit events share the same identifiers and records. Charts aggregate those records rather than using unrelated decorative numbers. Changes survive reload on the laptop, and a reset restores the known rehearsal scenario. Exports and uploaded sample evidence remain local.

Staff persona switching is a labelled demo control. It demonstrates account and role boundaries using distinct seeded staff accounts; it is not production authentication. Only synthetic personal details and demo evidence are used.

## 7. Visual and interaction design

- ZemenGo brand blue and logo, white/light neutral surfaces, clear text contrast, and restrained status colours matching the customer app.
- Desktop-first layout tuned for a normal laptop screen, with a collapsible sidebar and a useful narrower/tablet layout.
- Persistent top bar for global search, notifications, staff identity, and demo status.
- Dense but readable lists: sticky headers, pagination, sorting, column selection, saved filters, and carefully scoped bulk actions.
- Initial bulk actions cover support-case assignment, announcement audience selection, and permitted exports. Each selected record is checked and receives a clear result/audit entry. Bulk approval or financial shortcuts cannot bypass independent review or silently skip failures.
- Dedicated detail pages for complex records and side panels for quick inspection; breadcrumbs and cross-links preserve context.
- Clear required fields, input validation, date/ETB formatting, loading/error/empty states, and success feedback after actions.
- Confirmation and a reason for destructive or sensitive actions; avoid repetitive confirmations for ordinary navigation and reversible edits.
- Use driver/vehicle/restaurant imagery where it helps identify a record. Charts, documents, maps, and information hierarchy carry the visual weight of the admin experience.
- Keyboard-accessible controls, visible focus, labelled forms, readable status text beyond colour, and usable zoom.
- Feature pages have meaningful content and working demo actions. Future external integrations explain their readiness without pretending to be connected.

## 8. Proposed technical structure

### First implementation: local demo

- React and TypeScript with Vite for the laptop web application. Vite provides a development server and static build workflow; installed runtime compatibility and dependency versions will be checked at implementation start. [Vite guide](https://vite.dev/guide/).
- A reusable component/theme system for navigation, forms, data lists, charts, document viewers, dialogs, and status displays.
- IndexedDB-backed local storage for related records and sample attachments, accessed through typed repositories. Presentation components do not contain business rules or direct storage operations.
- Domain services handle permissions, application approvals, dispatch eligibility, trip transitions, fares, wallet reservations, ledger posting, notifications, and audit entries.
- A mock event source simulates Zemen Pro submissions, acceptance, location changes, payment results, and message/OTP delivery.
- Gateway, map, notification, and storage adapters keep later integrations separate from the interface.
- Local backup files include a schema version and relationship validation. Import is previewed and confirmed before replacing demo records.
- Critical local mutations are applied consistently so a trip, its ledger effects, and its audit record cannot drift after a partial action. Multiple tabs must detect updated state instead of silently overwriting one another.

Gebeta publishes browser mapping options using MapLibre. Early implementation will check the existing access, browser authentication/origin requirements, limits, and local loading before choosing its web SDK or supported style integration. Preserve provider attribution. A configured server-only credential must never be placed in a browser bundle. [Gebeta maps product documentation](https://gebetamaps.com/products/maps).

The demo's application checks model the intended rules. Production requires backend authorization, authenticated identities, transactional money handling, secure document storage, and durable audit protection; local browser controls alone do not supply those guarantees.

### Future shared platform

Plan API/data boundaries for staff/roles; customers; partner accounts; applications/documents/inspections; vehicles; service eligibility; trips/assignments; price versions; payment attempts; wallet/ledger entries; payouts/refunds; restaurants/branches/menus/orders; delivery attempts/OTP proof; support cases; promotions; notifications; and audit events.

The existing proposal's NestJS/TypeScript and PostgreSQL direction remains suitable for later evaluation. CustomerApp, the driver and restaurant workspaces in Zemen Pro, and AdminWebsite will connect to the same backend. Exact live provider versions, secrets, merchant setup, production hosting, and cross-app synchronization are later integration tasks, not requirements to purchase services now.

## 9. Build order and presentation checkpoints

### Checkpoint 1 — foundation and first visual review

Create the local project, theme, navigation, seeded records, demo staff switching, permission catalogue, persistent storage, basic audit flow, and main overview. Validate the laptop runtime and Gebeta browser access early. Produce a runnable local shell and show the visual direction before expanding every page.

### Checkpoint 2 — drivers and ride operations

Implement application/document/inspection review, independent approval, driver/vehicle profiles, customer lookup, caller booking, eligibility, assignment/reassignment, map simulation, trip progression, cancellation, and quote snapshots. Exit with a repeatable approval-to-completed-ride story.

### Checkpoint 3 — credit, payments, and finance

Implement prepaid top-ups/reservations, insufficient-balance blocking, cash and Chapa simulation, linked ledger entries, financial exceptions, refunds, payout approvals, and reconciled operational/revenue reporting. Exit with no duplicated commission and matching booking/ledger/report figures.

### Checkpoint 4 — wider administration

Complete restaurant onboarding/oversight, food-order and package previews, recipient OTP simulation, support/safety/appeals, promotions, communications, all analytics report families, saved views, and exports. These broaden the demo while keeping rides the first integrated service.

### Checkpoint 5 — permissions, recovery, and rehearsal

Verify restricted accounts and sensitive actions, audit details, data persistence, backup/restore, error/retry scenarios, document/photo layouts, and consistent analytics. Build the static bundle, write launch/reset instructions, prepare a concise walkthrough, and capture backup screenshots/video.

All five checkpoints are the intended admin demo scope. The same-presentation deadline is tight for this breadth. Checkpoint 1 should be followed by an honest remaining-work estimate. If the remaining time cannot cover the complete scope, present the unfinished items and agree the demonstration boundary before changing it; do not silently replace workflows with decorative buttons or describe an incomplete milestone as finished.

## 10. Acceptance criteria

1. The website starts locally with documented commands, English UI, Addis time, ETB, and matching ZemenGo branding.
2. The owner creates a custom role, changes permission toggles, and sees the changes in audit history. A restricted account cannot bypass an action restriction through a direct page or command path in the app.
3. Missing mandatory driver documents, failed inspection, or invalid required expiry prevents approval/activation.
4. Reviewer A cannot perform the second approval, even with another role; Reviewer B can approve the same reviewed evidence version after eligibility is rechecked. Replaced/expired evidence returns the application to review, and both decisions remain visible.
5. Approval unlocks the appropriate simulated Zemen Pro role and does not grant staff-dashboard access.
6. The same independent owner cannot have two active cars. Vehicle replacement retains historical trip associations and review history.
7. Insufficient credit, overdue debt, expired documents, suspension, service mismatch, or an existing job prevents new assignment with a clear explanation.
8. An approved top-up restores eligibility only when all other checks pass. Concurrent assignments cannot spend the same credit reservation or assign the same driver twice.
9. An operator creates a phone booking with confirmed locations, sees a quote, assigns an eligible driver, and completes the simulated journey.
10. Reassignment/cancellation/fare changes require the correct permission and a reason. Previous assignments and quoted fares remain visible.
11. New pricing applies prospectively. Existing bookings and receipts retain their saved rules unless an explicit adjustment is approved.
12. Cash completion posts the correct commission once. A successful Chapa simulation creates the correct net payable without a duplicate wallet charge. Prepaid top-ups do not inflate revenue.
13. A completed trip with a pending/failed/disputed payment remains visible in finance. Driver completion cannot automatically turn that payment into verified success.
14. Duplicate completion/payment/approval events do not duplicate ledger entries, payouts, receipts, or report totals.
15. A refund or payout can remain pending or fail after approval; the exception is actionable and auditable. Refunds are capped by remaining collected funds, and overlapping payout batches cannot spend the same payable balance. Cash refunds identify the party issuing the money and require separate execution confirmation.
16. Restaurant approval links to its future Zemen Pro workspace, with administrative oversight and separately controlled finance access.
17. Wrong, expired, used, or locked OTPs cannot complete package delivery. A correct simulated recipient OTP produces a proof record; failed delivery and return have separate histories.
18. Support cases from all planned channels can be assigned, linked, escalated, resolved, reopened, and audited. Safety restrictions and appeals remain traceable.
19. Every analytics family has useful sample content, shared filters, and drill-down. Exports match the displayed records and are permission controlled.
20. Promo/incentive changes, simulated message deliveries, financial adjustments, role edits, and exports appear in the appropriate histories.
21. Reload preserves demo state. Backup/restore preserves record relationships; reset restores a repeatable presentation scenario.
22. The map labels simulated driver movement clearly, handles unavailable connectivity, and resumes through retry. No real payment, message, or driver dispatch is triggered by demo controls.
23. Critical pages work on the presentation laptop without clipped primary actions, unreadable documents, inaccessible dialogs, or uncaught errors.

## 11. Suggested client walkthrough

1. Show the owner overview and the full platform navigation.
2. Create a call-operator role using permission toggles; switch to that staff account to show its actual restrictions.
3. Review a driver application and inspection; use a second staff account for final approval.
4. Show a low-balance driver blocked from a job, then approve a sample top-up and explain restored eligibility.
5. Create a phone booking, assign a driver, follow simulated progress on the map, and finish the trip.
6. Open the linked cash commission entry and revenue report. Show a Chapa payment pending after completion, then simulate verified success and inspect its net payable.
7. Visit a restaurant application, package OTP example, and linked support case.
8. Finish in the owner audit log and reports to show who acted, what changed, and how the figures connect.

Use sample-data labels throughout. Explain that the website demonstrates the intended operating workflows; live partner apps, backend identities, payment processing, SMS, and shared data will be connected in the next integration stage.

## 12. Decisions proposed for your review

- Zemen Pro contains separate driver and restaurant workspaces; RestaurantWebsite has been removed.
- Mandatory driver approval requires two different staff accounts. Restaurant approval and sensitive finance actions reuse independent approval where configured.
- Cash includes a clearly identified external-pay-driver collection channel; Chapa remains the only integrated digital-payment choice planned here.
- Cash commissions use prepaid driver credit. Chapa commissions are withheld from the verified receipt, avoiding a second charge to the driver.
- Successful verified collections post automatically; finance owns exceptions, reconciliation, refunds, and payout approval. Automatic payouts are deferred until live integration is proven.
- New pricing affects new quotes; settled records are corrected through linked adjustments/reversals.
- The complete demo has all 18 administration areas above, with rides receiving the first end-to-end implementation and other services using coherent local simulations.

This document records the approved scope. The local administration demo was subsequently implemented; consult README.md and docs/DEMO_HANDOFF.md for the current build, verified flows and integration boundaries. The shared backend, Zemen Pro workspaces and live payment/notification integrations remain future work.
