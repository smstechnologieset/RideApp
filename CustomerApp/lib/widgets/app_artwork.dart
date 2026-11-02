import 'package:flutter/material.dart';

/// Original generated demo imagery, bundled so it never needs an image server.
class AppArtwork {
  static const standard = 'assets/images/vehicles/standard.webp';
  static const comfort = 'assets/images/vehicles/comfort.webp';
  static const xl = 'assets/images/vehicles/xl.webp';
  static const moto = 'assets/images/vehicles/moto.webp';
  static const mapCar = 'assets/images/vehicles/map_car.png';
  static const habesha = 'assets/images/food/habesha.webp';
  static const coffee = 'assets/images/food/coffee.webp';
  static const pizza = 'assets/images/food/pizza.webp';
  static const parcel = 'assets/images/services/parcel.webp';
  static const city = 'assets/images/places/city.webp';
  static const driver = 'assets/images/people/driver.webp';

  static const all = [
    standard,
    comfort,
    xl,
    moto,
    mapCar,
    habesha,
    coffee,
    pizza,
    parcel,
    city,
    driver,
  ];
  static String vehicle(String id) => switch (id) {
    'comfort' => comfort,
    'xl' => xl,
    'moto' => moto,
    _ => standard,
  };
}

class AppPhoto extends StatelessWidget {
  const AppPhoto(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.label,
    this.cacheWidth = 960,
  });
  final String asset;
  final double? width, height;
  final BoxFit fit;
  final Alignment alignment;
  final String? label;
  final int cacheWidth;
  @override
  Widget build(BuildContext context) => Image.asset(
    asset,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    cacheWidth: cacheWidth,
    filterQuality: FilterQuality.medium,
    semanticLabel: label,
    excludeFromSemantics: label == null,
  );
}

class CityPromoBanner extends StatelessWidget {
  const CityPromoBanner({super.key});
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(22),
    child: Stack(
      children: [
        const Positioned.fill(
          child: AppPhoto(AppArtwork.city, cacheWidth: 1000),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xCE102023), Color(0x10102023)],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 170),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A little closer.\nTo everywhere.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -.6,
                          height: 1.15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Your next journey across Addis.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          color: Color(0xFFE4EAE9),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
