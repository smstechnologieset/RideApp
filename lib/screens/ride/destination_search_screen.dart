import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/services/gebeta_maps_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'map_pin_picker_screen.dart';
import 'ride_booking_screen.dart';

class DestinationSearchScreen extends StatefulWidget {
  const DestinationSearchScreen({super.key});

  @override
  State<DestinationSearchScreen> createState() =>
      _DestinationSearchScreenState();
}

class _DestinationSearchScreenState extends State<DestinationSearchScreen> {
  final TextEditingController _pickupController =
      TextEditingController(text: 'Bole Bulbula, Gate 2 (Addis Ababa)');
  final TextEditingController _destController =
      TextEditingController(text: 'Piassa, Churchill Avenue, Office 402');

  List<GebetaPlace> _gebetaResults = [];
  bool _isSearching = false;
  Timer? _debounceTimer;

  final List<SearchPlaceItem> _defaultPlaces = const [
    SearchPlaceItem(
      title: 'Piassa, Churchill Avenue',
      subtitle: 'Office 402, Near Post Office • Zone 1',
      distance: '8.2 km',
      lat: 9.0300,
      lon: 38.7500,
      icon: Icons.history_rounded,
    ),
    SearchPlaceItem(
      title: 'Bole Medhanealem Mall',
      subtitle: 'Cameroon St, Near Edna Mall • Bole',
      distance: '3.4 km',
      lat: 8.9979,
      lon: 38.7867,
      icon: Icons.history_rounded,
    ),
    SearchPlaceItem(
      title: 'Meskel Square',
      subtitle: 'Exhibition Center • Addis Ababa',
      distance: '5.1 km',
      lat: 9.0108,
      lon: 38.7613,
      icon: Icons.star_rounded,
    ),
    SearchPlaceItem(
      title: 'Kazanchis, UNECA Headquarters',
      subtitle: 'Menelik II Ave, Near Inter Luxury Hotel',
      distance: '6.7 km',
      lat: 9.0175,
      lon: 38.7725,
      icon: Icons.work_rounded,
    ),
    SearchPlaceItem(
      title: 'Sarbet, Adams Pavilion',
      subtitle: 'Old Airport Road, Near ICS',
      distance: '7.9 km',
      lat: 8.9950,
      lon: 38.7350,
      icon: Icons.place_rounded,
    ),
    SearchPlaceItem(
      title: 'Merkato, Military Tera',
      subtitle: 'Grand Market District, Addis Ababa',
      distance: '11.5 km',
      lat: 9.0333,
      lon: 38.7333,
      icon: Icons.shopping_bag_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _destController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _destController.removeListener(_onSearchChanged);
    _destController.dispose();
    _pickupController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _destController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _gebetaResults = [];
        _isSearching = false;
      });
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 350), () async {
      setState(() => _isSearching = true);
      final results = await GebetaMapsService.geocode(query);
      if (mounted) {
        setState(() {
          _gebetaResults = results;
          _isSearching = false;
        });
      }
    });
  }

  void _selectPlace(String title, double lat, double lon) {
    _destController.text = title;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RideBookingScreen(
          pickupAddress: _pickupController.text,
          destinationAddress: title,
          destLat: lat,
          destLon: lon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Text(
              'Set Route',
              style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.tertiary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Gebeta Live',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.tertiary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Pickup & Destination Inputs Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.outlineVariant.withValues(alpha: 0.4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Dot line indicator
                  Column(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: AppColors.tertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 40,
                        color: AppColors.outlineVariant,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),

                  // Text Fields
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          controller: _pickupController,
                          style: AppTypography.bodyMdMedium.copyWith(
                            color: AppColors.onSurface,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Pickup point (Bole, Piassa...)',
                            fillColor: AppColors.surfaceContainerLow,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            suffixIcon: const Icon(
                              Icons.my_location_rounded,
                              size: 18,
                              color: AppColors.tertiary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _destController,
                          autofocus: true,
                          style: AppTypography.bodyMdMedium.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search Gebeta Maps in Addis...',
                            fillColor: AppColors.surfaceContainerLow,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            suffixIcon: _isSearching
                                ? const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    Icons.search_rounded,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Choose on Map Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MapPinPickerScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.map_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Set pin directly on Gebeta Map',
                        style: AppTypography.bodyMdMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            const Divider(color: AppColors.outlineVariant, height: 1),

            // Results Header
            if (_gebetaResults.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.hub_rounded, size: 14, color: AppColors.tertiary),
                    const SizedBox(width: 6),
                    Text(
                      'Gebeta Search Results (${_gebetaResults.length})',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.tertiary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

            // Locations List: Either Live Gebeta results or Addis Popular Places
            Expanded(
              child: _gebetaResults.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      itemCount: _gebetaResults.length,
                      separatorBuilder: (_, __) => const Divider(color: AppColors.outlineVariant, height: 1),
                      itemBuilder: (context, index) {
                        final place = _gebetaResults[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.tertiary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on_rounded,
                              color: AppColors.tertiary,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            place.name,
                            style: AppTypography.bodyMdMedium.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            '${place.type.toUpperCase()} • ${place.city}, ${place.country}',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.north_west_rounded,
                            size: 16,
                            color: AppColors.outlineVariant,
                          ),
                          onTap: () => _selectPlace(place.name, place.latitude, place.longitude),
                        );
                      },
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      itemCount: _defaultPlaces.length,
                      separatorBuilder: (_, __) => const Divider(color: AppColors.outlineVariant, height: 1),
                      itemBuilder: (context, index) {
                        final place = _defaultPlaces[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceContainerLow,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              place.icon,
                              color: AppColors.onSurfaceVariant,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            place.title,
                            style: AppTypography.bodyMdMedium.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            place.subtitle,
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          trailing: Text(
                            place.distance,
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () => _selectPlace(place.title, place.lat, place.lon),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPlaceItem {
  final String title;
  final String subtitle;
  final String distance;
  final double lat;
  final double lon;
  final IconData icon;

  const SearchPlaceItem({
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.lat,
    required this.lon,
    required this.icon,
  });
}
