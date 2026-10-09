import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../ride/destination_search_screen.dart';
import '../delivery/package_delivery_screen.dart';
import '../food/food_delivery_screen.dart';
import '../driver/driver_hud_screen.dart';

class SuperAppHomeScreen extends StatefulWidget {
  final VoidCallback onOpenDrawer;

  const SuperAppHomeScreen({
    super.key,
    required this.onOpenDrawer,
  });

  @override
  State<SuperAppHomeScreen> createState() => _SuperAppHomeScreenState();
}

class _SuperAppHomeScreenState extends State<SuperAppHomeScreen> {
  String _currentLang = 'EN';

  void _toggleLanguage() {
    setState(() {
      _currentLang = _currentLang == 'EN' ? 'አማ' : 'EN';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo + Location
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Z',
                            style: AppTypography.headlineMd.copyWith(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Zemen',
                                style: AppTypography.headlineSm.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Go',
                                style: AppTypography.headlineSm.copyWith(
                                  color: AppColors.primaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                                color: AppColors.tertiary,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Bole Sub-City, Addis Ababa',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 10.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Actions: Language Toggle + Catalog button
                  Row(
                    children: [
                      // EN | አማ Language Pill
                      InkWell(
                        onTap: _toggleLanguage,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'EN',
                                style: AppTypography.labelSm.copyWith(
                                  color: _currentLang == 'EN'
                                      ? AppColors.primary
                                      : AppColors.onSurfaceVariant,
                                  fontWeight: _currentLang == 'EN'
                                      ? FontWeight.w800
                                      : FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.outlineVariant,
                                ),
                              ),
                              Text(
                                'አማ',
                                style: AppTypography.labelSm.copyWith(
                                  color: _currentLang == 'አማ'
                                      ? AppColors.primary
                                      : AppColors.onSurfaceVariant,
                                  fontWeight: _currentLang == 'አማ'
                                      ? FontWeight.w800
                                      : FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Screen Catalog Drawer Button
                      IconButton(
                        icon: const Icon(Icons.dashboard_customize_rounded),
                        tooltip: 'View All 25 Screens',
                        color: AppColors.primary,
                        onPressed: widget.onOpenDrawer,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Search Bar: "Where to in Addis Ababa?"
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const DestinationSearchScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: AppColors.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Where to in Addis Ababa?',
                          style: AppTypography.bodyLgMedium.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.history_rounded,
                              size: 14,
                              color: AppColors.outline,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Now',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Service Cards Bento Grid
              Row(
                children: [
                  // Ride (Major Card)
                  Expanded(
                    flex: 5,
                    child: _buildServiceCard(
                      title: 'Ride',
                      subtitle: 'Addis cabs & moto',
                      tag: 'FASTEST',
                      tagColor: AppColors.tertiary,
                      icon: Icons.directions_car_filled_rounded,
                      iconColor: AppColors.primary,
                      bgColor: AppColors.primary.withOpacity(0.06),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const DestinationSearchScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Package (Courier)
                  Expanded(
                    flex: 5,
                    child: _buildServiceCard(
                      title: 'Package',
                      subtitle: 'Moto & cargo van',
                      tag: 'EXPRESS',
                      tagColor: AppColors.secondary,
                      icon: Icons.local_shipping_rounded,
                      iconColor: AppColors.secondary,
                      bgColor: AppColors.secondary.withOpacity(0.06),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PackageDeliveryScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Food Delivery
                  Expanded(
                    child: _buildServiceCard(
                      title: 'Food Delivery',
                      subtitle: 'Habesha, burgers, cafe',
                      tag: '20% OFF',
                      tagColor: AppColors.error,
                      icon: Icons.restaurant_rounded,
                      iconColor: AppColors.tertiary,
                      bgColor: AppColors.tertiary.withOpacity(0.06),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const FoodDeliveryScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Driver Mode Switch
                  Expanded(
                    child: _buildServiceCard(
                      title: 'Driver Mode',
                      subtitle: 'Earn today in Addis',
                      tag: 'LIVE HUD',
                      tagColor: AppColors.primaryContainer,
                      icon: Icons.speed_rounded,
                      iconColor: AppColors.primaryContainer,
                      bgColor: AppColors.primaryContainer.withOpacity(0.06),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const DriverHudScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Promotional Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryContainer,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'TELEBIRR PROMO',
                              style: AppTypography.labelSm.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '20% OFF Rides in Bole',
                            style: AppTypography.headlineSm.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Apply code TASTEET at checkout with Telebirr',
                            style: AppTypography.bodyMd.copyWith(
                              color: AppColors.onPrimaryContainer,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_offer_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Quick Places Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Destinations',
                    style: AppTypography.headlineSm.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    'Manage',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Quick Destination Pills
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPlaceChip(
                      icon: Icons.work_rounded,
                      title: 'Work',
                      subtitle: 'Bole Medhanealem',
                    ),
                    const SizedBox(width: 10),
                    _buildPlaceChip(
                      icon: Icons.home_rounded,
                      title: 'Home',
                      subtitle: 'Piassa Churchill',
                    ),
                    const SizedBox(width: 10),
                    _buildPlaceChip(
                      icon: Icons.fitness_center_rounded,
                      title: 'Gym',
                      subtitle: 'Sarbet Gym',
                    ),
                    const SizedBox(width: 10),
                    _buildPlaceChip(
                      icon: Icons.local_airport_rounded,
                      title: 'Airport',
                      subtitle: 'Bole Int. Terminal 2',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Recent Activity Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Trips',
                    style: AppTypography.headlineSm.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    'View all',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              _buildRecentTripCard(
                from: 'Bole Medhanealem Mall',
                to: 'Piassa, Post Office',
                date: 'Yesterday, 4:15 PM',
                price: '185 ETB',
                vehicle: 'Zemen Standard (Toyota Vitz)',
              ),
              const SizedBox(height: 10),
              _buildRecentTripCard(
                from: 'Sarbet Adams Pavilion',
                to: 'Kazanchis Inter Luxury Hotel',
                date: 'Oct 7, 10:30 AM',
                price: '210 ETB',
                vehicle: 'Zemen Comfort (Corolla)',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String subtitle,
    required String tag,
    required Color tagColor,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.outlineVariant.withOpacity(0.35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2.5,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: AppTypography.labelSm.copyWith(
                      color: tagColor,
                      fontSize: 9.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTypography.headlineSm.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: AppTypography.labelMd.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceChip({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const DestinationSearchScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.outlineVariant.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: AppColors.primary),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodyMdMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTripCard({
    required String from,
    required String to,
    required String date,
    required String price,
    required String vehicle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.directions_car_rounded,
              color: AppColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  to,
                  style: AppTypography.bodyMdMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$date • $vehicle',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: AppTypography.headlineSm.copyWith(
                  fontSize: 15,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.tertiary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Rebook',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.tertiary,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
