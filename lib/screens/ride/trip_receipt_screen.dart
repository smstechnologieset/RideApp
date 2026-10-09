import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/models/ride_models.dart';
import '../home/main_shell_screen.dart';

class TripReceiptScreen extends StatelessWidget {
  final DriverInfo driver;
  final RideOption rideOption;
  final String pickup;
  final String destination;

  const TripReceiptScreen({
    super.key,
    this.driver = DriverInfo.defaultDriver,
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Trip Receipt',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // Styled Paper Receipt Card
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Receipt Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Z',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'ZemenGo Ride',
                              style: AppTypography.headlineSm.copyWith(
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tertiary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'PAID',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.tertiary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),
                    Text(
                      'Trip ID: #ZG-AA-84920',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.outline,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      'Date: Oct 9, 2026 • 04:15 PM (Addis Ababa)',
                      style: AppTypography.labelMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 18),
                    const Divider(color: AppColors.outlineVariant, height: 1),
                    const SizedBox(height: 18),

                    // Route Points
                    _buildRouteRow(
                      dotColor: AppColors.tertiary,
                      label: 'PICKUP',
                      address: pickup,
                    ),
                    const SizedBox(height: 12),
                    _buildRouteRow(
                      dotColor: AppColors.primary,
                      label: 'DROP-OFF',
                      address: destination,
                    ),

                    const SizedBox(height: 18),
                    const Divider(color: AppColors.outlineVariant, height: 1),
                    const SizedBox(height: 18),

                    // Itemized Fare Breakdown
                    _buildInvoiceRow('Base Fare', '80.00 ETB'),
                    const SizedBox(height: 8),
                    _buildInvoiceRow('Distance (8.2 km)', '70.00 ETB'),
                    const SizedBox(height: 8),
                    _buildInvoiceRow('Duration (24 mins)', '35.00 ETB'),
                    const SizedBox(height: 8),
                    _buildInvoiceRow(
                      'Promo: TASTEET (-20%)',
                      '-37.00 ETB',
                      valueColor: AppColors.tertiary,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.outlineVariant, height: 1),
                    const SizedBox(height: 16),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: AppTypography.headlineSm.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '148.00 ETB',
                          style: AppTypography.headlineLg.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Telebirr Transaction Card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: AppColors.secondary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paid via Telebirr SuperApp',
                                  style: AppTypography.bodyMdMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'TXN9823487219 • Telebirr Ref: 48928',
                                  style: AppTypography.labelSm.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
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

              const SizedBox(height: 24),

              // Action Buttons
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Receipt downloaded to device storage.')),
                  );
                },
                icon: const Icon(Icons.download_rounded, size: 20),
                label: const Text('Download PDF Receipt'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainShellScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRouteRow({
    required Color dotColor,
    required String label,
    required String address,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.outline,
                  fontSize: 10,
                ),
              ),
              Text(
                address,
                style: AppTypography.bodyMdMedium.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMd.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMdMedium.copyWith(
            color: valueColor ?? AppColors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
