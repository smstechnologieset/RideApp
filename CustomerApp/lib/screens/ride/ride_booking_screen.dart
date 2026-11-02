import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import 'ride_flow_screen.dart';

class RideBookingScreen extends StatelessWidget {
  const RideBookingScreen({
    super.key,
    this.pickupAddress = 'Bole Bulbula, Gate 2',
    this.destinationAddress = 'Piassa, Churchill Avenue',
    this.pickupLat = 8.9890,
    this.pickupLon = 38.7903,
    this.destLat = 9.0300,
    this.destLon = 38.7500,
  });
  final String pickupAddress, destinationAddress;
  final double pickupLat, pickupLon, destLat, destLon;
  @override
  Widget build(BuildContext context) => RideFlowScreen(
    pickup: RidePlace(pickupAddress, pickupLat, pickupLon),
    destination: RidePlace(destinationAddress, destLat, destLon),
  );
}
