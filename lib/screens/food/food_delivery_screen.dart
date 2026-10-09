import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/models/ride_models.dart';

class FoodDeliveryScreen extends StatefulWidget {
  const FoodDeliveryScreen({super.key});

  @override
  State<FoodDeliveryScreen> createState() => _FoodDeliveryScreenState();
}

class _FoodDeliveryScreenState extends State<FoodDeliveryScreen> {
  String _selectedCuisine = 'Habesha';
  final Set<String> _favorites = {'kategna'};

  final List<RestaurantItem> _restaurants = const [
    RestaurantItem(
      id: 'kategna',
      name: 'Kategna Restaurant',
      cuisine: 'Traditional Ethiopian • Special Beyaynetu • Tibs',
      rating: 4.8,
      reviewsCount: 850,
      deliveryTime: '25-35 min',
      deliveryFee: 65,
      location: 'Bole Atlas, Addis Ababa',
      promoBadge: 'Free delivery > 500 ETB',
      isTopRated: true,
    ),
    RestaurantItem(
      id: 'tomoca',
      name: 'Tomoca Coffee Roastery',
      cuisine: 'Specialty Ethiopian Coffee • Pastries & Croissant',
      rating: 4.9,
      reviewsCount: 1420,
      deliveryTime: '15-20 min',
      deliveryFee: 50,
      location: 'Sarbet, Addis Ababa',
      promoBadge: 'Lightning Fast',
    ),
    RestaurantItem(
      id: 'savor',
      name: 'Savor Addis',
      cuisine: 'Continental • Wood-fired Pizza • Steak',
      rating: 4.7,
      reviewsCount: 520,
      deliveryTime: '30-45 min',
      deliveryFee: 80,
      location: 'Bole Rwanda, Addis Ababa',
      promoBadge: 'Popular in Bole',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Food Delivery & Dining',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Live Delivery Availability Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.secondaryFixed,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.two_wheeler_rounded,
                      color: AppColors.secondary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Fast moto-courier tracking available across Addis',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onSecondaryFixed,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.secondary,
                      size: 18,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Search & Filter Bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search injera, tibs, burgers, coffee...',
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: AppColors.outline,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.tune_rounded,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Cuisine & Category Carousel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Cuisines',
                    style: AppTypography.headlineSm.copyWith(fontSize: 18),
                  ),
                  Text(
                    'See All',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCuisineItem('Habesha', Icons.restaurant_rounded),
                    const SizedBox(width: 12),
                    _buildCuisineItem('Burgers', Icons.lunch_dining_rounded),
                    const SizedBox(width: 12),
                    _buildCuisineItem('Coffee & Cafe', Icons.coffee_rounded),
                    const SizedBox(width: 12),
                    _buildCuisineItem('Pizza & Pasta', Icons.local_pizza_rounded),
                    const SizedBox(width: 12),
                    _buildCuisineItem('Fresh Juices', Icons.local_drink_rounded),
                    const SizedBox(width: 12),
                    _buildCuisineItem('Bakery', Icons.bakery_dining_rounded),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Promo Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryContainer,
                      AppColors.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
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
                              color: AppColors.secondaryFixed,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'TASTE OF ADDIS',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.onSecondaryFixed,
                                fontSize: 9.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '20% OFF in Bole',
                            style: AppTypography.headlineSm.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Enjoy signature dining at top Bole locations with code TASTEET',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Popular Restaurants
              Text(
                'Popular Restaurants in Addis',
                style: AppTypography.headlineSm.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                'Beloved culinary spots in Bole, Sarbet, and Piassa',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 14),

              // Restaurant Cards List
              ..._restaurants.map((rest) {
                final isFav = _favorites.contains(rest.id);
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card Banner / Image Placeholder
                      Container(
                        height: 140,
                        width: double.infinity,
                        color: AppColors.surfaceContainerHigh,
                        child: Stack(
                          children: [
                            // Abstract foodie graphic
                            Center(
                              child: Icon(
                                Icons.restaurant_menu_rounded,
                                size: 54,
                                color: AppColors.primary.withOpacity(0.2),
                              ),
                            ),
                            // Top Badges
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryContainer,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${rest.rating}',
                                          style: AppTypography.labelSm.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.tertiaryFixed,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      rest.promoBadge,
                                      style: AppTypography.labelSm.copyWith(
                                        color: AppColors.onTertiaryFixed,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Favorite Button
                            Positioned(
                              top: 12,
                              right: 12,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isFav) {
                                      _favorites.remove(rest.id);
                                    } else {
                                      _favorites.add(rest.id);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.85),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isFav
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_outline_rounded,
                                    color: isFav ? AppColors.error : AppColors.outline,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            // Bottom Delivery Time & Fee
                            Positioned(
                              bottom: 10,
                              left: 12,
                              right: 12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.65),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.schedule_rounded,
                                          color: AppColors.tertiaryFixed,
                                          size: 13,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          rest.deliveryTime,
                                          style: AppTypography.labelSm.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.65),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.moped_rounded,
                                          color: AppColors.secondaryContainer,
                                          size: 13,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${rest.deliveryFee} ETB',
                                          style: AppTypography.labelSm.copyWith(
                                            color: Colors.white,
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

                      // Card Content
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rest.name,
                              style: AppTypography.headlineSm.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              rest.cuisine,
                              style: AppTypography.labelMd.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  size: 13,
                                  color: AppColors.outline,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  rest.location,
                                  style: AppTypography.labelSm.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCuisineItem(String name, IconData icon) {
    final isSelected = _selectedCuisine == name;
    return InkWell(
      onTap: () => setState(() => _selectedCuisine = name),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryContainer
                  : AppColors.surfaceContainerLow,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: AppTypography.labelSm.copyWith(
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
