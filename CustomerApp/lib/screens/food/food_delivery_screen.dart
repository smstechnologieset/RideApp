import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/demo_notice.dart';
import '../../widgets/app_artwork.dart';

class FoodDeliveryScreen extends StatefulWidget {
  const FoodDeliveryScreen({super.key});
  @override
  State<FoodDeliveryScreen> createState() => _FoodDeliveryScreenState();
}

class _FoodDeliveryScreenState extends State<FoodDeliveryScreen> {
  String _category = 'All', _query = '';
  final _favorites = <String>{};
  static const _restaurants = [
    (
      name: 'Kategna Restaurant',
      category: 'Habesha',
      subtitle: 'Traditional Ethiopian · Bole Atlas',
      image: AppArtwork.habesha,
      items: [
        'Beyaynetu · 280 ETB',
        'Special tibs · 420 ETB',
        'Shiro · 190 ETB',
      ],
    ),
    (
      name: 'Tomoca Coffee',
      category: 'Coffee',
      subtitle: 'Coffee & pastries · Sarbet',
      image: AppArtwork.coffee,
      items: [
        'Macchiato · 90 ETB',
        'Ethiopian coffee · 70 ETB',
        'Croissant · 150 ETB',
      ],
    ),
    (
      name: 'Savor Addis',
      category: 'Continental',
      subtitle: 'Pizza & grills · Bole Rwanda',
      image: AppArtwork.pizza,
      items: [
        'Margherita pizza · 390 ETB',
        'Grilled chicken · 480 ETB',
        'Fresh juice · 140 ETB',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final restaurants = _restaurants
        .where(
          (r) =>
              (_category == 'All' || r.category == _category) &&
              '${r.name} ${r.subtitle} ${r.items.join(' ')}'
                  .toLowerCase()
                  .contains(_query.toLowerCase()),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Food preview')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const DemoNotice(
              text:
                  'Upcoming service · Sample restaurants, menus and prices. Ordering is not active.',
            ),
            const SizedBox(height: 24),
            Text(
              'A taste of Addis.',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            const Text(
              'From a morning macchiato to your favorite tibs.',
              style: TextStyle(color: AppColors.outline, height: 1.5),
            ),
            const SizedBox(height: 22),
            TextField(
              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                hintText: 'Search food or restaurants',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                for (final category in [
                  'All',
                  'Habesha',
                  'Coffee',
                  'Continental',
                ])
                  ChoiceChip(
                    label: Text(category),
                    selected: _category == category,
                    onSelected: (_) => setState(() => _category = category),
                  ),
              ],
            ),
            const SizedBox(height: 22),
            if (restaurants.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text('No sample restaurants match that search.'),
              ),
            for (final restaurant in restaurants)
              Card(
                margin: const EdgeInsets.only(bottom: 18),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (sheet) => SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: AppPhoto(
                                restaurant.image,
                                height: 160,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const DemoNotice(
                              text:
                                  'Menu preview · Sample prices. Cart, checkout and restaurant acceptance are planned for a later phase.',
                            ),
                            const SizedBox(height: 16),
                            for (final item in restaurant.items)
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(item),
                              ),
                            const SizedBox(height: 16),
                            OutlinedButton(
                              onPressed: () => Navigator.pop(sheet),
                              child: const Text('Back to restaurants'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 174,
                        color: AppColors.surfaceContainerLow,
                        child: Stack(
                          children: [
                            Positioned.fill(child: AppPhoto(restaurant.image)),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: IconButton(
                                tooltip: 'Favorite restaurant',
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white.withValues(
                                    alpha: .96,
                                  ),
                                ),
                                onPressed: () => setState(() {
                                  if (!_favorites.add(restaurant.name)) {
                                    _favorites.remove(restaurant.name);
                                  }
                                }),
                                icon: Icon(
                                  _favorites.contains(restaurant.name)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              restaurant.subtitle,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.outline,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Row(
                              children: [
                                Text(
                                  'Explore sample menu',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
