import 'package:flutter/material.dart';
import '../../core/services/gebeta_maps_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/gebeta_map_widget.dart';
import '../../core/models/ride_models.dart';
import 'searching_driver_screen.dart';

class RideBookingScreen extends StatefulWidget {
  final String pickupAddress;
  final String destinationAddress;
  final double pickupLat;
  final double pickupLon;
  final double destLat;
  final double destLon;

  const RideBookingScreen({
    super.key,
    this.pickupAddress = 'Bole Bulbula, Gate 2',
    this.destinationAddress = 'Piassa, Churchill Avenue, Office 402',
    this.pickupLat = 8.9890,
    this.pickupLon = 38.7903,
    this.destLat = 9.0300,
    this.destLon = 38.7500,
  });

  @override
  State<RideBookingScreen> createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  String _selectedRideId = 'standard';
  String _paymentMethod = 'telebirr'; // 'telebirr' or 'cash'
  double _distanceKm = 8.2;
  int _durationMinutes = 24;
  bool _isLoadingRoute = true;

  @override
  void initState() {
    super.initState();
    _fetchGebetaRoute();
  }

  Future<void> _fetchGebetaRoute() async {
    final route = await GebetaMapsService.getDirections(
      originLat: widget.pickupLat,
      originLon: widget.pickupLon,
      destLat: widget.destLat,
      destLon: widget.destLon,
    );

    if (mounted && route != null) {
      setState(() {
        _distanceKm = double.parse(route.distanceKm.toStringAsFixed(1));
        _durationMinutes = route.durationMinutes;
        _isLoadingRoute = false;
      });
    } else if (mounted) {
      setState(() => _isLoadingRoute = false);
    }
  }

  List<RideOption> get _rideOptions {
    // Dynamically calculate fares based on Gebeta distance
    final standardBase = 80 + (_distanceKm * 13).round();
    final comfortBase = 120 + (_distanceKm * 17).round();
    final xlBase = 180 + (_distanceKm * 28).round();
    final motoBase = 50 + (_distanceKm * 8).round();

    return [
      RideOption(
        id: 'standard',
        title: 'Zemen Standard',
        subtitle: 'Popular • Toyota Vitz, Echo',
        price: standardBase,
        etaMinutes: 4,
        icon: Icons.directions_car_filled_rounded,
        capacity: '4 seats',
        isPopular: true,
      ),
      RideOption(
        id: 'comfort',
        title: 'Zemen Comfort',
        subtitle: 'AC • Newer Corolla, Elantra',
        price: comfortBase,
        etaMinutes: 2,
        icon: Icons.local_taxi_rounded,
        capacity: '4 seats',
      ),
      RideOption(
        id: 'xl',
        title: 'Zemen XL / Van',
        subtitle: 'Extra luggage & legroom',
        price: xlBase,
        etaMinutes: 7,
        icon: Icons.airport_shuttle_rounded,
        capacity: '6 seats',
      ),
      RideOption(
        id: 'moto',
        title: 'Moto Boda',
        subtitle: 'Fastest through Addis traffic',
        price: motoBase,
        etaMinutes: 1,
        icon: Icons.two_wheeler_rounded,
        capacity: '1 seat',
        isFastest: true,
      ),
    ];
  }

  RideOption get _currentOption =>
      _rideOptions.firstWhere((r) => r.id == _selectedRideId);

  void _requestRide() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SearchingDriverScreen(
          selectedRide: _currentOption,
          pickup: widget.pickupAddress,
          destination: widget.destinationAddress,
          paymentMethod: _paymentMethod,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fare = _currentOption.price;

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
              'Choose a Ride',
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
                'Gebeta Route',
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
            // Gebeta Map Route Viewport
            SizedBox(
              height: 150,
              width: double.infinity,
              child: GebetaMapWidget(
                height: 150,
                showRoute: true,
                showDriverPin: true,
                pickupLabel: widget.pickupAddress,
                destinationLabel: widget.destinationAddress,
              ),
            ),

            // Waypoints & Gebeta Live Distance Recap
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.tertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(width: 1.5, height: 16, color: AppColors.outlineVariant),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pickupAddress,
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.destinationAddress,
                          style: AppTypography.bodyMdMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _isLoadingRoute
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '$_distanceKm km',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '~$_durationMinutes min',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),

            // Scrollable Ride Types Options
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                itemCount: _rideOptions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final option = _rideOptions[index];
                  final isSelected = option.id == _selectedRideId;

                  return InkWell(
                    onTap: () => setState(() => _selectedRideId = option.id),
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: 0.05)
                            : AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.outlineVariant.withValues(alpha: 0.4),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Vehicle Icon
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryContainer
                                  : AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              option.icon,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.onSurfaceVariant,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 14),

                          // Vehicle Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      option.title,
                                      style: AppTypography.headlineSm.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    if (option.isPopular) ...[
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          'POPULAR',
                                          style: AppTypography.labelSm.copyWith(
                                            color: AppColors.primary,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ),
                                    ],
                                    if (option.isFastest) ...[
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.tertiary.withValues(alpha: 0.12),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          'FASTEST',
                                          style: AppTypography.labelSm.copyWith(
                                            color: AppColors.tertiary,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${option.etaMinutes} min away • ${option.capacity}',
                                  style: AppTypography.labelMd.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${option.price} ETB',
                                style: AppTypography.headlineSm.copyWith(
                                  fontSize: 18,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Upfront',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.outline,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Payment & Dispatch Sheet
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 18,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Payment Selector Row
                  Row(
                    children: [
                      // Telebirr Option (Payment Method only)
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _paymentMethod = 'telebirr'),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: _paymentMethod == 'telebirr'
                                  ? AppColors.secondaryFixed
                                  : AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _paymentMethod == 'telebirr'
                                    ? AppColors.secondary
                                    : AppColors.outlineVariant,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_rounded,
                                  color: AppColors.secondary,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Telebirr',
                                  style: AppTypography.bodyMdMedium.copyWith(
                                    color: AppColors.onSecondaryFixed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Spacer(),
                                if (_paymentMethod == 'telebirr')
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    size: 16,
                                    color: AppColors.secondary,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Cash Option
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _paymentMethod = 'cash'),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: _paymentMethod == 'cash'
                                  ? AppColors.primaryFixed
                                  : AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _paymentMethod == 'cash'
                                    ? AppColors.primary
                                    : AppColors.outlineVariant,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.payments_rounded,
                                  color: AppColors.primary,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Cash',
                                  style: AppTypography.bodyMdMedium.copyWith(
                                    color: AppColors.onPrimaryFixed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Spacer(),
                                if (_paymentMethod == 'cash')
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    size: 16,
                                    color: AppColors.primary,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Request CTA Button
                  ElevatedButton(
                    onPressed: _requestRide,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.rocket_launch_rounded, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Request ${_currentOption.title} ($fare ETB)',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
