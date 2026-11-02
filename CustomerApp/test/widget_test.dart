import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ride_app/core/models/demo_trip.dart';
import 'package:ride_app/core/state/demo_store.dart';
import 'package:ride_app/core/theme/app_theme.dart';
import 'package:ride_app/screens/home/main_shell_screen.dart';
import 'package:ride_app/screens/onboarding/splash_screen.dart';
import 'package:ride_app/screens/onboarding/onboarding_screen.dart';
import 'package:ride_app/screens/onboarding/otp_verification_screen.dart';
import 'package:ride_app/screens/ride/ride_journey_screen.dart';
import 'package:ride_app/screens/ride/ride_booking_screen.dart';
import 'package:ride_app/screens/ride/destination_search_screen.dart';
import 'package:ride_app/screens/profile/profile_screen.dart';
import 'package:ride_app/screens/profile/saved_places_screen.dart';
import 'package:ride_app/widgets/gebeta_map_widget.dart';
import 'package:ride_app/screens/ride/saved_trip_receipt_screen.dart';
import 'package:ride_app/screens/food/food_delivery_screen.dart';
import 'package:ride_app/screens/delivery/package_delivery_screen.dart';

void phoneTest(String description, WidgetTesterCallback callback) =>
    testWidgets(
      description,
      callback,
      variant: TargetPlatformVariant.only(TargetPlatform.windows),
    );

void main() {
  late DemoStore store;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = DemoStore();
    await store.initialize();
    PackageInfo.setMockInitialValues(
      appName: 'ZemenGo',
      packageName: 'com.zemengo.ride_app',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
  });

  Future<void> show(
    WidgetTester tester,
    Widget home, {
    Size size = const Size(390, 844),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    if (const bool.fromEnvironment('CAPTURE_DEMO')) {
      await tester.runAsync(() async {
        const fontPath = String.fromEnvironment('DEMO_FONT_PATH');
        if (fontPath.isNotEmpty) {
          final bytes = ByteData.sublistView(File(fontPath).readAsBytesSync());
          for (final family in ['Roboto', 'sans-serif', 'Segoe UI']) {
            await (FontLoader(family)..addFont(Future.value(bytes))).load();
          }
        }
        await (FontLoader(
          'MaterialIcons',
        )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
      });
    }
    await tester.pumpWidget(
      DemoScope(
        store: store,
        child: RepaintBoundary(
          key: const Key('preview_app'),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: home,
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 1100));
    await tester.runAsync(
      () => precacheImage(
        const AssetImage('assets/branding/zemengo_logo.png'),
        tester.element(find.byType(Scaffold).first),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  Future<void> capture(WidgetTester tester, String name) async {
    if (!const bool.fromEnvironment('CAPTURE_DEMO')) return;
    // Resolve the exact ResizeImage providers used by the rendered widgets.
    // Loading just their AssetImage originals leaves resized decodes pending
    // under the test clock and produces misleading blank photo captures.
    final context = tester.element(find.byType(Scaffold).first);
    final providers = tester
        .widgetList<Image>(find.byType(Image))
        .map((widget) => widget.image)
        .toSet();
    await tester.runAsync(
      () => Future.wait(
        providers.map((provider) => precacheImage(provider, context)),
      ),
    );
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    final repaint = tester.renderObject<RenderRepaintBoundary>(
      find.byKey(const Key('preview_app')),
    );
    await tester.runAsync(() async {
      final image = await repaint.toImage(pixelRatio: 2);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      final directory = Directory('build/demo-previews')
        ..createSync(recursive: true);
      File(
        '${directory.path}/$name.png',
      ).writeAsBytesSync(bytes!.buffer.asUint8List());
      image.dispose();
    });
  }

  phoneTest(
    'splash uses supplied branding and installed version at narrow phone size',
    (tester) async {
      await show(
        tester,
        const SplashScreen(autoAdvance: false),
        size: const Size(360, 780),
      );
      expect(find.text('All Your Needs One Tap'), findsOneWidget);
      expect(find.text('Powered by SMS Technologies'), findsOneWidget);
      expect(find.text('v1.0.0'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await capture(tester, 'splash');
    },
  );

  phoneTest(
    'photographic onboarding fits a small phone and advances all service previews',
    (tester) async {
      await show(tester, const OnboardingScreen(), size: const Size(360, 640));
      expect(find.text('Continue'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await capture(tester, 'imagery-onboarding');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(find.text('PACKAGE PREVIEW'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(find.text('Get Started'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  phoneTest('wrong demo OTP is rejected', (tester) async {
    await show(
      tester,
      const OtpVerificationScreen(phoneNumber: '+251911234567'),
    );
    await tester.enterText(find.byKey(const Key('demo_otp')), '1111');
    await tester.tap(find.text('Verify & Continue'));
    await tester.pump();
    expect(find.text('Use the demo code 8429 to continue.'), findsOneWidget);
    expect(store.signedIn, isFalse);
  });

  phoneTest('customer home and phase previews fit a compact Android viewport', (
    tester,
  ) async {
    await tester.runAsync(
      () => store.saveProfile(name: 'Client Demo', email: ''),
    );
    await show(tester, const MainShellScreen(), size: const Size(360, 780));
    expect(find.text('Where to?'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Package'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await capture(tester, 'home');
  });

  phoneTest(
    'ride completes once and receipt shows the booked vehicle and fare',
    (tester) async {
      final trip = (await tester.runAsync(
        () => store.requestRide(
          pickup: demoPlaces[0],
          destination: demoPlaces[1],
          rideId: 'comfort',
          distanceKm: 7.109,
          durationMinutes: 17,
        ),
      ))!;
      await show(tester, RideJourneyScreen(tripId: trip.id));
      await tester.pump(const Duration(seconds: 3));
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
      await capture(tester, 'polished-driver');
      await tester.tap(find.text('Start demo ride'));
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
      expect(store.trips.single.status, RideStatus.inProgress);
      await capture(tester, 'polished-tracking');
      await tester.tap(find.text('Finish demo ride'));
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
      expect(store.trips.single.status, RideStatus.completed);
      expect(store.trips, hasLength(1));
      await capture(tester, 'polished-arrival');
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await show(tester, SavedTripReceiptScreen(tripId: trip.id));
      expect(find.text('${trip.fare} ETB'), findsOneWidget);
      expect(find.text('Zemen Comfort'), findsOneWidget);
      expect(find.textContaining('Telebirr'), findsNothing);
      expect(tester.takeException(), isNull);
      await capture(tester, 'receipt');
    },
  );

  phoneTest('history filters completed and cancelled rides', (tester) async {
    await tester.runAsync(() async {
      final first = await store.requestRide(
        pickup: demoPlaces[0],
        destination: demoPlaces[1],
        rideId: 'standard',
        distanceKm: 7.109,
        durationMinutes: 17,
      );
      await store.transition(first.id, RideStatus.cancelled);
      final second = await store.requestRide(
        pickup: demoPlaces[2],
        destination: demoPlaces[3],
        rideId: 'xl',
        distanceKm: 3.2,
        durationMinutes: 9,
      );
      await store.transition(second.id, RideStatus.assigned);
      await store.transition(second.id, RideStatus.inProgress);
      await store.transition(second.id, RideStatus.completed);
    });
    await show(tester, const MainShellScreen(initialTab: 1));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ChoiceChip, 'Completed'));
    await tester.pumpAndSettle();
    expect(find.text(demoPlaces[3].name), findsOneWidget);
    expect(find.text(demoPlaces[1].name), findsNothing);
    await tester.tap(find.widgetWithText(ChoiceChip, 'Cancelled'));
    await tester.pumpAndSettle();
    expect(find.text(demoPlaces[1].name), findsOneWidget);
    expect(find.text(demoPlaces[3].name), findsNothing);
  });

  phoneTest('food search filters the restaurant previews', (tester) async {
    await show(tester, const FoodDeliveryScreen());
    await capture(tester, 'imagery-food');
    await tester.enterText(find.byType(TextField), 'Tomoca');
    await tester.pump();
    expect(find.text('Tomoca Coffee'), findsOneWidget);
    expect(find.text('Kategna Restaurant'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  phoneTest('package form fits compact viewport and does not book a ride', (
    tester,
  ) async {
    await show(
      tester,
      const PackageDeliveryScreen(),
      size: const Size(360, 780),
    );
    await capture(tester, 'imagery-package');
    await tester.scrollUntilVisible(
      find.text('Preview delivery request'),
      350,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Preview delivery request'));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('Delivery request preview'), findsOneWidget);
    expect(store.trips, isEmpty);
    expect(tester.takeException(), isNull);
  });

  phoneTest('booking action stays pinned while class cards and sheet move', (
    tester,
  ) async {
    await show(tester, const RideBookingScreen(), size: const Size(360, 780));
    final button = find.byKey(const Key('request_ride'));
    final initial = tester.getRect(button);
    final initialMapPadding = tester
        .widget<GebetaMapWidget>(find.byKey(const Key('ride_live_map')))
        .bottomPadding;
    expect(initial.bottom, lessThanOrEqualTo(780));
    expect(initial.top, greaterThan(650));
    expect(find.byKey(const Key('recenter_route')), findsOneWidget);
    await capture(tester, 'polished-booking');
    final horizontal = find.byWidgetPredicate(
      (widget) =>
          widget is Scrollable && widget.axisDirection == AxisDirection.right,
    );
    await tester.drag(horizontal, const Offset(-300, 0));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.byKey(const Key('ride_xl')));
    await tester.pump();
    expect(tester.getRect(button), initial);
    await tester.tap(find.byKey(const Key('toggle_ride_sheet')));
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();
    expect(tester.getRect(button), initial);
    expect(
      tester
          .widget<GebetaMapWidget>(find.byKey(const Key('ride_live_map')))
          .bottomPadding,
      greaterThan(initialMapPadding),
    );
    expect(tester.takeException(), isNull);
    await capture(tester, 'polished-booking-expanded');
  });

  phoneTest(
    'leaving tracking preserves the active ride and returning resumes it',
    (tester) async {
      final trip = (await tester.runAsync(
        () => store.requestRide(
          pickup: demoPlaces[0],
          destination: demoPlaces[1],
          rideId: 'standard',
          distanceKm: 7.109,
          durationMinutes: 17,
        ),
      ))!;
      await tester.runAsync(
        () => store.transition(trip.id, RideStatus.assigned),
      );
      await show(tester, RideJourneyScreen(tripId: trip.id));
      await tester.tap(find.byKey(const Key('ride_back')));
      await tester.pumpAndSettle();
      expect(store.activeTrip!.id, trip.id);
      expect(store.activeTrip!.status, RideStatus.assigned);
      expect(find.text('Resume your ride'), findsOneWidget);
      await tester.tap(find.text('Resume your ride'));
      await tester.pumpAndSettle();
      expect(find.text('Your driver is ready'), findsOneWidget);
      expect(find.text('DEMO 01'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  phoneTest(
    'account shortcuts and persisted settings fit compact Android layout',
    (tester) async {
      await show(tester, const ProfileScreen(), size: const Size(360, 780));
      await capture(tester, 'polished-account');
      await tester.tap(find.text('Settings').first);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('quiet_map_setting')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('haptics_setting')));
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
      expect(store.quietMap, isFalse);
      expect(store.haptics, isFalse);
      expect(tester.takeException(), isNull);
      await capture(tester, 'polished-settings');
    },
  );

  phoneTest('saved places are available by label in destination search', (
    tester,
  ) async {
    await tester.runAsync(() => store.savePlace('Home', demoPlaces[3]));
    await show(tester, const SavedPlacesScreen());
    expect(find.text(demoPlaces[3].name), findsOneWidget);
    await capture(tester, 'polished-places');
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    await show(tester, const DestinationSearchScreen());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Home'), findsOneWidget);
    await tester.tap(find.text('Home'));
    await tester.pump();
    expect(find.text(demoPlaces[3].name).first, findsOneWidget);
    expect(tester.takeException(), isNull);
    await capture(tester, 'polished-search');
  });

  for (final width in [360.0, 390.0, 412.0]) {
    phoneTest(
      'tracking keeps primary action visible at width $width and larger text',
      (tester) async {
        final trip = (await tester.runAsync(
          () => store.requestRide(
            pickup: demoPlaces[4],
            destination: demoPlaces[6],
            rideId: 'comfort',
            distanceKm: 8.2,
            durationMinutes: 21,
          ),
        ))!;
        await tester.runAsync(
          () => store.transition(trip.id, RideStatus.assigned),
        );
        await show(
          tester,
          MediaQuery(
            data: MediaQueryData(
              size: Size(width, 780),
              textScaler: const TextScaler.linear(1.4),
            ),
            child: RideJourneyScreen(tripId: trip.id),
          ),
          size: Size(width, 780),
        );
        expect(
          tester.getRect(find.byKey(const Key('ride_primary_action'))).bottom,
          lessThanOrEqualTo(780),
        );
        expect(tester.takeException(), isNull);
      },
    );
  }

  phoneTest(
    'details dismissal keeps the trip; cancellation requires confirmation',
    (tester) async {
      final trip = (await tester.runAsync(
        () => store.requestRide(
          pickup: demoPlaces[0],
          destination: demoPlaces[1],
          rideId: 'standard',
          distanceKm: 7.109,
          durationMinutes: 17,
        ),
      ))!;
      await tester.runAsync(
        () => store.transition(trip.id, RideStatus.assigned),
      );
      await show(tester, RideJourneyScreen(tripId: trip.id));
      await tester.tap(find.text('DEMO 01'));
      await tester.pumpAndSettle();
      expect(find.text('Driver & ride details'), findsOneWidget);
      await tester.tap(find.byTooltip('Close'));
      await tester.pumpAndSettle();
      expect(store.activeTrip!.id, trip.id);
      await tester.tap(find.byKey(const Key('toggle_ride_sheet')));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Cancel demo ride'),
        250,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('Cancel demo ride'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Keep ride'));
      await tester.pumpAndSettle();
      expect(store.activeTrip!.status, RideStatus.assigned);
      await tester.tap(find.text('Cancel demo ride'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel ride'));
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
      expect(store.activeTrip, isNull);
      expect(store.trips.single.status, RideStatus.cancelled);
      expect(find.text('Where to?'), findsOneWidget);
    },
  );

  phoneTest(
    'keyboard search fits a narrow phone with a long bilingual saved address',
    (tester) async {
      const place = RidePlace(
        'ሜስቀል አደባባይ · Meskel Square, Addis Ababa',
        9.0108,
        38.7613,
      );
      await tester.runAsync(() => store.savePlace('Work', place));
      await show(
        tester,
        MediaQuery(
          data: const MediaQueryData(
            size: Size(360, 780),
            viewInsets: EdgeInsets.only(bottom: 300),
            textScaler: TextScaler.linear(1.2),
          ),
          child: const DestinationSearchScreen(),
        ),
        size: const Size(360, 780),
      );
      expect(find.byKey(const Key('place_search')), findsOneWidget);
      expect(find.text('Map'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await capture(tester, 'polished-keyboard-search');
    },
  );

  phoneTest(
    'short phone keeps search and Map accessible above a tall keyboard',
    (tester) async {
      await show(
        tester,
        MediaQuery(
          data: const MediaQueryData(
            size: Size(360, 640),
            viewInsets: EdgeInsets.only(bottom: 320),
            padding: EdgeInsets.only(top: 24, bottom: 24),
            textScaler: TextScaler.linear(1.2),
          ),
          child: const DestinationSearchScreen(),
        ),
        size: const Size(360, 640),
      );
      expect(find.byKey(const Key('place_search')), findsOneWidget);
      expect(find.text('Map'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
