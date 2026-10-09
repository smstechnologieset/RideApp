import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/models/ride_models.dart';
import '../ride/trip_receipt_screen.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  int _selectedTab = 0; // 0: All, 1: Completed, 2: Packages

  final List<TripRecord> _trips = const [
    TripRecord(
      id: 'ZG-84920',
      pickup: 'Bole Bulbula, Gate 2',
      destination: 'Piassa, Churchill Avenue, Office 402',
      date: 'Today, 04:15 PM',
      fare: 185,
      status: 'Completed',
      rideType: 'Zemen Standard (Toyota Vitz)',
      paymentMethod: 'Telebirr',
    ),
    TripRecord(
      id: 'ZG-79102',
      pickup: 'Sarbet Adams Pavilion',
      destination: 'Kazanchis Inter Luxury Hotel',
      date: 'Oct 7, 10:30 AM',
      fare: 210,
      status: 'Completed',
      rideType: 'Zemen Comfort (Corolla)',
      paymentMethod: 'Telebirr',
    ),
    TripRecord(
      id: 'ZG-64918',
      pickup: 'Bole Medhanealem Mall',
      destination: 'Ayat Zone 3 Commercial Center',
      date: 'Oct 5, 08:45 PM',
      fare: 340,
      status: 'Completed',
      rideType: 'Zemen XL / Van',
      paymentMethod: 'Cash',
    ),
    TripRecord(
      id: 'ZG-51204',
      pickup: 'Meskel Square Exhibition Center',
      destination: 'Merkato Military Tera',
      date: 'Oct 2, 02:15 PM',
      fare: 120,
      status: 'Completed',
      rideType: 'Moto Courier Express',
      paymentMethod: 'Telebirr',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Your Trips & Activity',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filter Pills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                children: [
                  _buildTabChip(0, 'All Activity'),
                  const SizedBox(width: 8),
                  _buildTabChip(1, 'Rides'),
                  const SizedBox(width: 8),
                  _buildTabChip(2, 'Courier & Food'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Trips List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                itemCount: _trips.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final trip = _trips[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TripReceiptScreen(
                            pickup: trip.pickup,
                            destination: trip.destination,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.outlineVariant.withOpacity(0.35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top info: Date + Status + Fare
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                trip.date,
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${trip.fare} ETB',
                                    style: AppTypography.headlineSm.copyWith(
                                      fontSize: 16,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.tertiary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      trip.status,
                                      style: AppTypography.labelSm.copyWith(
                                        color: AppColors.tertiary,
                                        fontSize: 9.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Route Waypoints
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: const BoxDecoration(
                                      color: AppColors.tertiary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: 1.5,
                                    height: 14,
                                    color: AppColors.outlineVariant,
                                  ),
                                  Container(
                                    width: 7,
                                    height: 7,
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
                                      trip.pickup,
                                      style: AppTypography.labelSm.copyWith(
                                        color: AppColors.onSurface,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      trip.destination,
                                      style: AppTypography.bodyMdMedium.copyWith(
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

                          const SizedBox(height: 12),
                          const Divider(
                            color: AppColors.outlineVariant,
                            height: 1,
                          ),
                          const SizedBox(height: 10),

                          // Vehicle and Receipt link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${trip.rideType} • ${trip.paymentMethod}',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 10.5,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'View Receipt',
                                    style: AppTypography.labelSm.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    size: 14,
                                    color: AppColors.primary,
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }

  Widget _buildTabChip(int index, String label) {
    final isSelected = _selectedTab == index;
    return InkWell(
      onTap: () => setState(() => _selectedTab = index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: isSelected ? Colors.white : AppColors.onSurface,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
