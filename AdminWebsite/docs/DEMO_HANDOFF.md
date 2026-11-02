# ZemenGo admin presentation handoff

Validated on 29 October 2026. This guide describes the local administration demo and its boundaries.

## Open it

Double-click `C:\SMS\RideApp\AdminWebsite\Start-Admin.cmd`, then visit **http://127.0.0.1:5173/**. Keep the server terminal open. If a server is already running, use its existing tab. Stop it with Ctrl+C before starting a replacement server.

The customer application remains in CustomerApp. DriverApp is reserved for Zemen Pro, including its future restaurant workspace. RestaurantWebsite has been removed.

Use the same browser profile and address throughout the presentation. IndexedDB stores the scenario locally. Other browsers, ports and hostnames have separate data. No new purchase or live payment/SMS setup is needed. Internet is required for the actual Gebeta basemap; local records and workflows still work without it.

## Staff identities

The top-right **Demo staff account** selector switches local identities. It is deliberately a presentation control, not authentication.

- **Mekdes Solomon — Owner**: all administration modules and custom-role creation.
- **Eyob Daniel — Application Reviewer**: documents and first review.
- **Sara Tesfaye — Approval Officer**: independent final approval.
- **Liya Bekele — Call Operator**: office bookings and dispatch.
- **Henok Girma / Ruth Alemu — Finance Officers**: separate request and approval identities.
- **Soliana Hailu — Customer Support**: cases and customer support views.
- **Amanuel Fikru — Business Analyst**: reports and exports.

Create additional named roles under **Staff & permissions → Roles & permissions → New role**, using module/action toggles. Assign a role to a staff record to demonstrate its navigation and action restrictions. A role manager cannot grant access beyond their own authority; the final active owner is protected.

## Suggested walkthrough

1. **Owner overview:** show bookings, completion, commission, service breakdown and attention queues. Select 7 or 30 days, then open a record through global search. All figures represent synthetic records.
2. **Application approval:** find an application under Driver applications. `DRV-001` starts awaiting second review by someone other than Eyob. `DRV-002` starts with complete evidence for a first review; `DRV-003` illustrates missing insurance and inspection. Finish first review, switch to Sara and give final approval. Check both identities in the approval and audit trails. Approval represents Zemen Pro access eligibility; it does not create staff-dashboard access.
3. **Prepaid credit:** on a fresh scenario, Rahel Getachew (`DRV-006`) has ETB 5 and cannot accept another ride. `FIN-1001` is a pending ETB 500 top-up. Approve it using a different identity from the requester and inspect the resulting ETB 505 credit. Independent approval does not bypass other driver checks.
4. **Office booking:** switch to Liya, open Live operations and Create booking. Choose an existing customer or enter a caller. Select two different Addis landmarks, service class, distance and minutes, and Cash or Chapa. Review the saved quote. Open the new trip, assign an eligible matching driver and advance the simulated partner events: accepted, arrived, in progress, completed. Reassignment is available before the trip starts. Cancellation and fare adjustments require the relevant permission and a reason; the default operator role can be extended by the owner if required.
5. **Trip accounting:** inspect the completed cash trip. Commission is deducted once from prepaid credit, and the reservation is released. Customer payment collection remains a separate status. An external transfer to the driver is recorded as a driver-reported collection, without claiming gateway verification. For a completed Chapa trip, simulate the provider outcome and inspect the collection, earned commission and net driver payable. It does not deduct prepaid credit a second time.
6. **Finance:** open exceptions, ledger and approvals/payouts. A refund/payout request must receive another person's approval. Execution is separate and can succeed or fail. Requests reserve the relevant funds, and refunds are capped. All actions are local simulations.
7. **Vehicle replacement:** on an approved driver without an active job, use Replace vehicle. Previous trips retain their old vehicle details. The new vehicle needs registration, insurance, photos and a passed inspection, followed by two reviews. The previous vehicle remains in history.
8. **Wider platform:** visit a restaurant application and the sample branch/menu overview. Show food order progression. Under Packages & documents, open a Collected parcel and verify the demo recipient code shown in its SMS preview. Use Resend demo code if it has expired. A wrong code is rejected; a correct code produces a proof record. Failed deliveries and returns use separate transitions.
9. **Support and growth:** enter a phone/in-app/chat/email case, link its customer/driver/trip, assign a member of staff and change its status. Show safety, lost-item, refund and appeal categories. Preview a promotion or simulated announcement; no messages are sent.
10. **Owner oversight:** inspect Audit & reviews for actor, role, timestamp, source, reason, outcome and changed values. Visit each analytics family and its date filters, report rows and exports. Finish by showing Settings integration readiness and Export backup.

Some examples have already been exercised in the current browser. `DRV-002` was approved, `FIN-1001` was settled, package `PKG-1003` was delivered, and the completed office cash trip `ZG-71138B70` was added. A Presentation Viewer role was also created. To rehearse from the initial examples, export a backup and use **Settings → Reset demo data**, entering RESET. To recover a saved rehearsal, use Restore backup and enter RESTORE. Avoid resetting in the middle of the client walkthrough.

## Verified behavior

- All 25 domain tests pass. They cover linked seed totals, permission guards, two-person application approval, document expiry and review invalidation, top-ups, dispatch conflicts and credit reservations, prospective pricing, cash/Chapa accounting, duplicate events, refund/payout constraints, OTP proof/cooldown, protected owner access, audit values, backup checks, and vehicle replacement/history.
- TypeScript checking and the production build pass. Vite reports a bundle-size advisory for the map library; it does not fail the build.
- Browser checks rendered all 18 administration areas. Independent driver approval and a full operator cash journey were exercised. Custom-role creation, column selection/save, top-up approval and updated credit, wrong/correct package OTP, backup export/restore and reload persistence were verified.
- The actual Gebeta basemap loaded. Vehicle positions and route progress are simulated and labelled. Provider attribution is retained; the large provider label is absent from the map overlay.
- Desktop, 760px and 390px layouts were inspected. No horizontal page overflow was found on the inspected overview and dispatch views; narrow-screen navigation opened and dispatch remained usable. Temporary viewport overrides were reset.

Browser verification is a representative rehearsal, not an exhaustive test of every form combination. Domain tests verify the critical state and money rules independently of presentation controls.

## What the client is seeing

This version demonstrates the intended operation using local synthetic data. It includes working administrative forms, transitions, role checks, reporting and recovery. Sensitive records and audit entries are stored in the local browser; they are not protected by a production backend.

The live basemap is the external map service. Locations offered to the office operator are curated landmarks, with entered distance/duration; routes are illustrative. Driver tracking and partner events are simulated. Cash/Chapa results, bank deposits, refunds, payouts, recipient OTP, SMS/push and channel status are simulations. Scheduled announcements are recorded previews without a running notification scheduler.

Restaurant documents, branch/menu records and food/package activity provide administrative previews. Restaurant self-management, real driver registration submissions and service delivery belong in Zemen Pro and the shared backend. Analytics for those services use their separate sample records rather than claiming ride-ledger revenue.

The customer app and administration site have separate local datasets. A ride booked on the Android customer demo will not automatically appear here. Demonstrate the website's office-booking flow until the shared API is connected.

## Next implementation stage

Implement shared backend records, authenticated staff identities and server-side permission enforcement first. Then connect CustomerApp, the Zemen Pro driver workspace and restaurant workspace to application review and trip events. Add secure document storage, actual GPS/directions, provider-verified Chapa webhooks, notification delivery and transactional reconciliation before live operations. Purchases and production provider activation can wait until the integration scope is agreed.
