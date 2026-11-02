import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/app_artwork.dart';
import 'phone_login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pages = PageController();
  int _index = 0;
  static const _slides = [
    (
      image: AppArtwork.city,
      fit: BoxFit.cover,
      badge: 'ZEMEN RIDE',
      title: 'Move with confidence\nin Addis Ababa',
      subtitle:
          'Explore the customer ride journey with live maps, upfront demo fares and simulated driver activity.',
    ),
    (
      image: AppArtwork.parcel,
      fit: BoxFit.contain,
      badge: 'PACKAGE PREVIEW',
      title: 'Small packages.\nEndless possibilities.',
      subtitle:
          'Explore document and parcel booking across Addis Ababa. Courier dispatch comes in a later phase.',
    ),
    (
      image: AppArtwork.habesha,
      fit: BoxFit.cover,
      badge: 'FOOD PREVIEW',
      title: 'A taste of Addis,\ncloser to you.',
      subtitle:
          'Discover sample restaurants and menus, from traditional favourites to a fresh macchiato. Ordering comes in a later phase.',
    ),
  ];

  void _login() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
  );
  void _next() {
    if (_index == _slides.length - 1) {
      _login();
    } else {
      _pages.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      automaticallyImplyLeading: false,
      actions: [
        TextButton(onPressed: _login, child: const Text('Skip')),
        const SizedBox(width: 8),
      ],
    ),
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pages,
              itemCount: _slides.length,
              onPageChanged: (value) => setState(() => _index = value),
              itemBuilder: (context, index) {
                final slide = _slides[index];
                return LayoutBuilder(
                  builder: (context, size) => SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: ColoredBox(
                            color: AppColors.primaryFixed,
                            child: AppPhoto(
                              slide.image,
                              width: double.infinity,
                              height: (size.maxHeight * .46).clamp(150, 250),
                              fit: slide.fit,
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          slide.badge,
                          style: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            height: 1.15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -.6,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          slide.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.6,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: index == _index ? 24 : 7,
                      height: 7,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == _index
                            ? AppColors.primary
                            : AppColors.outlineVariant,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: _next,
                  child: Text(
                    _index == _slides.length - 1 ? 'Get Started' : 'Continue',
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
