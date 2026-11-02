# ZemenGo UI/UX polish plan

Prepared 28 October 2026 for the 29 October client presentation.

## Recommended direction

Keep ZemenGo's supplied logo, blue/mint identity, approved splash, real Gebeta maps, cash demonstration, and separate Zemen Pro driver app. Rework the customer experience around a compact service home, a continuous map with a changing bottom sheet, and an account hub with grouped settings.

The largest improvement will come from composition: the map stays on screen, the next action stays reachable, and less important detail is revealed when requested. Additional decorative cards will have less impact than fixing those three things.

This document is the proposed implementation plan. It does not change the running app or the APK. It builds on the existing working booking, stored trips, receipts and ratings.

## Reference coverage and limits

All **22 supplied images** in `Samples/Yango/` were visually reviewed, together with the current Flutter code and the saved Android screenshots in `build/demo-previews/`.

There are two batches with repeated photo numbers. References below use:

- **A1-A15:** files beginning `photo_1_2026-10-28_10-20-36.jpg` through `photo_15_2026-10-28_10-20-37.jpg`.
- **B1-B7:** files `photo_1_2026-10-28_10-32-27.jpg` through `photo_7_2026-10-28_10-32-27.jpg`.

Key visual references: [map and floating controls (B6)](../Samples/Yango/photo_6_2026-10-28_10-32-27.jpg), [expanded ride sheet (B7)](../Samples/Yango/photo_7_2026-10-28_10-32-27.jpg), [driver details (B4)](../Samples/Yango/photo_4_2026-10-28_10-32-27.jpg), [account hub (A5)](../Samples/Yango/photo_5_2026-10-28_10-20-36.jpg), and [settings (A11)](../Samples/Yango/photo_11_2026-10-28_10-20-37.jpg).

Observed source patterns:

- **A1:** service home with compact header/location/menu, illustrated service choices, destination action and recent places. A lower promotional area appears unfilled in this frame.
- **A2:** arrival summary over a dimmed map, fare as headline, grouped trip/payment/details actions and a persistent bottom Done button.
- **A3:** another home state with recent destinations and a loaded delivery promotion.
- **A4:** lower home content showing the destination action, recent places and promotional tiles.
- **A5:** account hub with identity/photo, four shortcuts (orders, support, addresses, settings), grouped payment/information rows and a separate driver-app entry.
- **A6:** discounts page centred on a single promo-code action.
- **A7:** payment categories and an unmistakable selected method; this image shows mobile-money and cash options.
- **A8:** map-improvement information and grouped issue/reporting actions.
- **A9:** cancellation/ride-profile information and educational rows.
- **A10:** a simple information page with partners, rates and about.
- **A11:** settings divided into General, Theme and map, and Notifications. Visible controls include traffic, map-cache clearing, location sharing and contact preference.
- **A12:** a separate notifications page with grouped preference toggles.
- **A13:** saved addresses, Home/Work shortcuts and a frequently visited place.
- **A14:** trip history grouped by date, with fare prominent and contextual call/help actions.
- **A15:** profile-photo selection as a focused bottom sheet, with gallery/selfie actions and a clear close control.
- **B1:** a large map and compact tracking sheet: remaining time, driver/rating, car identity, a readable plate and secondary content below.
- **B2:** a closely related tracking view; the dark Silent Mode banner is an operating-system overlay, not a proposed ZemenGo control.
- **B3:** destination search over the map, an active search field with clear and Map actions, bilingual place text and the keyboard.
- **B4:** an expanded details sheet with a floating close button, copy actions and grouped route/time/service/payment details.
- **B5:** a ride-issues sheet above the existing tracking context.
- **B6:** the clearest map/control arrangement: back on the left, recenter on the right, both just above the sheet; a directional car marker and destination flag.
- **B7:** expanded tracking details over a dimmed map, including route, estimated payment, details and a visually separated cancellation action.

The supplied frames do not expose Yango's complete vehicle-class chooser, initial request confirmation, or every gesture/animation. The class chooser and exact motion timings below are ZemenGo recommendations. The collapsed/expanded screenshots support the sheet hierarchy, while exact drag behaviour must be designed and tested during implementation.

## Why the current app still feels like a demo

- Home gives a large blue marketing card and heading more space than the actual destination task.
- Booking embeds the map as a 210 dp card inside a long list. Four large vehicle rows and an explanatory banner push the Request button below the initial viewport.
- Tracking is another scrolling page. Route, driver, status and actions compete for attention instead of forming one map-led surface.
- Map labels and major roads are visually strong at the current overview zoom. A small viewport makes that clutter more noticeable.
- Driver location is a circle, so the map does not immediately read as a vehicle moving along a route.
- The account area combines profile editing, demo explanations, driver-app information and reset controls; there is no dedicated settings or saved-address experience.
- Blue/lavender fills, large type and nested cards are used repeatedly. This weakens the hierarchy of the primary action.

The saved screenshots are evidence of the previous build, not a fresh physical-phone check. Some show the earlier status-bar contrast issue, which has already been addressed in source and must be checked on the next APK.

## 1. Shared visual system

Introduce a small set of shared tokens/components before changing individual pages:

- White main surfaces; warm/light neutral page and row backgrounds. Use ZemenGo blue for the primary action, selection and route, with mint for pickup/accent. Use dark text and restrained secondary grey.
- A consistent 16-20 dp horizontal gutter, 8 dp spacing rhythm, 20-24 dp sheet corners and 12-16 dp row/card corners. Prefer one grouped surface with separators over a stack of individually outlined cards.
- Page titles around 24-28 sp, sheet/status titles 22-24 sp, body 15-16 sp, supporting text 12-13 sp. Bold the destination, remaining time, fare and plate where those facts drive a decision.
- Primary buttons 54-56 dp high, 16 dp from the horizontal edges, with bottom system inset included. Secondary/icon controls have at least 48 dp touch targets.
- One icon family and consistent stroke/weight. Add original ZemenGo vehicle artwork or simple vector silhouettes; use fixture identity data rather than the reference person's photograph, phone or plate.
- Keep demo disclosure as a compact persistent chip/status line with an accessible explanation. Show full text on sign-in/help rather than repeating a large banner on every ride state.
- Use short state labels and one primary action per state. Error messages sit near the affected map/field/action.

These are starting specifications, not measurements extracted exactly from the screenshots. The source images are iPhone captures; Android safe areas, keyboard insets, Back behaviour and touch targets take precedence over copying their physical pixel coordinates.

## 2. Home and navigation

References: A1, A3-A5, A13.

Recommended navigation: **service home -> ride flow**, with a top-right menu opening the **account hub**. Trips, payment, saved places, settings and help live in that hub. The ride flow uses its own back/dismiss controls and has no global bottom navigation bar. This follows the reference's simple home/menu relationship and gives the map more room.

Home layout, from top to bottom:

1. Compact ZemenGo logo/name and a tappable selected pickup/location; 48 dp menu button on the right. A selected address is not labelled as live GPS unless device location is actually implemented.
2. A compact three-service row/grid: Ride, Food, Package. Ride is the main service; Food/Package carry small Preview labels. Retain only services in the agreed project scope.
3. A prominent neutral **Where to?** field/button with a search icon and arrow. It should appear in the first screen without scrolling.
4. Home/Work shortcuts and at most two useful recent destinations. Saved destinations can be selected directly; they are not hardcoded ride-history examples.
5. Optional lower service-discovery content after the ride task. Use original service illustrations. Promotional discounts, unsupported bus/cargo products and unfilled loading cards are not needed for this presentation.

An active ride replaces the primary destination prompt with a compact **Resume ride** entry, preserving the current working recovery behaviour.

## 3. Continuous map and bottom sheet

References: B1, B2, B6, B7, plus A2.

Replace the map-inside-a-list composition with a full-screen `Stack`: persistent live Gebeta view, floating controls, and a rounded white bottom sheet. The map controller should survive transitions from choosing a ride through matching, assignment and trip progress where practical.

### Map appearance

- Start from the existing Gebeta vector style and authorised sources. Use pale land/buildings, quieter minor streets and fewer low-priority POI/district labels at overview zoom. Keep key streets and useful Addis landmarks readable.
- Keep the route as a clear ZemenGo-blue line with a subtle light casing. Green/yellow sections visible in B7 are not evidence that the current Gebeta integration has a live traffic feed; traffic colouring is outside this polish pass.
- Use a mint pickup marker/halo and a recognisable destination flag/pin with a small stem. Give markers distinct shapes as well as colours.
- Replace the black driver dot with a small top-down car marker oriented to the route bearing. Its movement remains explicitly simulated.
- Fit the route within the **unobstructed map region**. The sheet must not hide either endpoint or force the car underneath a control.
- Retain provider attribution/logo and position it where it remains visible as the sheet changes height. Avoid placing an oversized custom provider badge over useful map labels.

### Controls and placement

- **Back:** white 48 dp circular button, 16 dp from the left edge, approximately 12 dp above the collapsed sheet, following B6.
- **Recenter:** matching button on the right at the same vertical position. Initially it recenters the chosen pickup/route; its accessible name describes that action. Device GPS is a separate capability.
- **Sheet handle:** centred, approximately 32-40 dp wide, with a generous drag target.
- **Details modal close:** a white 48 dp X above the sheet on the right, following B4. Dismissing details returns to the current trip and preserves its state.
- Hide or reposition floating map controls when an expanded sheet leaves insufficient visible map space. They must never overlap the sheet header, provider attribution, keyboard or system bars.
- Keep zoom primarily gesture-based; a constant stack of zoom/compass buttons would add noise. Show a compass only where needed after map rotation.

### Camera and sheet behaviour

Use collapsed/middle/expanded stops, tuned on the device. Suggested starting fractions are about .34/.56/.88 of usable height for tracking; booking may need a taller middle stop. Compact phones and large text require content-based minimums rather than rigid percentages.

On route selection and sheet snap, fit bounds using the **measured** sheet/footer height plus 24-32 dp margin as camera bottom padding. Include top system/control space and horizontal gutters. Preserve the user's manual pan; recenter resumes following. Update only the driver marker during movement rather than clearing/redrawing the full route every tick.

The map remains visible and interactive behind the ordinary ride sheet. Dim it only for focused secondary modals such as details, issues or payment choices, as seen in B4/B5/B7.

## 4. Search, pickup selection and vehicle options

Reference: B3; A13 for reusable places. Vehicle-choice presentation below is proposed because no tariff chooser is shown in the supplied set.

- Open a focused search sheet with compact pickup/destination rows. The active row gets emphasis; its clear X and Map action stay on the right.
- Start search with keyboard focus in the active destination field. Show recent/saved places first, then live Gebeta results, with primary name and a smaller locality/address line.
- Support long English/Amharic place names with wrapping and a stable line height. Use km for the ZemenGo demo rather than inheriting the miles shown in B3.
- Switching between search and map pin selection preserves the chosen address and draft route. With the keyboard open, only results scroll; the active field and Map action remain accessible.
- Present Standard, Comfort, XL and Moto as compact vehicle cards, preferably a horizontally scrollable row with a visible next-card edge. Each shows vehicle artwork, name, capacity and quoted fare. Use a single blue selected outline/check state.
- Opening a class can reveal extra details in the sheet; do not display every subtitle, seat count and explanation as a separate tall card by default.
- Below the chooser, use a compact **Cash** row and **Ride options** action. Initial options should be useful local data, such as a pickup note. Additional stops, scheduling, child-seat guarantees and fee-changing extras are separate feature work.
- Keep **Request [class] - [fare] ETB** pinned in a bottom action area outside the scrolling content. It remains visible when vehicle cards/options scroll and retains the current disabled/loading/duplicate-request guards.

Suggested booking arrangement:

```text
                 LIVE GEBETA MAP
                 route + markers

  (Back)                                (Recenter)
  +----------------------------------------------+
  |                   handle                     |
  | Pickup -> destination                Edit    |
  | [Standard] [Comfort] [XL] ...                 |
  |  capacity / fare / selected state             |
  | Cash                            Ride options |
  +----------------------------------------------+
  |       Request Standard - 172 ETB              |
  +------------- bottom safe area ---------------+
```

The fare above illustrates the existing demo scenario, not a new pricing rule. Continue storing and displaying the same quote through completion and receipt.

## 5. Matching, driver card and active ride

References: B1, B2, B4-B7.

- **Searching:** keep the map, show a calm matching indicator and concise status in the sheet. Cancellation is a secondary action. Avoid a new full-screen page/route reload for each state.
- **Assigned:** lead with a clear simulated arrival status. The compact card shows name/rating, vehicle model/colour and a prominent plate. Use a small original car illustration and avatar/initials. Keep route, fare and full details below the main summary.
- **In progress:** change the headline to time/progress toward the destination; use wording that distinguishes driver arrival from passenger trip arrival. The simulated car advances along the real route.
- Tapping the driver/card opens a **Driver and ride details** sheet: name, car/plate, pickup, destination, time, selected class, quoted fare, cash method and optional pickup note. Copy buttons can work locally for appropriate fixture fields.
- **Ride issues** opens a small issue-category sheet. Any demonstration report must be clearly saved locally; there is no live support acknowledgement or dispatched assistance until connected.
- Put cancellation at the bottom of expanded details, visually separated in a restrained danger colour. Dismissing the sheet or pressing Android Back must not silently cancel a ride.
- Keep the demo progression controls (Start/Finish demo ride) reachable in the fixed action area and identify them as demo controls. Real passenger apps would receive these state changes from Zemen Pro/backend.
- A call/chat control should appear only with an explicit preview behaviour while drivers are simulated. It must not call a real number from a reference image or claim a message was sent.

The reference has a Save action. For ZemenGo, a bookmark should save a meaningful route/place locally if included; a decorative button with no result is not part of the polish plan.

## 6. Completion, receipt and trip history

References: A2, A14 and B4/B7.

- Keep arrival on the map and show a white summary sheet: **You arrived**, the stored fare, driver/vehicle summary and a compact cash-demo row.
- Offer rating and receipt as clear secondary choices; keep a single Done/Back to home action fixed at the bottom.
- The detailed receipt remains available, with readable grouped rows and the existing correct fare breakdown. Reduce the oversized invoice framing and excessive blank vertical gaps.
- Group history by Today/Yesterday/date, with vehicle/class/time, route summary and fare aligned consistently. Tap opens the correct saved receipt; meaningful local Help/rebook actions can be secondary.
- Retain explicit Completed/Cancelled states and the current cancellation/duplicate guards.
- B7 shows an estimate and A2 a completed amount. This is an observed reference distinction, not permission to introduce unapproved price increases. ZemenGo retains its current consistent saved demo quote.

## 7. Account hub and settings

References: A5-A15.

### Account hub

Use a clean identity header with avatar, saved name and phone. Under it place four consistent shortcuts: **Trips, Help, Saved places, Settings**. Below, group Payment, About and the informational Zemen Pro entry. Keep presentation reset/logout in a lower section rather than competing with everyday actions.

Photo upload can follow A15's focused sheet if time allows: gallery, camera, dismiss. It needs real local image selection, permission handling and persistence; initials remain a valid polished fallback until that work is done.

### Settings structure and actual behaviour

1. **Account:** edit name, phone and email using the existing demo validation. A phone change remains labelled as local/demo verification.
2. **Map:** Standard/Quiet detail choice only when it visibly changes supported Gebeta styling. Recenter behaviour should be explicit. Cache clearing can be added after testing the SDK's real cache API; it must not simply erase preferences and claim tiles were cleared.
3. **Preferences:** a persisted haptics preference tied to actual selection/confirmation feedback. Language choices should correspond to delivered translations; support for mixed-script place labels is required independently of full Amharic UI translation.
4. **Ride notifications:** a focused page for actual in-app alert behaviour, clearly distinct from future background push. Core ride status remains visible. Add marketing switches only when there is content/behaviour for them to control.
5. **Information:** installed app version, SMS Technologies attribution, readable demo/help information, sign out and a separately confirmed Reset demo action.

Use white/neutral grouped rows, left-aligned labels and consistent trailing values/chevrons/switches. A chevron means a working destination; a switch means a persisted behaviour change.

### Saved places

Follow A13 with Home, Work and custom nicknames. Save the full `RidePlace` coordinates and name, allow edit/delete, and use those places in Home and destination search. This is a small useful addition to the local demo; it does not require a paid backend.

### Reference features for later scope

Traffic overlays, real location sharing to a driver, push-notification delivery, mobile-money/card integration, cancellation-ranking logic, map crowdsourcing and promotional campaigns require real capabilities or separate product decisions. They are not visual toggles to add during this presentation pass. The existing Gebeta service remains the map provider and Zemen Pro remains a separate app.

## 8. Implementation sequence before the presentation

Rough planning allowance: **10-14 focused hours**, including verification/build time. These are estimates, not a guarantee; the meeting time and actual phone model are still unknown. Freeze new scope once the core polish is stable.

1. **Shared components and tokens (about 1 hour):** neutral surfaces, typography, grouped rows, icon buttons, primary footer and compact demo indicator.
2. **Map/ride composition (3-4 hours):** one map scaffold, measured sheet stops/camera insets, correctly placed back/recenter controls, persistent Request button and a vehicle marker.
3. **Search and ride state sheets (2-3 hours):** keyboard/search continuity, compact class chooser, assigned/in-progress sheets, readable plate and details modal. Preserve the existing trip store and fare logic.
4. **Home/account/settings (2-3 hours):** compact service home, menu/account navigation, grouped profile/settings, cash page and readable history/completion. Add only settings that actually work.
5. **Verification and packaging (at least 2 hours):** compare screenshots across the whole journey, check Android map/keyboard/sheet behaviour, run tests, build APK, install on the presentation phone and rehearse.

If time tightens, protect steps 1-3 and the verification block. Deliver a minimal functional account/settings page; defer photo upload, extra preferences, saved-place enhancements and decorative campaigns. Food/package remain polished previews rather than new delivery workflows.

## 9. Code areas and implementation feasibility

- `lib/core/theme/app_colors.dart`, `app_typography.dart`, `app_theme.dart`: shared visual tokens; preserve the supplied brand and correct system-bar contrast.
- `lib/screens/home/main_shell_screen.dart`, `super_app_home_screen.dart`: compact home and the recommended menu/account navigation.
- `lib/widgets/gebeta_map_widget.dart`: persistent map controller, viewport padding, less intrusive overlays, correct marker/attribution placement and efficient annotation updates.
- Proposed shared widgets: `RideMapScaffold`, `RideBottomSheet`, `PinnedRideAction`, `GroupedSettingsSection`, `SettingRow`, `VehicleClassCard`, and `DriverSummaryCard`.
- `destination_search_screen.dart`, `map_pin_picker_screen.dart`, `ride_booking_screen.dart`, `ride_journey_screen.dart`: transform the existing flow into the new sheet composition without changing quote/state semantics.
- `profile_screen.dart` plus new account/settings/saved-places pages; `DemoStore` and small settings/place models for persisted local preferences.
- `ride_history_screen.dart`, `saved_trip_receipt_screen.dart`: presentation/grouping improvements while retaining the canonical trip record.

Feasibility was checked against the **installed Gebeta SDK source**, not assumed from another map provider: it exposes `getLayerIds`, `setLayerProperties`, `addImage`/`addSymbol`, `updateCircle`, bounds-based camera updates, logo/attribution margins, and `clearAmbientCache`. Actual style-layer IDs, supported changes, marker rotation and cache behaviour still need native Android validation before those controls are promised.

Implement map styling as a separate source-preserving style configuration, with a safe fallback to the current Gebeta style. Keep the live routes, existing API access, cash simulation, OTP 8429, persistence and separate Zemen Pro boundary. No new paid service or map provider is required.

## 10. Acceptance checks for the polished APK

- Home shows Ride/Food/Package and Where to? without scrolling on a 360 dp-wide phone.
- The live map stays visible behind booking and tracking sheets; the primary action never requires scrolling through the entire page.
- Back/recenter/close controls move with the sheet and remain reachable without colliding with system insets or attribution.
- Route endpoints and the simulated vehicle are visible in the free map area after sheet snaps; manual panning is respected.
- A vehicle marker moves/rotates smoothly; the map/route does not flash or reload on every state update or movement tick.
- Search, clear, Map selection, keyboard dismissal and Android Back preserve the draft route. Long English/Amharic addresses wrap correctly.
- Selected class, stored fare, cash method, trip state, rating and receipts remain consistent through the redesigned screens.
- Every settings row navigates or every switch changes real local behaviour and survives restart. Unsupported integrations are not represented as active controls.
- Sheet expansion/dismissal does not cancel a trip; cancellation remains explicit and duplicate booking guards survive.
- Check 360/390/412 dp widths and larger text, then the actual Android phone. Confirm contrast for status bars, avatar initials, icons, selected controls and primary buttons.
- Keep loading, unavailable-network and Retry states readable while preserving any valid route already shown.
- Run the existing tests with layout assertions updated for the redesigned navigation; add focused checks for pinned actions, sheet/camera insets, saved settings/places and back/cancel behaviour.
- Build/install the final APK and rehearse the full demonstration twice. Keep time for packaging and the final phone check; the previous emulator's update stall is not a reason to skip testing the presentation device.
