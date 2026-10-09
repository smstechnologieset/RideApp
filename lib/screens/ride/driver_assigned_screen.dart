import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/map_view_canvas.dart';
import '../../core/models/ride_models.dart';
import 'active_enroute_screen.dart';

class DriverAssignedScreen extends StatefulWidget {
  final RideOption rideOption;
  final String pickup;
  final String destination;
  final DriverInfo driver;

  const DriverAssignedScreen({
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
  State<DriverAssignedScreen> createState() => _DriverAssignedScreenState();
}

class _DriverAssignedScreenState extends State<DriverAssignedScreen> {
  int _etaCountdown = 3;

  void _startTrip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ActiveEnRouteScreen(
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
          // Live Tracking Map
          Positioned.fill(
            child: MapViewCanvas(
              height: MediaQuery.of(context).size.height,
              showRoute: true,
              showDriverPin: true,
              pickupLabel: widget.pickup,
              destinationLabel: widget.destination,
            ),
          ),

          // Top Arrival Status Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.onSurface.withOpacity(0.92),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.tertiary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.near_me_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Driver is on the way',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.tertiaryFixed,
                            ),
                          ),
                          Text(
                            'Arriving in $_etaCountdown mins at Bole Bulbula',
                            style: AppTypography.bodyMdMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.shield_outlined),
                      color: AppColors.tertiaryFixed,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ZemenGo Safety Shield is active • 24/7 Addis Support'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Driver Details Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
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
                    // Driver Profile & Plate Info
                    Row(
                      children: [
                        // Avatar
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              widget.driver.initials,
                              style: AppTypography.headlineSm.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),

                        // Name & Rating
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.driver.name,
                                style: AppTypography.headlineSm.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${widget.driver.rating}',
                                    style: AppTypography.labelSm.copyWith(
                                      color: AppColors.onSurface,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ' (${widget.driver.tripsCount}+ trips)',
                                    style: AppTypography.labelSm.copyWith(
                                      color: AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${widget.driver.carColor} • ${widget.driver.carModel}',
                                style: AppTypography.labelMd.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Ethiopian License Plate Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.outlineVariant,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'ET',
                                style: AppTypography.labelSm.copyWith(
                                  fontSize: 9,
                                  color: AppColors.outline,
                                ),
                              ),
                              Text(
                                widget.driver.licensePlate,
                                style: AppTypography.bodyMdMedium.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Quick Actions Row (Call, Chat, Share, Safety)
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.call_rounded, size: 18),
                            label: const Text('Call'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                            label: const Text('Message'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.share_rounded),
                            color: AppColors.onSurfaceVariant,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Advance to En-Route button
                    ElevatedButton(
                      onPressed: _startTrip,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_car_rounded, size: 20),
                          SizedBox(width: 8),
                          Text('Simulate Boarding & Start Trip'),
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
