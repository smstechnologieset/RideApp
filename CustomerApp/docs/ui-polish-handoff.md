# ZemenGo presentation build

Prepared 28 October 2026. App version **1.0.0**, Android build **4**.

## Install

Use [ZemenGo-demo-1.0.0-build4.apk](../build/presentation/ZemenGo-demo-1.0.0-build4.apk). It is an 80.8 MiB universal APK for Android 7.0/API 24 or newer, including ARM64, ARMv7 and x86-64. Build 3 remains available as a backup. The standard build output is `build/app/outputs/flutter-apk/app-release.apk`. [Checksums](../build/presentation/SHA256SUMS.txt) identify both packaged builds.

Copy the APK to the presentation phone and open it. If Android requests it, allow installation from the app used to open the file. This uses the existing development signing key and requires no Play Store account. Internet is required for live Gebeta maps, search and directions.

## Delivered polish

- Compact Ride/Food/Package home with a prominent destination action, selected pickup, Home/Work shortcuts, recent destinations and an account menu.
- One live map/controller across booking, matching, driver assignment, trip progress and arrival. White draggable sheets and measured camera padding keep route markers clear of the footer, floating controls and provider credit.
- Realistic generated vehicle photographs, compact class cards, selected fares, cash details, editable route and a persisted pickup note. The primary request/start/finish/done action stays pinned.
- Eleven original bundled images across onboarding, home service cards, the city banner, ride choices/history, driver identity, food cards/menus and the package header. The moving map marker uses an overhead car photograph. The assets total about 1.5 MB and require no image server. [Saved assets and final generation prompts](generated-imagery.md).
- Removed the extra custom “Gebeta Maps” badge above the native map and reclaimed its camera space. The provider's own map credit remains in place.
- Lighter Gebeta road styling, quieter place labels, distinct endpoints and a directional car marker. Progress updates move the vehicle annotation without clearing the route each tick.
- Driver identity/model/colour/plate hierarchy, a focused details sheet, contact preview, saved destination and local issue reports. Back returns home with an active ride available to resume. Cancellation requires confirmation.
- Arrival summary, saved rating, consistent receipt and history grouped by date.
- Account shortcuts, editable profile/phone/email, saved Home/Work/custom places and real local preferences for map labels, haptics and in-app ride alerts.
- Search handles keyboard input, mixed-script addresses, map selection, stale results and short phone heights. On very short keyboard layouts, the active search takes priority; hiding the keyboard restores the route rows.
- Supplied logo, launcher icon and approved splash remain intact. The splash reads the installed app version.

Zemen Pro remains a separate driver app. Food and Package remain usable previews. OTP, driver assignment/movement and cash are simulated. No driver, courier, support team or payment service is contacted. No new paid service was added.

## Five-to-seven-minute rehearsal

1. Open the app and show the branding. Sign in with a valid Ethiopian demo number and code **8429**; no SMS is sent.
2. Tap **Where to?**. Keep Bole Bulbula and Piassa for the demonstrated 7.1 km/17 minute route, or choose other places through Gebeta search or the map.
3. Select Standard or Comfort. The checked live route quoted **172 ETB Standard** and **241 ETB Comfort**. Show Cash and Options, then request.
4. A simulated driver appears after about three seconds. Show the readable plate, driver details and the live route. Start the demo ride, show the moving car, then finish.
5. Choose stars and Save rating. Open the receipt and show that the total matches the booked quote. Done returns home; Trips reopens the saved record.
6. Open the account menu, Saved places and Settings. Home/Work/custom addresses retain coordinates on the device. Map, haptic and in-app alert preferences persist across restarts.
7. Show a Food sample menu and the Package request preview. Both clearly identify their preview scope.

For a clean start, use **Menu > Settings > Reset demo data** and confirm. This clears the local demo profile, trips, places, reports and preferences. Logging out alone retains local data. Do not reset if you want to show the saved trip receipts.

## Verification

- **34 automated checks pass**, covering bundled-image decoding/transparency, photographic onboarding at 360 × 640, lifecycle/cancellation guards, duplicate requests, canonical fares/receipts, notes/progress/reports, preferences/addresses, restart persistence, pinned actions, sheet behavior, compact-map camera bounds, keyboard layouts, larger text at 360/390/412 dp widths, and previews.
- Static analysis has no errors or warnings; 32 existing informational lints remain in older prototype files.
- Release APK builds successfully and verifies with APK Signature Scheme v2. Package: `com.zemengo.ride_app`, version `1.0.0`, build `4`; 84,751,527 bytes.
- Build 4 was installed over the previous APK and retained the saved session/history. Native checks verified home/vehicle/driver/food/menu/package images, removal of the extra top map badge, live map tiles/route and the moving photographic marker. A transient map/route connection failure recovered through the separate map and route retry controls; the resulting 7.1 km/17 minute Standard booking and saved receipt both showed **172 ETB**. Existing Gebeta style/search/directions checks returned HTTP 200.
- Native Android API 36 checks exercised live Gebeta tiles/routes, quiet styling, driver marker movement, sheet/details interaction, arrival, saved ratings and receipts. Standard retained **172 ETB** and Comfort retained **241 ETB**.
- Gebeta style, live search and routing returned HTTP 200; the demonstrated route used 226 provider coordinates, 7,109 metres and about 17 minutes.
- Widget screenshots are previews; native Android screenshots in `build/demo-previews/android-polished-*.png` show the real SDK.

The presentation phone is still unknown. Install this APK there and rehearse before the meeting, especially keyboard behavior, internet access, system bars and map interaction. Emulator and widget checks do not replace that final device check.

## Deliberately deferred

Profile photos, extra preference pages and map-cache controls were lower-priority items in the approved plan. Live authentication, backend dispatch, Zemen Pro integration, calls/chat, push notifications, GPS sharing, traffic feeds, mobile-money/cards, restaurant orders and courier dispatch remain later integration work. Unsupported features are not presented as working switches.

The original design decisions and reference inventory remain in [the approved polish plan](yango-inspired-ui-polish-plan.md).
