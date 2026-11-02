import 'package:flutter/material.dart';
import 'ride_flow_screen.dart';

class RideJourneyScreen extends StatelessWidget {
  const RideJourneyScreen({super.key, required this.tripId});
  final String tripId;
  @override
  Widget build(BuildContext context) => RideFlowScreen(tripId: tripId);
}
