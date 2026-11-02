# ZemenGo: code review and two-day client demo plan

Reviewed: 27 October 2026. Target presentation: 29 October 2026, assuming "in two days" means two calendar days. Budget: approximately 20 focused development hours across 27-28 October, with remaining calendar time reserved for build problems and rehearsal.

## Confirmed presentation decisions

- ZemenGo is the customer app. Zemen Pro is a separate driver mobile app; do not embed a driver role or driver preview into ZemenGo.
- Demonstrate the complete customer ride journey, with food and document/package previews.
- Use real Gebeta maps and routing on Android with the existing map access. Ride matching, driver movement, OTP, and cash transactions remain demo behavior. Internet is required for live maps; disclose unavailable connectivity instead of presenting a drawn preview as a live map.
- Use the supplied Z logo intact for the in-app branding and Android launcher, and match the supplied blue splash reference, including "All Your Needs One Tap" and "Powered by SMS Technologies". Display the installed app version, not the reference's v2.4.0.
- The Android phone model is not known yet. Verify compact and standard phone layouts and provide a build/run guide for the eventual device.
- No purchases, new paid accounts, production payment integration, or store publication are authorized or needed for the presentation.

These confirmed decisions supersede the earlier fully offline and optional embedded-driver recommendations below.

## Implementation progress after confirmation

**Latest package, 28 October:** [build 4](../build/presentation/ZemenGo-demo-1.0.0-build4.apk) includes eleven bundled generated images, realistic vehicle photographs and an overhead photo marker, plus removal of the extra top map badge. All 34 automated checks pass, and analysis has no errors or warnings. The signed 80.8 MiB release was installed and visually checked on Android API 36 with live routing, connection retry, a completed 172 ETB Standard ride and the matching receipt. The saved assets/prompts are in [the imagery notes](generated-imagery.md). The earlier progress below records the initial 27 October baseline.

Implemented on 27 October:

- Original supplied logo asset, branded Android legacy/adaptive icons and Android launch resources, plus the reference-based blue Flutter splash showing the installed version.
- Customer navigation, phone/demo-OTP validation, saved editable profile and session, logout and demo reset.
- Real Gebeta map access, route geometry/endpoint annotations, simulated driver annotation, and connection/error/retry states. Gebeta style and directions requests returned HTTP 200 in workstation checks; live search can time out, so curated locations remain available.
- A canonical saved trip model, guarded matching/start/completion/cancellation transitions, consistent cash quote/receipt, saved ratings/history, filters and resumable active trips.
- Clearly labeled food menus and package-booking previews, with no live order, courier dispatch or payment collection.
- Fifteen automated tests passing, including persistence, duplicate prevention, cancellation, receipt consistency, OTP errors, compact layouts and phase previews.
- Successful debug and release APK builds. The release artifact is `build/app/outputs/flutter-apk/app-release.apk` (78.7 MiB, universal ARM64/ARMv7/x86-64, Android 7.0+). Native sign-in, saved profile, real Gebeta tiles/route/endpoints, simulated driver progress, completion and the unchanged cash quote have been visually verified on the existing Android API 36 emulator.

The release APK was installed successfully and preserved the saved customer session and completed ride after replacing the debug build. Its home screen and saved receipt were visually checked with the same 172 ETB fare. Final contrast polish found during native checks is included in the deliverable build.

Remaining presentation preparation: repeat the flow on the actual presentation phone when its model is known; rehearse on that phone's internet connection; capture a backup recording. These checks are not replaced by a successful APK build or workstation API response.

Final package verification: the rebuilt APK passed signature verification, and all 15 tests passed on the final source. The last emulator update for UI-only contrast fixes stalled, so the exact handoff artifact still requires installation on the actual phone. The emulator walkthrough described above used the preceding release with the same ride/map/persistence behavior; do not describe the physical phone check as completed.

## Recommendation

Keep the existing Flutter app and turn its ride screens into one dependable, interactive demonstration. The strongest evidence of progress will be a booking that carries the customer's actual choices through driver assignment, trip progress, completion, receipt, rating, and saved history.

Present this as a **Phase 1 progress demo**. The proposal's full Phase 1 milestone is a ride-hailing MVP ready for testing, including a backend, database, driver foundation, real tracking, and payment integration. Those capabilities are not currently implemented in this repository, and a local simulation must not be presented as their completion.

The demo will require no purchases or new external accounts. Android uses the existing Gebeta access and needs internet for live map tiles, search, and routes. Other demo state is local. The Android APK is the presentation target; a desktop/browser preview is useful for layout checks but does not substitute for testing the native map. Native iOS packaging and distribution are outside this Windows-based sprint.

## What the attached proposal expects

Source: the seven-page proposal, `Transport Food And Document Delivery APPLICATIN.pdf`, supplied from the user's Downloads folder. Its business terms are reference material; they do not authorize purchases or change the user's current instructions.

- Pages 2-3: one platform for rides, food, and documents/packages; customer app, driver/delivery app, restaurant dashboard, admin dashboard, and shared backend/payment services.
- Page 3: proposed Flutter/Dart mobile apps; NestJS/TypeScript backend; PostgreSQL/Supabase; Docker/VPS; WebSockets/Redis; Google Maps; Afro Message SMS; Chapa payments; Firebase notifications.
- Page 4, Phase 1: UI/UX, architecture, authentication, customer and driver foundations, database, backend, maps, ride booking, matching, live tracking, and payment integration.
- Pages 4-5: food ordering is Phase 2, package delivery is Phase 3, broader administration/integration is Phase 4, and launch/testing is Phase 5 across months 5-6.
- Page 6: third-party operating costs are anticipated later. No quoted price or service allowance is needed for this sprint, and the document's prices have not been revalidated.

Use the proposal's original phase boundaries when explaining progress. The existing Gebeta implementation differs from the proposed Google Maps stack, and the visible Telebirr UI differs from the proposed Chapa gateway. Treat both as implementation decisions to resolve after the demo, rather than silently changing the agreed scope.

## Repository baseline before this implementation

This is a Flutter customer-app prototype branded ZemenGo, using Addis Ababa locations and ETB fares. There are 22 customer screen files plus a developer screen gallery. Screen count describes existing UI, not completed features. No applicable AGENTS.md instructions were found in the workspace or its inspected ancestors. The working tree was clean before this review.

### Useful work already in place

- A consistent color, typography, and Material theme system in `lib/core/theme/`.
- Splash, onboarding, phone sign-in/sign-up, OTP, profile setup, and location-permission screens.
- A home shell with Home, Trips, Wallet, and Profile tabs.
- Connected ride screens for destination search, ride selection, searching, assigned driver, active trip, completion, rating, and receipt.
- Four vehicle choices with a simple distance-based fare estimate in `ride_booking_screen.dart`.
- Gebeta HTTP methods for place search, reverse geocoding, and directions, with request timeouts.
- A custom-painted map used on web/desktop, and a native Gebeta map branch on Android/iOS.
- Food restaurant listings and a package booking/dispatch preview.

### Gaps identified in the original prototype

1. **Authentication is simulated.** Phone submission is delayed navigation; OTP starts prefilled with 8429 and verification does not validate it; Google sign-in is simulated. Profile setup does not save the entered profile. The location-permission screen navigates without requesting permission.
2. **Ride matching and progress are simulated.** Matching waits three seconds and selects a fixed driver. There is no request queue, driver acceptance, GPS stream, or shared backend state. Customer screens advance trip status through local actions.
3. **Booking details are not carried through consistently.** Payment selection reaches the searching screen but is dropped when navigating to the assigned driver. Later screens can still say Telebirr when cash was selected.
4. **Receipts do not reflect the booking.** The receipt hardcodes an old date, trip ID, line items, a promotional discount, a 148 ETB total, and a successful Telebirr transaction. History entries pass only addresses to the receipt, so the displayed vehicle/fare can also be wrong.
5. **History and profile are sample data.** Completed rides are not added to the fixed history list, and its filter selection does not filter the displayed entries. Profile editing and several settings actions have empty callbacks; the language toggle does not translate the app.
6. **Maps are only partly connected.** The returned route geometry is not drawn by the shared map widget. Selected endpoint coordinates are not passed into that widget. The pin picker confirms fixed coordinates. Android/iOS use the network map branch without the route/driver overlays available in the painted preview. Runtime location permissions still need work for real GPS use.
7. **The demo currently depends on external resources.** Search, directions, native map styles/tiles, and runtime font loading can depend on connectivity. A map credential is embedded in the source; the demo should bypass those requests and later integration should use configurable credentials.
8. **Food/package screens are previews.** Food has listings, favorites, and category selection, but no restaurant menu, cart, checkout, or order lifecycle. Package dispatch changes local flags after a delay; it is not a real delivery request.
9. **Other platform modules are absent.** No backend project, database migrations/schema, driver application, restaurant dashboard, admin dashboard, Chapa integration, Afro Message integration, or push-notification implementation was found in this repo.
10. **Packaging remains generic.** Android and web still contain `ride_app` labels/metadata and default launcher branding. Android release signing currently uses the debug key, appropriate only for development/demo packaging.

### Verification baseline

- `flutter analyze`: completed on 27 October with 95 informational notices, principally deprecated `withOpacity` calls plus fields that could be final. No analyzer errors or warnings were reported; the command still returned a nonzero exit status because lint notices remain.
- `flutter test --no-pub`: produced no test output or completion after several minutes and was interrupted. This is an unverified baseline, not a passing test run; diagnose and repeat it at the start of implementation.
- Only one smoke test currently exists. It pumps the app past the splash screen; it does not verify a booking, OTP validation, payment details, saved history, or receipt consistency.
- A debug APK exists under `build/app/outputs/flutter-apk/`, dated 13 October 2026. Its presence does not verify the current source. No fresh APK build, installation, or interactive device/browser walkthrough has been performed in this planning review.

## Scope for the two-day demo

### Must deliver

- **Explicit demo mode:** a visible, unobtrusive demo indication and one repeatable starting scenario. Simulated authentication, driver location, and cash activity are distinguished from the real Gebeta map.
- **Usable onboarding:** validate a phone number and an explicitly supplied demo OTP; show a useful error for an incorrect code; save a profile and session locally; allow logout and a clean demo reset. Hide simulated Google sign-in until it has an honest preview behavior.
- **A complete ride journey:** search a small local Addis Ababa place catalog, select pickup/destination, choose a vehicle and cash, request, see a simulated assignment and trip progress, complete, rate, and revisit the resulting trip.
- **Consistent booking data:** one trip ID and record containing coordinates, addresses, vehicle, fare breakdown, payment method/status, driver, timestamps, ride status, and rating. Every screen reads that record.
- **Persistent demo history:** completed and cancelled requests survive app restart, filters work, and opening a receipt uses the selected trip. Profile changes appear consistently across the app.
- **Safe navigation and cancellation:** back/cancel behaves predictably, pending matching timers stop when a request is cancelled, and double taps cannot create duplicate bookings or duplicate history records.
- **No-cost presentation with live maps:** render the real Gebeta Android map, draw the selected route and pickup/drop-off markers, and animate a simulated driver along that route. Use local/bundled or system fonts where practical. Make no SMS, payment, or authentication calls. Allow Gebeta map/search/directions calls using existing access; display a connection error and retry when unavailable.
- **Credible completion and receipt:** matching booking and receipt totals; current timestamps; cash due/recorded as appropriate; no invented gateway transaction IDs, unearned promotions, or claim that real money moved. Default tip to zero.
- **Presentation polish:** correct visible app name, purposeful loading/error states, no empty primary actions, no misleading live/verified/payment badges, and readable layouts on the actual presentation device. Keep developer navigation out of the primary customer flow.

### Add only if the core demo is stable

1. Zemen Pro is excluded from this customer-app sprint. Keep only a clear informational note that drivers use the separate Zemen Pro mobile app.
2. Brief existing food and document/package previews, labeled as upcoming phases. Improve labels and remove misleading actions; do not build full ordering/delivery workflows now.
3. A first backend API/schema skeleton running locally, only after the presentation build is stable. No promise of a connected backend from an empty project inside the critical sprint.

Cut optional work before cutting testing, APK delivery, or rehearsal.

## Implementation approach

Reuse the existing screens and visual design. Introduce a small shared application store using Flutter's built-in notification mechanism, typed trip/payment/status models, and repository interfaces. Keep local persistence behind a storage adapter. A demo repository supplies deterministic fixtures and transitions; later production repositories can call NestJS without rebuilding the UI.

Use explicit transitions such as `draft -> searching -> assigned -> arriving -> inProgress -> completed`, with cancellation from permitted states. Calculate the fare once from a documented demo pricing rule and save its line items with the booking; receipts display saved values. Completion and rating updates must be idempotent.

Keep demo flags and fixtures in one configuration area. Seed data/reset should never be confused with real account operations. Avoid a broad refactor, a new state-management framework, or dependency upgrades unrelated to the demo.

Likely edit areas: `lib/main.dart`, `lib/core/models/ride_models.dart`, new store/repository/storage files in `lib/core/`, onboarding/profile/history screens, the existing ride flow, map widgets, Android/web metadata, and focused tests.

## Day 1: 27 October - make the customer journey real within the demo

1. **Hour 0-1: establish the build and presentation target.** Finish the baseline tests, confirm the available Android toolchain, try an early APK build, select the actual presentation device and web viewport, and fix only blockers. Keep the known working screens as the visual baseline.
2. **Hour 1-3: shared state and branding.** Add the supplied logo/splash, demo configuration, trip/status/payment models, the shared store, a local place catalog, a consistent fare calculator, persistence, and reset. Retain Gebeta map/search/route access; disable real SMS/payment/authentication.
3. **Hour 3-5: onboarding and profile.** Validate phone/OTP/profile inputs, save the session, connect the home/profile display, and implement logout. Confirm reopening the app restores the demo session.
4. **Hour 5-8: connect the ride flow.** Carry one booking through vehicle selection, matching, assignment, progress, completion, cancellation, and back navigation. Make the map labels and simulated markers agree with the selected route. Preserve the selected payment method.
5. **Hour 8-10: receipt, rating, and history.** Replace hardcoded values with saved booking data, save ratings, make history filters work, prevent duplicates, and verify a completed ride persists after restart.

**Day 1 exit condition:** one mock cash ride can be completed from sign-in through a correct receipt and saved history, with a live Gebeta map when connected and honest error behavior when disconnected. Produce an installable build early enough to expose packaging issues.

## Day 2: 28 October - polish, verify, and prepare the demonstration

1. **Hour 0-2: fix Day 1 issues and device layout.** Walk the actual device through the full journey, keyboard entry, scroll areas, cancellation, relaunch, and a second vehicle/route. Fix wrong totals, dropped state, overflow, dead primary buttons, or delays first.
2. **Hour 2-4: live Android map verification.** Check map loading, route geometry, endpoint selection, driver simulation, loss of connectivity, retry, and native-map layout in the final APK. Zemen Pro remains a separate project.
3. **Hour 4-5: phase previews and visible branding.** Label food/package previews honestly, clean up generic app labels and misleading promotions/payment copy, and make the client path easy to follow.
4. **Hour 5-7: focused verification.** Test fare/receipt consistency, allowed transitions and cancellation, OTP errors, persistence, and completed-trip history. Run analyzer/tests, verify live maps on connected Android, and verify the error/retry state after connectivity loss.
5. **Hour 7-8: build and delivery package.** Build and install the demo APK; prepare a local web presentation if available; write exact run/reset instructions. Check the final packaged build rather than relying on debug hot reload.
6. **Hour 8-10: buffer and rehearsal.** Repeat the full demonstration twice, capture backup screenshots and a short recording, and prepare a concise completed/demo-only/next-phase explanation. Freeze new features.

**Day 2 exit condition:** a repeatable 5-7 minute presentation, an installed Android build, a backup recording, and an accurate explanation of which integrations remain.

## Acceptance checklist

- [x] Demo starts without a purchase or new paid account; live maps use the existing Gebeta key.
- [x] No SMS or live payment requests are made; live map/search/route requests use Gebeta.
- [x] Incorrect OTP and missing required fields show useful validation.
- [x] Profile persistence and consistent home/profile state are implemented and covered by tests.
- [x] Pickup/destination, chosen vehicle, fare, and cash selection remain consistent throughout the ride in tests.
- [x] Matching/tracking are visibly described as simulated.
- [x] Guarded cancellation, matching and repeated requests/completion are covered by tests.
- [x] Receipt line items add up to the saved booking total.
- [x] Completing and rating a trip updates persistent history exactly once in tests.
- [x] History filters and receipts use the selected saved trip.
- [ ] The actual APK passes the walkthrough with a live map while connected and shows an honest connection/retry state when offline.
- [ ] Browser fallback is checked on the presentation laptop, if included.
- [ ] No clipped primary controls, keyboard-blocked fields, or unresponsive primary actions remain.
- [ ] Demo reset restores the known presentation scenario.
- [x] Food/package screens are labeled previews; Zemen Pro is not embedded in this app.

## Client walkthrough

1. Introduce the three-service home and identify rides as the current phase.
2. Show demo registration/OTP and the saved customer profile.
3. Choose an Addis Ababa route, compare vehicle estimates, and select cash.
4. Request the ride and explain simulated driver assignment/location progress.
5. Complete the ride, show the correct receipt, submit a rating, and reopen it from history.
6. Briefly show food/package previews and explain that drivers will use the separate Zemen Pro app.
7. Explain the next engineering work: live backend/database, actual driver app connectivity, real authentication/GPS, and payment integration.

Suggested description: "The customer interface and ride journey are working in this demonstration build, including real Gebeta maps, saved trips and receipts. Driver matching, driver movement, OTP and cash payment activity are simulated. Digital payments are not connected. Drivers will use the separate Zemen Pro app. The next step is connecting these flows to the backend and live services."

Use that wording only after the corresponding demo acceptance checks pass.

## Costs and the work after the meeting

### Next preparation steps before 29 October

1. Use the verified release demo APK and keep the working debug APK as a backup. Native sign-in, real map/route, simulated progress, completion, persisted history/session and the matching receipt have been checked on the Android API 36 emulator.
2. Install the final APK on the actual presentation phone (Android 7.0/API 24 or newer, as verified from this build's package metadata). Confirm the launcher icon, splash, readable status bar, keyboard behavior and live Gebeta map on that phone's internet connection.
3. Rehearse the complete customer flow twice: one normal completed ride with rating/receipt/history, and one cancelled ride. Reset the local demo data before the client meeting if a clean start is preferred.
4. Present food/package pages as previews and explain that drivers use Zemen Pro. Avoid adding backend or new service scope before the presentation.
5. Record a short backup walkthrough on the presentation phone and keep screenshots available in case the meeting connection is poor. This recording is still a preparation task, not a completed deliverable.

The demo uses the existing computer, Flutter project, local data, existing Gebeta map access, simulated ride/authentication/cash behavior, and an existing Android device. No hosting, domain, production database subscription, SMS credits, new map billing activation, payment merchant activation, or store account purchase is required. A directly installed Android APK with internet for Gebeta is the presentation target.

Zero client spending does not prevent real backend work: NestJS and a local database can be developed on the existing machine. It is deferred from the critical demo path to protect the two-day deadline, not because a paid service is inherently required.

After the presentation, complete the actual Phase 1 foundation: backend project and API contract; PostgreSQL schema/migrations; server-validated authentication; driver availability and matching; two-client status synchronization; real GPS permissions/tracking; server-side fare validation; payment adapter/webhook handling; access control; and integration/device testing. Revisit the proposed Google Maps/Chapa choices against the existing Gebeta/Telebirr UI before live integration.

Then follow the proposal's sequence: restaurant menus/cart/checkout and merchant operations; document/package booking and proof of delivery; full administration/settlements/reporting/support; production hardening and store deployment. Decide on paid services when the implementation and launch requirements justify them.
