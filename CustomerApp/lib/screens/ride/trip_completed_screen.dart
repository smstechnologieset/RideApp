import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/models/ride_models.dart';
import 'rate_driver_screen.dart';
import 'trip_receipt_screen.dart';

class TripCompletedScreen extends StatelessWidget {
  final RideOption rideOption;
  final String pickup;
  final String destination;
  final DriverInfo driver;

  const TripCompletedScreen({
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const Spacer(),

              // Success Icon Circle
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: AppColors.tertiary.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: AppColors.tertiary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'You have arrived!',
                style: AppTypography.displayLgMobile.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Hope you had a pleasant trip with ${driver.name}.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 32),

              // Trip Summary Bento Box
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Fare Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fare Paid',
                          style: AppTypography.bodyLgMedium.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${rideOption.price} ETB',
                              style: AppTypography.displayLgMobile.copyWith(
                                color: AppColors.primary,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryFixed,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Paid via Telebirr',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onSecondaryFixed,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.outlineVariant, height: 1),
                    const SizedBox(height: 16),

                    // Stats Grid (Distance, Duration, Service)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('Distance', '8.2 km'),
                        Container(
                          width: 1,
                          height: 32,
                          color: AppColors.outlineVariant,
                        ),
                        _buildStatItem('Duration', '24 min'),
                        Container(
                          width: 1,
                          height: 32,
                          color: AppColors.outlineVariant,
                        ),
                        _buildStatItem('Ride', rideOption.title),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Rate Driver CTA
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RateDriverScreen(
                        driver: driver,
                        rideOption: rideOption,
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rounded, size: 20),
                    SizedBox(width: 8),
                    Text('Rate Driver & Tip'),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // View Receipt button
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TripReceiptScreen(
                        driver: driver,
                        rideOption: rideOption,
                        pickup: pickup,
                        destination: destination,
                      ),
                    ),
                  );
                },
                child: const Text('View Detailed Receipt'),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTypography.bodyMdMedium.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
