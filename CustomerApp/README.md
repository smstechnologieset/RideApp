# ZemenGo customer demo

ZemenGo combines a customer ride demonstration with food and document/package previews. **Zemen Pro is the separate driver app**, not a role inside this application.

The UI polish pass introduces a compact service home, account menu, a persistent live map through booking/matching/tracking/arrival, draggable ride sheets, pinned primary actions, realistic vehicle photographs/markers, saved addresses and functional local settings. Eleven original bundled images now illustrate onboarding, services, food, packages and the demo driver. The extra custom badge above the map has been removed. The installed app version remains 1.0.0; the polished APK uses build number 4. [Imagery and final generation prompts](docs/generated-imagery.md).

## Run and build for Android

Use the installed Flutter SDK and Android SDK:

```powershell
flutter pub get
flutter run
flutter build apk --release
```

The directly installable demo APK is written to `build/app/outputs/flutter-apk/app-release.apk`. A named presentation copy is in `build/presentation/ZemenGo-demo-1.0.0-build4.apk`. The verified universal build is 80.8 MiB, supports ARM64/ARMv7/x86-64, and requires Android 7.0 (API 24) or newer. Copy it to the Android phone, open it, and allow installation from the app used to open the APK if Android requests it. This is a demo build with the existing development signing key; it does not require Play Store publication. Internet access is required for Gebeta map tiles, live search and routing. A debug backup can be built with `flutter build apk --debug`.

The existing map access remains available for this demonstration. To use a different authorized key without editing source:

```powershell
flutter build apk --release --dart-define=GEBETA_API_KEY=YOUR_GEBETA_KEY
```

No SMS, payment gateway, hosting, database subscription or store account is required for this demo. Digital payments are not connected. Android release builds currently use the existing development signing configuration; production signing and distribution are later work.

The supplied ZemenGo image is stored unchanged in `assets/branding/zemengo_logo.png`. Android legacy and adaptive launcher resources use that artwork. The system launch theme matches the blue Flutter splash, which displays the installed package version from `pubspec.yaml`/the build metadata. The splash is based on the supplied reference and includes "All Your Needs One Tap" and "Powered by SMS Technologies".

## Present the app in 5-7 minutes

1. Open the app and show the new splash. Skip or step through onboarding.
2. Use the prefilled Ethiopian demo number or another valid local number. Enter **8429** as the demo code. No SMS is sent.
3. Save the customer name and optional email. The profile remains on this phone.
4. Tap **Where to?**. Use the preselected Bole Bulbula/Piassa locations, choose other curated Addis locations, search Gebeta, or tap a point on the live Android map.
5. Choose a vehicle. The app uses the Gebeta route when available and stores the exact quoted demo fare. If directions are unavailable, it clearly labels the fallback as a demo estimate; it does not draw a fabricated road route.
6. Request the ride. A simulated driver is assigned after about three seconds. Tap **Start demo ride**, show simulated progress on the real map, then **Finish demo ride**.
7. Save a rating, open the receipt, and revisit it from **Home > Trips** or **Menu > Trips**. Vehicle, addresses and totals come from the saved booking. Cash is simulated; no real payment is collected.
8. Show **Food** sample menus and the **Package** booking preview. Neither creates a live order or dispatches a courier.

Before a fresh rehearsal, use **Menu > Settings > Reset demo data**. This removes this app's demo profile/session/trips, saved places, reports and preferences. Logging out keeps local demo history and places. If a ride is in progress, Home and Trips let you resume it after reopening the app. Back returns home without cancelling; cancellation is a separate confirmed action in the expanded ride sheet.

Tap the sheet handle or drag to reveal route/payment/options details. Cash remains the only demo method. **Menu > Saved places** adds Home, Work and custom addresses using live search or map selection. Settings persist quiet-map labels, haptic feedback and in-app ride alert banners. Calls/chat are clearly identified previews; ride issue categories save local demo reports without sending them.

## Map behavior

- Android/iOS use the installed Gebeta native SDK. Pickup/drop-off markers, real route geometry and a directional simulated vehicle marker are drawn through its controller. The SDK receives the API key for its dependent tile/style requests. The same map/controller stays mounted as a new booking advances through matching, tracking and arrival. Progress updates move only the driver annotation rather than clearing the route each tick.
- Camera framing accounts for the measured footer and sheet height. Back and recenter float above the sheet; expanded sheets retain a back action. Quiet map reduces extra POI labels using the provider's existing style layers. Sources and attribution remain Gebeta's; no traffic feed or GPS location sharing is claimed.
- Live map access is checked before creating the native view. Failed loading shows a connection/access message with **Retry map**. GPS permission is not requested: the demo uses explicitly chosen pickup/drop-off coordinates.
- Search is debounced, and stale results are discarded. Curated locations remain available if live search returns no results or times out.
- Web/Windows display a labeled illustrated map preview, not live Android map verification.
- `python scripts/check_gebeta.py` performs three small read-only checks of the existing map access without printing the credential. It needs normal network access. API reference: [Gebeta directions](https://docs.gebeta.app/docs/direction).

## Checks

```powershell
flutter analyze --no-pub --no-fatal-infos
flutter test --no-pub --reporter expanded
flutter build apk --debug --no-pub
flutter build apk --release --no-pub
```

The tests cover phone/OTP validation, ride lifecycle and cancellation, duplicate requests/completion, quote/receipt consistency, profile/history/preferences/addresses persistence, ratings, local reports, progress recovery, reset/corrupt local storage, pinned actions and measured map insets, sheet/details dismissal, cancellation confirmation, keyboard layouts, larger text at 360/390/412 dp widths, history filters and the food/package previews.

Optional preview rendering uses the local Flutter SDK's Roboto font, for example on this workstation:

```powershell
flutter test --no-pub --dart-define=CAPTURE_DEMO=true --dart-define=DEMO_FONT_PATH=C:/src/flutter/bin/cache/artifacts/material_fonts/roboto-regular.ttf
```

Preview images are written to `build/demo-previews/`. Widget rendering verifies Flutter layouts; the final native map must also be checked on Android.

Verification on 28 October: all 34 tests passed. Static analysis has no errors or warnings; 32 existing informational lints remain in older prototype files. The release APK builds and passes APK Signature Scheme v2 verification. Android API 36 checks exercised real Gebeta tiles/routes, quiet styling, directional driver movement, sheet/details interaction, ratings, matching saved receipts (172 ETB Standard and 241 ETB Comfort), saved addresses and preference persistence across APK updates. The exact presentation phone still needs its installation and rehearsal. See [the polish handoff](docs/ui-polish-handoff.md).

Current tooling may warn that Gebeta recommends NDK 27.2.12479018 while the installed SDK uses 27.0.12077973. Debug APK builds have succeeded with the installed version. Existing informational lints remain in legacy screen-gallery files and the illustrated map. These are separate from production readiness.

## Implementation and remaining work

`DemoStore` saves one canonical trip record and the demo profile using device preferences. Ride transitions are guarded and completion is idempotent. The normal app navigation uses the new customer journey and saved receipts. Old screen-gallery prototypes remain in source but are not exposed from the customer navigation.

This is a presentation build, not the completed Phase 1 production milestone. Next work includes a live backend/database, server authentication, separate Zemen Pro app, real driver matching and location sharing, production payment integration, notifications, role/access control and broader device testing. The agreed scope and preparation checklist are in [the two-day plan](docs/two-day-client-demo-plan.md).

