import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/map_view_canvas.dart';
import '../../core/models/ride_models.dart';
import 'trip_completed_screen.dart';

class ActiveEnRouteScreen extends StatefulWidget {
  final RideOption rideOption;
  final String pickup;
  final String destination;
  final DriverInfo driver;

  const ActiveEnRouteScreen({
    super.key,
    this.rideOption = const RideOption(
      id: 'standard',
      title: 'Zemen Standard',
      subtitle: 'Toyota Vitz',
      price: 185,
      etaMinutes: 4,
      icon: Icons.directions_car_filled_rounded,
      capacity: '4 seats',
    ),
    this.pickup = 'Bole Bulbula, Gate 2',
    this.destination = 'Piassa, Churchill Avenue, Office 402',
    this.driver = DriverInfo.defaultDriver,
  });

  @override
  State<ActiveEnRouteScreen> createState() => _ActiveEnRouteScreenState();
}

class _ActiveEnRouteScreenState extends State<ActiveEnRouteScreen> {
  int _etaMinutes = 18;
  int _speedKmH = 42;

  void _finishTrip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => TripCompletedScreen(
          rideOption: widget.rideOption,
          pickup: widget.pickup,
          destination: widget.destination,
          driver: widget.driver,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Live Navigation Map Viewport
          Positioned.fill(
            child: MapViewCanvas(
              height: MediaQuery.of(context).size.height,
              showRoute: true,
              showDriverPin: true,
              pickupLabel: widget.pickup,
              destinationLabel: widget.destination,
            ),
          ),

          // Top Turn-by-Turn Instruction Banner
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.turn_right_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'In 400m, keep right',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.tertiaryFixed,
                            ),
                          ),
                          Text(
                            'Towards Churchill Ave, Piassa',
                            style: AppTypography.headlineSm.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Live Speed Pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$_speedKmH',
                            style: AppTypography.headlineSm.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'km/h',
                            style: AppTypography.labelSm.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom En-Route Status HUD Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Destination & ETA
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DROPPING OFF AT',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.destination,
                              style: AppTypography.headlineSm.copyWith(
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$_etaMinutes min',
                              style: AppTypography.headlineSm.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '6.4 km left',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.outlineVariant, height: 1),
                    const SizedBox(height: 16),

                    // Driver info snippet
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              widget.driver.initials,
                              style: AppTypography.bodyMdMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.driver.name,
                                style: AppTypography.bodyMdMedium.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${widget.driver.carModel} • ${widget.driver.licensePlate}',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tertiary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shield_rounded,
                                size: 14,
                                color: AppColors.tertiary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Safety ON',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.tertiary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Complete Trip button (Simulates arrival)
                    ElevatedButton(
                      onPressed: _finishTrip,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_rounded, size: 20),
                          SizedBox(width: 8),
                          Text('Simulate Destination Arrival'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
