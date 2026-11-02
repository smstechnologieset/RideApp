import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';
import '../ride/ride_journey_screen.dart';
import '../ride/saved_trip_receipt_screen.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});
  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  int _filter = 0;
  String _day(DateTime time) {
    final local = time.toLocal(), now = DateTime.now();
    final date = DateTime(local.year, local.month, local.day);
    final today = DateTime(now.year, now.month, now.day);
    if (date == today) return 'Today';
    if (date == today.subtract(const Duration(days: 1))) return 'Yesterday';
    return tripDate(local).split(',').first;
  }

  @override
  Widget build(BuildContext context) {
    final trips = DemoScope.of(context).trips
        .where(
          (t) => switch (_filter) {
            1 => t.status == RideStatus.completed,
            2 => t.status == RideStatus.cancelled,
            _ => true,
          },
        )
        .toList();
    final groups = <String, List<DemoTrip>>{};
    for (final trip in trips) {
      groups.putIfAbsent(_day(trip.createdAt), () => []).add(trip);
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Your trips')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                children: [
                  for (var i = 0; i < 3; i++)
                    ChoiceChip(
                      label: Text(['All', 'Completed', 'Cancelled'][i]),
                      selected: _filter == i,
                      onSelected: (_) => setState(() => _filter = i),
                      showCheckmark: false,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: trips.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.route_outlined,
                            size: 48,
                            color: AppColors.outline,
                          ),
                          SizedBox(height: 18),
                          Text(
                            'Your journey starts here',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rides you book are saved on this phone.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.outline,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    children: [
                      for (final entry in groups.entries) ...[
                        SectionLabel(entry.key),
                        GroupedSection(
                          children: [
                            for (final trip in entry.value) _tripTile(trip),
                          ],
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _tripTile(DemoTrip trip) {
    final time = trip.createdAt.toLocal();
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => trip.active
              ? RideJourneyScreen(tripId: trip.id)
              : SavedTripReceiptScreen(tripId: trip.id),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                VehicleArt(rideId: trip.rideId, width: 56, height: 34),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.option.title.replaceFirst('Zemen ', ''),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} · ${trip.statusLabel}',
                        style: TextStyle(
                          fontSize: 11,
                          color: trip.status == RideStatus.cancelled
                              ? AppColors.error
                              : AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${trip.status == RideStatus.cancelled ? 0 : trip.fare} ETB',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              trip.destination.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              'From ${trip.pickup.name}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.outline,
                height: 1.5,
              ),
            ),
            if (trip.active)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Resume ride →',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
