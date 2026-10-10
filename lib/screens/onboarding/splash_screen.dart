import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Auto-advance after 2.2 seconds
    _timer = Timer(const Duration(milliseconds: 2200), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const OnboardingScreen(),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Ambient Glow Background
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryContainer.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary.withOpacity(0.4),
              ),
            ),
          ),

          // Central Branding
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App Logo Badge
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: AppTypography.displayLg.copyWith(
                              fontSize: 48,
                              color: AppColors.primary,
                            ),
                            children: const [
                              TextSpan(text: 'Z'),
                              TextSpan(
                                text: '•',
                                style: TextStyle(color: AppColors.tertiaryFixedDim),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // App Title
                    RichText(
                      text: TextSpan(
                        style: AppTypography.displayLg.copyWith(
                          fontSize: 34,
                          color: Colors.white,
                          letterSpacing: -1,
                        ),
                        children: const [
                          TextSpan(text: 'Zemen'),
                          TextSpan(
                            text: 'Go',
                            style: TextStyle(
                              color: AppColors.tertiaryFixed,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Slogan / Ethiopian Subtitle
                    Text(
                      'Ride • Courier • Food • Addis Ababa',
                      style: AppTypography.bodyMdMedium.copyWith(
                        color: AppColors.onPrimaryContainer,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Footer / Country Flag Accent
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 14, height: 4, decoration: BoxDecoration(color: AppColors.ethiopianGreen, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(width: 4),
                    Container(width: 14, height: 4, decoration: BoxDecoration(color: AppColors.ethiopianYellow, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(width: 4),
                    Container(width: 14, height: 4, decoration: BoxDecoration(color: AppColors.ethiopianRed, borderRadius: BorderRadius.circular(2))),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Powered by Gebeta Maps & Telebirr',
                  style: AppTypography.labelSm.copyWith(
                    color: Colors.white.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
