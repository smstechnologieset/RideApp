import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/polished_components.dart';
import '../../widgets/app_artwork.dart';
import '../ride/destination_search_screen.dart';
import '../ride/map_pin_picker_screen.dart';
import '../ride/ride_journey_screen.dart';
import '../delivery/package_delivery_screen.dart';
import '../food/food_delivery_screen.dart';
import '../history/ride_history_screen.dart';
import '../profile/saved_places_screen.dart';

class SuperAppHomeScreen extends StatefulWidget {
  const SuperAppHomeScreen({super.key, this.onOpenDrawer});
  final VoidCallback? onOpenDrawer;
  @override
  State<SuperAppHomeScreen> createState() => _SuperAppHomeScreenState();
}

class _SuperAppHomeScreenState extends State<SuperAppHomeScreen> {
  RidePlace _pickup = demoPlaces[0];
  void _book({RidePlace? destination}) {
    final active = DemoScope.of(context).activeTrip;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => active == null
            ? DestinationSearchScreen(
                initialPickup: _pickup,
                initialDestination: destination,
              )
            : RideJourneyScreen(tripId: active.id),
      ),
    );
  }

  Future<void> _choosePickup() async {
    final place = await Navigator.push<RidePlace>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            MapPinPickerScreen(initialPlace: _pickup, returnSelection: true),
      ),
    );
    if (mounted && place != null) setState(() => _pickup = place);
  }

  @override
  Widget build(BuildContext context) {
    final store = DemoScope.of(context);
    final active = store.activeTrip;
    final recent = <RidePlace>[];
    for (final trip in store.trips) {
      if (!recent.any((p) => p.name == trip.destination.name)) {
        recent.add(trip.destination);
      }
      if (recent.length == 2) break;
    }
    final suggestions = recent.isEmpty
        ? [demoPlaces[1], demoPlaces[3]]
        : recent;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            Row(
              children: [
                const BrandLogo(size: 42),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: _choosePickup,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ZemenGo',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -.7,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _pickup.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.outline,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                                color: AppColors.outline,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  key: const Key('account_menu'),
                  tooltip: 'Account menu',
                  onPressed: widget.onOpenDrawer,
                  icon: const Icon(Icons.menu_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerLow,
                    minimumSize: const Size(48, 48),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _service(
                    'Ride',
                    'Let’s go',
                    const VehicleArt(width: 110, height: 72),
                    () => _book(),
                    primary: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _service(
                    'Food',
                    'Preview',
                    _servicePhoto(AppArtwork.habesha),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FoodDeliveryScreen(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _service(
                    'Package',
                    'Preview',
                    _servicePhoto(AppArtwork.parcel),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PackageDeliveryScreen(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Material(
              color: active == null
                  ? AppColors.surfaceContainer
                  : AppColors.primaryFixed,
              borderRadius: BorderRadius.circular(18),
              child: InkWell(
                key: const Key('home_where_to'),
                onTap: () => _book(),
                borderRadius: BorderRadius.circular(18),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(
                        active == null
                            ? Icons.search_rounded
                            : Icons.directions_car_rounded,
                        size: 25,
                        color: active == null
                            ? AppColors.onSurface
                            : AppColors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              active == null ? 'Where to?' : 'Resume your ride',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -.5,
                              ),
                            ),
                            if (active != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                active.destination.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.outline,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_rounded, size: 21),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _savedShortcut('Home', Icons.home_outlined, store),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _savedShortcut(
                    'Work',
                    Icons.work_outline_rounded,
                    store,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Text(
                    recent.isEmpty
                        ? 'Popular destinations'
                        : 'Recent destinations',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RideHistoryScreen(),
                    ),
                  ),
                  child: const Text('Trips'),
                ),
              ],
            ),
            for (var i = 0; i < suggestions.length; i++) ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    recent.isEmpty
                        ? Icons.place_outlined
                        : Icons.history_rounded,
                    color: AppColors.onSurfaceVariant,
                    size: 21,
                  ),
                ),
                title: Text(
                  suggestions[i].name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  'Addis Ababa',
                  style: TextStyle(fontSize: 12, color: AppColors.outline),
                ),
                trailing: const Icon(
                  Icons.north_west_rounded,
                  size: 17,
                  color: AppColors.outline,
                ),
                onTap: () => _book(destination: suggestions[i]),
              ),
              if (i < suggestions.length - 1)
                const Padding(
                  padding: EdgeInsets.only(left: 54),
                  child: Divider(),
                ),
            ],
            const SizedBox(height: 20),
            const CityPromoBanner(),
            const SizedBox(height: 14),
            const Row(
              children: [
                DemoChip(),
                Spacer(),
                Text(
                  'All Your Needs One Tap',
                  style: TextStyle(fontSize: 10, color: AppColors.outline),
                ),
              ],
            ),
            if (store.storageError != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  store.storageError!,
                  style: const TextStyle(fontSize: 12, color: AppColors.error),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _servicePhoto(String asset) => ClipRRect(
    borderRadius: BorderRadius.circular(13),
    child: AppPhoto(
      asset,
      width: 96,
      height: 72,
      fit: asset == AppArtwork.parcel ? BoxFit.contain : BoxFit.cover,
      cacheWidth: 320,
    ),
  );
  Widget _service(
    String title,
    String subtitle,
    Widget art,
    VoidCallback onTap, {
    bool primary = false,
  }) => Material(
    color: primary ? AppColors.primaryFixed : AppColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(20),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 14),
        child: Column(
          children: [
            SizedBox(height: 72, child: art),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 10, color: AppColors.outline),
            ),
          ],
        ),
      ),
    ),
  );
  Widget _savedShortcut(String label, IconData icon, DemoStore store) =>
      Material(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => store.savedPlaces.containsKey(label)
              ? _book(destination: store.savedPlaces[label])
              : Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedPlacesScreen()),
                ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (!store.savedPlaces.containsKey(label))
                  const Icon(
                    Icons.add_rounded,
                    size: 16,
                    color: AppColors.outline,
                  ),
              ],
            ),
          ),
        ),
      );
}
