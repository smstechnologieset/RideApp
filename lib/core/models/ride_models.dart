import 'package:flutter/material.dart';

class RideOption {
  final String id;
  final String title;
  final String subtitle;
  final int price;
  final int etaMinutes;
  final IconData icon;
  final String capacity;
  final bool isFastest;
  final bool isPopular;

  const RideOption({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.etaMinutes,
    required this.icon,
    required this.capacity,
    this.isFastest = false,
    this.isPopular = false,
  });
}

class DriverInfo {
  final String name;
  final String initials;
  final String phone;
  final double rating;
  final int tripsCount;
  final String carModel;
  final String licensePlate;
  final String carColor;
  final int etaMinutes;

  const DriverInfo({
    required this.name,
    required this.initials,
    required this.phone,
    required this.rating,
    required this.tripsCount,
    required this.carModel,
    required this.licensePlate,
    required this.carColor,
    required this.etaMinutes,
  });

  static const defaultDriver = DriverInfo(
    name: 'Dawit Tadesse',
    initials: 'DT',
    phone: '+251 91 144 5566',
    rating: 4.92,
    tripsCount: 1420,
    carModel: 'Toyota Vitz 2018',
    licensePlate: 'AA-3-48291',
    carColor: 'White',
    etaMinutes: 3,
  );
}

class TripLocation {
  final String name;
  final String subtitle;
  final String zone;

  const TripLocation({
    required this.name,
    required this.subtitle,
    this.zone = 'Zone 1',
  });
}

class TripRecord {
  final String id;
  final String pickup;
  final String destination;
  final String date;
  final int fare;
  final String status;
  final String rideType;
  final String paymentMethod;

  const TripRecord({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.date,
    required this.fare,
    required this.status,
    required this.rideType,
    required this.paymentMethod,
  });
}

class RestaurantItem {
  final String id;
  final String name;
  final String cuisine;
  final double rating;
  final int reviewsCount;
  final String deliveryTime;
  final int deliveryFee;
  final String location;
  final String promoBadge;
  final bool isTopRated;

  const RestaurantItem({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.location,
    required this.promoBadge,
    this.isTopRated = false,
  });
}
