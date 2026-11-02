import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/demo_trip.dart';

class DemoStore extends ChangeNotifier {
  static final instance = DemoStore();
  static const storageKey = 'zemengo.customer.demo.v1';
  static const otp = '8429';
  SharedPreferences? _preferences;
  Future<void> _writes = Future.value();
  final List<DemoTrip> _trips = [];
  String name = 'Demo Customer';
  String email = '';
  String phone = '';
  bool signedIn = false;
  String? storageError;
  bool quietMap = true;
  bool haptics = true;
  bool rideAlerts = true;
  final Map<String, RidePlace> _savedPlaces = {};
  final Map<String, List<String>> _issues = {};
  Map<String, RidePlace> get savedPlaces => Map.unmodifiable(_savedPlaces);
  List<String> issuesFor(String tripId) =>
      List.unmodifiable(_issues[tripId] ?? []);

  List<DemoTrip> get trips => List.unmodifiable(_trips.reversed);
  DemoTrip? get activeTrip => _trips.where((t) => t.active).firstOrNull;
  String get initials => name
      .trim()
      .split(RegExp(r'\s+'))
      .take(2)
      .map((s) => s.isEmpty ? '' : s[0].toUpperCase())
      .join();

  Future<void> initialize({SharedPreferences? preferences}) async {
    _preferences = preferences ?? await SharedPreferences.getInstance();
    final raw = _preferences!.getString(storageKey);
    if (raw == null) return;
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      name = data['name'] as String? ?? name;
      email = data['email'] as String? ?? '';
      phone = data['phone'] as String? ?? '';
      signedIn = data['signedIn'] == true;
      quietMap = data['quietMap'] != false;
      haptics = data['haptics'] != false;
      rideAlerts = data['rideAlerts'] != false;
      _savedPlaces.clear();
      for (final entry in (data['savedPlaces'] as Map? ?? {}).entries) {
        try {
          final place = RidePlace.fromJson(
            Map<String, dynamic>.from(entry.value as Map),
          );
          if (place.latitude.isFinite &&
              place.longitude.isFinite &&
              place.latitude.abs() <= 90 &&
              place.longitude.abs() <= 180) {
            _savedPlaces[entry.key.toString()] = place;
          }
        } catch (_) {
          /* Ignore a damaged address without dropping other saved data. */
        }
      }
      _issues.clear();
      for (final entry in (data['issues'] as Map? ?? {}).entries) {
        if (entry.value is List) {
          _issues[entry.key.toString()] = (entry.value as List)
              .whereType<String>()
              .toList();
        }
      }
      _trips.clear();
      for (final value in data['trips'] as List? ?? []) {
        try {
          final trip = DemoTrip.fromJson(
            Map<String, dynamic>.from(value as Map),
          );
          if (trip.fare >= 0 && trip.distanceKm > 0) _trips.add(trip);
        } catch (_) {
          // Retain valid local trips when an individual old record is unreadable.
        }
      }
    } catch (_) {
      storageError =
          'Saved demo data could not be loaded. Reset the demo in Profile.';
    }
  }

  static String? normalizePhone(String input) {
    var digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('251')) digits = digits.substring(3);
    if (digits.startsWith('0')) digits = digits.substring(1);
    return RegExp(r'^[79]\d{8}$').hasMatch(digits) ? '+251$digits' : null;
  }

  Future<void> saveProfile({
    required String name,
    required String email,
    String? phone,
  }) async {
    if (name.trim().isEmpty) throw ArgumentError('Name is required');
    this.name = name.trim();
    this.email = email.trim();
    if (phone != null) this.phone = phone;
    signedIn = true;
    await _changed();
  }

  Future<void> signOut() async {
    signedIn = false;
    await _changed();
  }

  DemoTrip tripById(String id) => _trips.firstWhere((t) => t.id == id);

  Future<DemoTrip> requestRide({
    required RidePlace pickup,
    required RidePlace destination,
    required String rideId,
    required double distanceKm,
    required int durationMinutes,
    List<List<double>> route = const [],
    bool liveRoute = false,
    String pickupNote = '',
  }) async {
    if (activeTrip != null) return activeTrip!;
    if (distanceKm <= 0 || !distanceKm.isFinite) {
      throw ArgumentError('Invalid distance');
    }
    final option = demoRideOptions(
      distanceKm,
    ).firstWhere((r) => r.id == rideId);
    final now = DateTime.now();
    final trip = DemoTrip(
      id: 'ZG-${now.microsecondsSinceEpoch}',
      pickup: pickup,
      destination: destination,
      rideId: rideId,
      fare: option.price,
      distanceKm: distanceKm,
      durationMinutes: durationMinutes,
      createdAt: now,
      route: route,
      liveRoute: liveRoute,
      pickupNote: pickupNote.trim(),
    );
    _trips.add(trip);
    await _changed();
    return trip;
  }

  Future<bool> transition(String id, RideStatus next) async {
    final index = _trips.indexWhere((t) => t.id == id);
    if (index < 0) return false;
    final trip = _trips[index];
    final allowed = switch (trip.status) {
      RideStatus.searching => {RideStatus.assigned, RideStatus.cancelled},
      RideStatus.assigned => {RideStatus.inProgress, RideStatus.cancelled},
      RideStatus.inProgress => {RideStatus.completed},
      _ => <RideStatus>{},
    };
    if (!allowed.contains(next)) return false;
    _trips[index] = trip.copyWith(
      status: next,
      completedAt: next == RideStatus.completed ? DateTime.now() : null,
      progress: next == RideStatus.completed ? 1 : trip.progress,
    );
    await _changed();
    return true;
  }

  Future<void> rate(String id, int rating) async {
    final index = _trips.indexWhere((t) => t.id == id);
    if (index < 0 ||
        rating < 1 ||
        rating > 5 ||
        _trips[index].status != RideStatus.completed) {
      return;
    }
    _trips[index] = _trips[index].copyWith(rating: rating);
    await _changed();
  }

  Future<void> setPreferences({
    bool? quietMap,
    bool? haptics,
    bool? rideAlerts,
  }) async {
    this.quietMap = quietMap ?? this.quietMap;
    this.haptics = haptics ?? this.haptics;
    this.rideAlerts = rideAlerts ?? this.rideAlerts;
    await _changed();
  }

  void selectionFeedback() {
    if (haptics) HapticFeedback.selectionClick();
  }

  Future<void> savePlace(String label, RidePlace place) async {
    final key = label.trim();
    if (key.isEmpty ||
        !place.latitude.isFinite ||
        !place.longitude.isFinite ||
        place.latitude.abs() > 90 ||
        place.longitude.abs() > 180) {
      throw ArgumentError('Choose a valid place and label');
    }
    _savedPlaces[key] = place;
    await _changed();
  }

  Future<void> removePlace(String label) async {
    _savedPlaces.remove(label);
    await _changed();
  }

  Future<void> reportIssue(String tripId, String category) async {
    tripById(tripId);
    final issues = _issues.putIfAbsent(tripId, () => []);
    if (!issues.contains(category)) issues.add(category);
    await _changed();
  }

  Future<void> saveProgress(String tripId, double progress) async {
    final index = _trips.indexWhere((t) => t.id == tripId);
    if (index < 0 ||
        _trips[index].status != RideStatus.inProgress ||
        !progress.isFinite) {
      return;
    }
    _trips[index] = _trips[index].copyWith(
      progress: progress.clamp(_trips[index].progress, .96),
    );
    await _changed();
  }

  Future<void> reset() async {
    _trips.clear();
    name = 'Demo Customer';
    email = '';
    phone = '';
    signedIn = false;
    storageError = null;
    quietMap = true;
    haptics = true;
    rideAlerts = true;
    _savedPlaces.clear();
    _issues.clear();
    await _changed();
  }

  Future<void> _changed() {
    final raw = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'signedIn': signedIn,
      'quietMap': quietMap,
      'haptics': haptics,
      'rideAlerts': rideAlerts,
      'savedPlaces': _savedPlaces.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'issues': _issues,
      'trips': _trips.map((t) => t.toJson()).toList(),
    });
    notifyListeners();
    _writes = _writes.then((_) async {
      try {
        if (_preferences != null &&
            !await _preferences!.setString(storageKey, raw)) {
          throw StateError('Could not save demo data');
        }
      } catch (_) {
        storageError =
            'This device could not save demo data. Keep the app open for this session.';
        notifyListeners();
      }
    });
    return _writes;
  }
}

class DemoScope extends InheritedNotifier<DemoStore> {
  const DemoScope({super.key, required DemoStore store, required super.child})
    : super(notifier: store);
  static DemoStore of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DemoScope>()!.notifier!;
}
