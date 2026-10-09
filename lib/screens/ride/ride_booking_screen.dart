import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/map_view_canvas.dart';
import '../../core/models/ride_models.dart';
import 'searching_driver_screen.dart';

class RideBookingScreen extends StatefulWidget {
  final String pickupAddress;
  final String destinationAddress;

  const RideBookingScreen({
    super.key,
    this.pickupAddress = 'Bole Bulbula, Gate 2',
    this.destinationAddress = 'Piassa, Churchill Avenue, Office 402',
  });

  @override
  State<RideBookingScreen> createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  String _selectedRideId = 'standard';
  String _paymentMethod = 'telebirr'; // 'telebirr' or 'cash'

  final List<RideOption> _rideOptions = const [
    RideOption(
      id: 'standard',
      title: 'Zemen Standard',
      subtitle: 'Popular • Toyota Vitz, Echo',
      price: 185,
      etaMinutes: 4,
      icon: Icons.directions_car_filled_rounded,
      capacity: '4 seats',
      isPopular: true,
    ),
    RideOption(
      id: 'comfort',
      title: 'Zemen Comfort',
      subtitle: 'AC • Newer Corolla, Elantra',
      price: 260,
      etaMinutes: 2,
      icon: Icons.local_taxi_rounded,
      capacity: '4 seats',
    ),
    RideOption(
      id: 'xl',
      title: 'Zemen XL / Van',
      subtitle: 'Extra luggage & legroom',
      price: 420,
      etaMinutes: 7,
      icon: Icons.airport_shuttle_rounded,
      capacity: '6 seats',
    ),
    RideOption(
      id: 'moto',
      title: 'Moto Boda',
      subtitle: 'Fastest through Addis traffic',
      price: 110,
      etaMinutes: 1,
      icon: Icons.two_wheeler_rounded,
      capacity: '1 seat',
      isFastest: true,
    ),
  ];

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
        title: Text(
          'Choose a Ride',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Route Mini Map
            SizedBox(
              height: 140,
              width: double.infinity,
              child: MapViewCanvas(
                height: 140,
                showRoute: true,
                showDriverPin: true,
                pickupLabel: widget.pickupAddress,
                destinationLabel: widget.destinationAddress,
              ),
            ),

            // Waypoints Recap Header Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.outlineVariant.withOpacity(0.3),
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
                            ? AppColors.primary.withOpacity(0.05)
                            : AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.outlineVariant.withOpacity(0.4),
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
                                          color: AppColors.primary.withOpacity(0.1),
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
                                          color: AppColors.tertiary.withOpacity(0.12),
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
                    color: Colors.black.withOpacity(0.08),
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
                      // Telebirr Option
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
