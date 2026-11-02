import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../widgets/brand_logo.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.nextScreen, this.autoAdvance = true});
  final Widget? nextScreen;
  final bool autoAdvance;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..forward();
  Timer? _timer;
  String? _version;

  @override
  void initState() {
    super.initState();
    _loadVersion();
    if (widget.autoAdvance) {
      _timer = Timer(const Duration(milliseconds: 2600), () {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                widget.nextScreen ?? const OnboardingScreen(),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 350),
          ),
        );
      });
    }
  }

  Future<void> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (mounted) setState(() => _version = info.version);
    } catch (_) {
      // Package metadata is unavailable in some widget-test environments.
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: const Color(0xFF1B50EB),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    child: Scaffold(
      backgroundColor: const Color(0xFF1B50EB),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -.03),
                radius: .9,
                colors: [Color(0xFF3582F5), Color(0xFF1B50EB)],
              ),
            ),
          ),
          CustomPaint(painter: _SplashRings()),
          Align(
            alignment: const Alignment(0, -.14),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: _animation,
                curve: Curves.easeOut,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BrandLogo(size: 94),
                  const SizedBox(height: 24),
                  const Text(
                    'ZemenGo',
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: -.9,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'All Your Needs One Tap',
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 18,
                      letterSpacing: .8,
                      color: Color(0xFFD8E5FF),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2469DF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _ServiceLabel(Icons.directions_car_outlined, 'Ride'),
                        _ServiceDot(),
                        _ServiceLabel(Icons.restaurant_outlined, 'Food'),
                        _ServiceDot(),
                        _ServiceLabel(Icons.inventory_2_outlined, 'Package'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.paddingOf(context).bottom + 28,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  width: 112,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Powered by SMS Technologies',
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    color: Color(0xFFBDCEFF),
                    fontSize: 12,
                    letterSpacing: .4,
                  ),
                ),
                if (_version != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    'v$_version',
                    style: const TextStyle(
                      fontFamily: 'sans-serif',
                      color: Color(0xFF9FBCFF),
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _SplashRings extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * .50);
    final paint = Paint()..style = PaintingStyle.stroke;
    for (var i = 0; i < 3; i++) {
      paint
        ..strokeWidth = i == 0 ? 1.7 : 1
        ..color = Colors.white.withValues(alpha: .12 - i * .035);
      canvas.drawCircle(center, size.width * (.355 + i * .20), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SplashRings oldDelegate) => false;
}

class _ServiceLabel extends StatelessWidget {
  const _ServiceLabel(this.icon, this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 14, color: const Color(0xFF9DE6E8)),
      const SizedBox(width: 4),
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    ],
  );
}

class _ServiceDot extends StatelessWidget {
  const _ServiceDot();
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 11),
    child: Text('•', style: TextStyle(color: Color(0xFF66A2EF))),
  );
}
