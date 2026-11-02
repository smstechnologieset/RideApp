import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ride_app/core/models/demo_trip.dart';
import 'package:ride_app/core/state/demo_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DemoStore store;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = DemoStore();
    await store.initialize();
  });

  Future<DemoTrip> book({String vehicle = 'comfort'}) => store.requestRide(
    pickup: demoPlaces[0],
    destination: demoPlaces[1],
    rideId: vehicle,
    distanceKm: 7.109,
    durationMinutes: 17,
    route: const [
      [8.989, 38.7903],
      [9.03, 38.75],
    ],
    liveRoute: true,
  );

  test(
    'accepts local and international Ethiopian numbers, rejects invalid input',
    () {
      expect(DemoStore.normalizePhone('091 123 4567'), '+251911234567');
      expect(DemoStore.normalizePhone('+251 71 123 4567'), '+251711234567');
      expect(DemoStore.normalizePhone('911234567'), '+251911234567');
      expect(DemoStore.normalizePhone('12345'), isNull);
      expect(DemoStore.normalizePhone('811234567'), isNull);
    },
  );

  test('repeated request creates one active ride with a fixed quote', () async {
    final first = await book();
    final duplicate = await book(vehicle: 'xl');
    expect(first.id, duplicate.id);
    expect(store.trips, hasLength(1));
    expect(first.rideId, 'comfort');
    expect(first.fare, 120 + (7.109 * 17).round());
    expect(first.baseFare + first.distanceFare, first.fare);
  });

  test('cancelled matching cannot assign a driver later', () async {
    final trip = await book();
    expect(await store.transition(trip.id, RideStatus.cancelled), isTrue);
    expect(await store.transition(trip.id, RideStatus.assigned), isFalse);
    expect(store.activeTrip, isNull);
    expect(store.trips.single.status, RideStatus.cancelled);
  });

  test('only valid status transitions complete a ride, once', () async {
    final trip = await book();
    expect(await store.transition(trip.id, RideStatus.completed), isFalse);
    expect(await store.transition(trip.id, RideStatus.assigned), isTrue);
    expect(await store.transition(trip.id, RideStatus.inProgress), isTrue);
    expect(await store.transition(trip.id, RideStatus.cancelled), isFalse);
    expect(await store.transition(trip.id, RideStatus.completed), isTrue);
    final completed = store.trips.single.completedAt;
    expect(await store.transition(trip.id, RideStatus.completed), isFalse);
    expect(store.trips.single.completedAt, completed);
    expect(store.trips, hasLength(1));
  });

  test(
    'profile, completed fare, route and rating survive reloading storage',
    () async {
      await store.saveProfile(
        name: 'Client Demo',
        email: 'client@example.com',
        phone: '+251911234567',
      );
      final trip = await book();
      await store.transition(trip.id, RideStatus.assigned);
      await store.transition(trip.id, RideStatus.inProgress);
      await store.transition(trip.id, RideStatus.completed);
      await store.rate(trip.id, 4);
      final restored = DemoStore();
      await restored.initialize();
      expect(restored.signedIn, isTrue);
      expect(restored.name, 'Client Demo');
      expect(restored.trips.single.fare, trip.fare);
      expect(restored.trips.single.route, trip.route);
      expect(restored.trips.single.rating, 4);
      expect(restored.trips.single.status, RideStatus.completed);
    },
  );

  test('uncompleted rides cannot be rated', () async {
    final trip = await book();
    await store.rate(trip.id, 5);
    expect(store.trips.single.rating, isNull);
  });

  test('reset removes demo profile, session and saved rides', () async {
    await store.saveProfile(name: 'A Customer', email: '');
    await book();
    await store.reset();
    final restored = DemoStore();
    await restored.initialize();
    expect(restored.signedIn, isFalse);
    expect(restored.trips, isEmpty);
    expect(restored.name, 'Demo Customer');
  });

  test('a damaged storage value does not crash app startup', () async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(DemoStore.storageKey, '{invalid json');
    final restored = DemoStore();
    await restored.initialize();
    expect(restored.trips, isEmpty);
    expect(restored.storageError, isNotNull);
  });

  test(
    'preferences and address coordinates survive restart, edit and removal',
    () async {
      await store.setPreferences(
        quietMap: false,
        haptics: false,
        rideAlerts: false,
      );
      await store.savePlace('Home', demoPlaces[0]);
      await store.savePlace('Work', demoPlaces[2]);
      await store.savePlace('Home', demoPlaces[3]);
      await store.removePlace('Work');
      final restored = DemoStore();
      await restored.initialize();
      expect(restored.quietMap, isFalse);
      expect(restored.haptics, isFalse);
      expect(restored.rideAlerts, isFalse);
      expect(restored.savedPlaces.keys, ['Home']);
      expect(restored.savedPlaces['Home']!.latitude, demoPlaces[3].latitude);
      expect(restored.savedPlaces['Home']!.longitude, demoPlaces[3].longitude);
      expect(() => restored.savedPlaces.clear(), throwsUnsupportedError);
    },
  );

  test(
    'pickup notes, monotonic progress and local reports retain the booked fare',
    () async {
      final trip = await store.requestRide(
        pickup: demoPlaces[0],
        destination: demoPlaces[1],
        rideId: 'xl',
        distanceKm: 7.109,
        durationMinutes: 17,
        pickupNote: '  By the main gate  ',
      );
      await store.transition(trip.id, RideStatus.assigned);
      await store.transition(trip.id, RideStatus.inProgress);
      await store.saveProgress(trip.id, .5);
      await store.saveProgress(trip.id, .2);
      await store.reportIssue(trip.id, 'Pickup or route');
      await store.reportIssue(trip.id, 'Pickup or route');
      final restored = DemoStore();
      await restored.initialize();
      expect(restored.activeTrip!.progress, .5);
      expect(restored.activeTrip!.pickupNote, 'By the main gate');
      expect(restored.activeTrip!.fare, trip.fare);
      expect(restored.issuesFor(trip.id), ['Pickup or route']);
      await restored.transition(trip.id, RideStatus.completed);
      expect(restored.tripById(trip.id).progress, 1);
      await restored.saveProgress(trip.id, .8);
      expect(restored.tripById(trip.id).progress, 1);
    },
  );

  test(
    'reset clears local places, reports and preferences as well as trips',
    () async {
      final trip = await book();
      await store.savePlace('Home', demoPlaces[0]);
      await store.reportIssue(trip.id, 'Fare or payment');
      await store.setPreferences(
        haptics: false,
        rideAlerts: false,
        quietMap: false,
      );
      await store.reset();
      final restored = DemoStore();
      await restored.initialize();
      expect(restored.savedPlaces, isEmpty);
      expect(restored.issuesFor(trip.id), isEmpty);
      expect(
        restored.quietMap && restored.haptics && restored.rideAlerts,
        isTrue,
      );
    },
  );
}
