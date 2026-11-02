import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/polished_components.dart';

class SavedTripReceiptScreen extends StatelessWidget {
  const SavedTripReceiptScreen({super.key, required this.tripId});
  final String tripId;
  @override
  Widget build(BuildContext context) {
    final trip = DemoScope.of(context).tripById(tripId);
    final cancelled = trip.status == RideStatus.cancelled;
    return Scaffold(
      appBar: AppBar(title: const Text('Trip receipt')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            Row(
              children: [
                const BrandLogo(size: 38),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'ZemenGo',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  trip.statusLabel,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: cancelled
                        ? AppColors.error
                        : AppColors.tertiaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '${cancelled ? 0 : trip.fare} ETB',
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Cash · Demonstration receipt',
              style: TextStyle(fontSize: 13, color: AppColors.outline),
            ),
            const SizedBox(height: 8),
            Text(
              tripDate(trip.completedAt ?? trip.createdAt),
              style: const TextStyle(fontSize: 12, color: AppColors.outline),
            ),
            const SizedBox(height: 22),
            GroupedSection(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: RouteSummary(
                    pickup: trip.pickup.name,
                    destination: trip.destination.name,
                  ),
                ),
              ],
            ),
            const SectionLabel('Trip details'),
            GroupedSection(
              children: [
                _row('Vehicle', trip.option.title),
                _row(
                  trip.liveRoute ? 'Gebeta route' : 'Demo estimate',
                  '${trip.distanceKm.toStringAsFixed(1)} km · ${trip.durationMinutes} min',
                ),
                if (trip.pickupNote.isNotEmpty)
                  _row('Pickup note', trip.pickupNote),
                if (!cancelled) ...[
                  _row('Base fare', '${trip.baseFare} ETB'),
                  _row('Distance fare', '${trip.distanceFare} ETB'),
                ] else
                  _row('Cancellation fee', '0 ETB'),
                if (trip.rating != null)
                  _row('Your rating', '${trip.rating}/5'),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              trip.id,
              style: const TextStyle(fontSize: 10, color: AppColors.outline),
            ),
            const SizedBox(height: 12),
            const Text(
              'No real payment was collected. This demonstration receipt is not a tax invoice.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.outline,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 18),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.outline),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
