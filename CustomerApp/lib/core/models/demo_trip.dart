import 'package:flutter/material.dart';
import 'ride_models.dart';

enum RideStatus { searching, assigned, inProgress, completed, cancelled }

typedef RideDraft = ({RidePlace pickup, RidePlace destination});

class RidePlace {
  const RidePlace(this.name, this.latitude, this.longitude);
  final String name;
  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() => {
    'name': name,
    'lat': latitude,
    'lon': longitude,
  };
  factory RidePlace.fromJson(Map<String, dynamic> value) => RidePlace(
    value['name'] as String,
    (value['lat'] as num).toDouble(),
    (value['lon'] as num).toDouble(),
  );
}

const demoPlaces = [
  RidePlace('Bole Bulbula, Gate 2', 8.9890, 38.7903),
  RidePlace('Piassa, Churchill Avenue', 9.0300, 38.7500),
  RidePlace('Bole Medhanealem Mall', 8.9979, 38.7867),
  RidePlace('Meskel Square', 9.0108, 38.7613),
  RidePlace('Kazanchis, UNECA Headquarters', 9.0175, 38.7725),
  RidePlace('Sarbet, Adams Pavilion', 8.9950, 38.7350),
  RidePlace('Bole Airport, Terminal 2', 8.9806, 38.7993),
];

List<RideOption> demoRideOptions(double distanceKm) => [
  RideOption(
    id: 'standard',
    title: 'Zemen Standard',
    subtitle: 'Toyota Vitz · Everyday rides',
    price: 80 + (distanceKm * 13).round(),
    etaMinutes: 4,
    icon: Icons.directions_car_filled_rounded,
    capacity: '4 seats',
    isPopular: true,
  ),
  RideOption(
    id: 'comfort',
    title: 'Zemen Comfort',
    subtitle: 'Corolla · Extra comfort',
    price: 120 + (distanceKm * 17).round(),
    etaMinutes: 3,
    icon: Icons.local_taxi_rounded,
    capacity: '4 seats',
  ),
  RideOption(
    id: 'xl',
    title: 'Zemen XL',
    subtitle: 'Van · Room for everyone',
    price: 180 + (distanceKm * 28).round(),
    etaMinutes: 7,
    icon: Icons.airport_shuttle_rounded,
    capacity: '6 seats',
  ),
  RideOption(
    id: 'moto',
    title: 'Zemen Moto',
    subtitle: 'Motorcycle · Travel light',
    price: 50 + (distanceKm * 8).round(),
    etaMinutes: 2,
    icon: Icons.two_wheeler_rounded,
    capacity: '1 seat',
  ),
];

int baseFareFor(String rideId) => switch (rideId) {
  'comfort' => 120,
  'xl' => 180,
  'moto' => 50,
  _ => 80,
};

class DemoTrip {
  const DemoTrip({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.rideId,
    required this.fare,
    required this.distanceKm,
    required this.durationMinutes,
    required this.createdAt,
    this.route = const [],
    this.liveRoute = false,
    this.status = RideStatus.searching,
    this.completedAt,
    this.rating,
    this.pickupNote = '',
    this.progress = 0,
  });

  final String id;
  final RidePlace pickup;
  final RidePlace destination;
  final String rideId;
  final int fare;
  final double distanceKm;
  final int durationMinutes;
  final DateTime createdAt;
  final DateTime? completedAt;
  final List<List<double>> route;
  final bool liveRoute;
  final RideStatus status;
  final int? rating;
  final String pickupNote;
  final double progress;

  RideOption get option =>
      demoRideOptions(distanceKm).firstWhere((r) => r.id == rideId);
  int get baseFare => baseFareFor(rideId);
  int get distanceFare => fare - baseFare;
  bool get active =>
      status != RideStatus.completed && status != RideStatus.cancelled;
  String get statusLabel => switch (status) {
    RideStatus.searching => 'Finding a driver',
    RideStatus.assigned => 'Driver assigned',
    RideStatus.inProgress => 'On your way',
    RideStatus.completed => 'Completed',
    RideStatus.cancelled => 'Cancelled',
  };

  DemoTrip copyWith({
    RideStatus? status,
    DateTime? completedAt,
    int? rating,
    double? progress,
  }) => DemoTrip(
    id: id,
    pickup: pickup,
    destination: destination,
    rideId: rideId,
    fare: fare,
    distanceKm: distanceKm,
    durationMinutes: durationMinutes,
    createdAt: createdAt,
    route: route,
    liveRoute: liveRoute,
    status: status ?? this.status,
    completedAt: completedAt ?? this.completedAt,
    rating: rating ?? this.rating,
    pickupNote: pickupNote,
    progress: progress ?? this.progress,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'pickup': pickup.toJson(),
    'destination': destination.toJson(),
    'rideId': rideId,
    'fare': fare,
    'distanceKm': distanceKm,
    'durationMinutes': durationMinutes,
    'createdAt': createdAt.toIso8601String(),
    'completedAt': completedAt?.toIso8601String(),
    'route': route,
    'liveRoute': liveRoute,
    'status': status.name,
    'rating': rating,
    'pickupNote': pickupNote,
    'progress': progress,
  };

  factory DemoTrip.fromJson(Map<String, dynamic> value) => DemoTrip(
    id: value['id'] as String,
    pickup: RidePlace.fromJson(
      Map<String, dynamic>.from(value['pickup'] as Map),
    ),
    destination: RidePlace.fromJson(
      Map<String, dynamic>.from(value['destination'] as Map),
    ),
    rideId: value['rideId'] as String,
    fare: value['fare'] as int,
    distanceKm: (value['distanceKm'] as num).toDouble(),
    durationMinutes: value['durationMinutes'] as int,
    createdAt: DateTime.parse(value['createdAt'] as String),
    completedAt: value['completedAt'] == null
        ? null
        : DateTime.parse(value['completedAt'] as String),
    route: (value['route'] as List? ?? [])
        .map((p) => (p as List).map((n) => (n as num).toDouble()).toList())
        .toList(),
    liveRoute: value['liveRoute'] == true,
    status: RideStatus.values.byName(value['status'] as String),
    rating: value['rating'] as int?,
    pickupNote: value['pickupNote'] as String? ?? '',
    progress: (value['progress'] as num?)?.toDouble().clamp(0, 1) ?? 0,
  );
}

String tripDate(DateTime value) {
  final date = value.toLocal();
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}
