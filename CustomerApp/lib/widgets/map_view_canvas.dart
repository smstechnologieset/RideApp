import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class MapViewCanvas extends StatefulWidget {
  final bool showRoute;
  final bool showDriverPin;
  final bool showRadar;
  final String pickupLabel;
  final String destinationLabel;
  final double height;
  final VoidCallback? onPinMoved;

  const MapViewCanvas({
    super.key,
    this.showRoute = true,
    this.showDriverPin = true,
    this.showRadar = false,
    this.pickupLabel = 'Bole Bulbula',
    this.destinationLabel = 'Piassa, Churchill Ave',
    this.height = 300,
    this.onPinMoved,
  });

  @override
  State<MapViewCanvas> createState() => _MapViewCanvasState();
}

class _MapViewCanvasState extends State<MapViewCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Background stylized map canvas
          AnimatedBuilder(
            animation: _animController,
            builder: (context, child) {
              return CustomPaint(
                size: Size(double.infinity, widget.height),
                painter: AddisMapPainter(
                  pulseValue: _animController.value,
                  showRoute: widget.showRoute,
                  showDriverPin: widget.showDriverPin,
                  showRadar: widget.showRadar,
                ),
              );
            },
          ),

          // Route info overlay badge (bottom right)
          if (widget.showRoute)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.onSurface.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.alt_route, size: 14, color: AppColors.tertiaryFixed),
                    const SizedBox(width: 5),
                    Text(
                      '8.2 km • 24 min',
                      style: AppTypography.labelSm.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

          // Map Compass & Recenter Controls
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.near_me,
                size: 18,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddisMapPainter extends CustomPainter {
  final double pulseValue;
  final bool showRoute;
  final bool showDriverPin;
  final bool showRadar;

  AddisMapPainter({
    required this.pulseValue,
    required this.showRoute,
    required this.showDriverPin,
    required this.showRadar,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Map Base Land / Blocks
    final landPaint = Paint()..color = const Color(0xFFF1F4F9);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), landPaint);

    // Green areas (Addis Parks like Friendship Park, Unity Park)
    final parkPaint = Paint()..color = const Color(0xFFE2EEDD);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.1, size.height * 0.15, size.width * 0.25, size.height * 0.2),
        const Radius.circular(16),
      ),
      parkPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.65, size.height * 0.55, size.width * 0.28, size.height * 0.3),
        const Radius.circular(16),
      ),
      parkPaint,
    );

    // 2. City Grid Roads (Secondary)
    final roadPaintSecondary = Paint()
      ..color = const Color(0xFFDEE3ED)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Horizontal roads
    canvas.drawLine(Offset(0, size.height * 0.3), Offset(size.width, size.height * 0.3), roadPaintSecondary);
    canvas.drawLine(Offset(0, size.height * 0.65), Offset(size.width, size.height * 0.65), roadPaintSecondary);

    // Vertical roads
    canvas.drawLine(Offset(size.width * 0.3, 0), Offset(size.width * 0.3, size.height), roadPaintSecondary);
    canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.7, size.height), roadPaintSecondary);

    // Diagonal Avenues (Bole Road & Churchill Ave)
    final mainAvenuePaint = Paint()
      ..color = const Color(0xFFCBD5E1)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final avenuePath = Path()
      ..moveTo(0, size.height * 0.85)
      ..cubicTo(
        size.width * 0.35, size.height * 0.7,
        size.width * 0.6, size.height * 0.4,
        size.width, size.height * 0.2,
      );
    canvas.drawPath(avenuePath, mainAvenuePaint);

    // Points of interest: Bole (Bottom Right-ish), Piassa (Top Left-ish)
    final pickupPoint = Offset(size.width * 0.25, size.height * 0.72);
    final destinationPoint = Offset(size.width * 0.8, size.height * 0.25);

    // 3. Active Route Line (Glowing Royal Blue)
    if (showRoute) {
      final routePath = Path()
        ..moveTo(pickupPoint.dx, pickupPoint.dy)
        ..cubicTo(
          size.width * 0.4, size.height * 0.68,
          size.width * 0.5, size.height * 0.45,
          destinationPoint.dx, destinationPoint.dy,
        );

      // Route Outer Glow / Shadow
      final glowPaint = Paint()
        ..color = AppColors.primaryContainer.withOpacity(0.3)
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawPath(routePath, glowPaint);

      // Route Core Line
      final routePaint = Paint()
        ..color = AppColors.primary
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawPath(routePath, routePaint);
    }

    // 4. Pickup Pin (Green)
    final pickupCirclePaint = Paint()..color = AppColors.tertiary;
    canvas.drawCircle(pickupPoint, 7, pickupCirclePaint);
    canvas.drawCircle(pickupPoint, 3.5, Paint()..color = Colors.white);

    // 5. Destination Pin (Royal Blue)
    final destPinPaint = Paint()..color = AppColors.primary;
    canvas.drawCircle(destinationPoint, 8, destPinPaint);
    canvas.drawCircle(destinationPoint, 4, Paint()..color = Colors.white);

    // 6. Driver Pin with Moving Car or Radar
    if (showDriverPin) {
      final driverPos = Offset(
        size.width * (0.35 + 0.1 * math.sin(pulseValue * 2 * math.pi)),
        size.height * (0.6 - 0.05 * math.cos(pulseValue * 2 * math.pi)),
      );

      // Driver ripple pulse
      final ripplePaint = Paint()
        ..color = AppColors.primaryContainer.withOpacity((1 - pulseValue) * 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(driverPos, 12 + (pulseValue * 18), ripplePaint);

      // Driver badge background
      canvas.drawCircle(driverPos, 14, Paint()..color = Colors.white);
      canvas.drawCircle(driverPos, 12, Paint()..color = AppColors.primaryContainer);

      // Car inner symbol dot
      canvas.drawCircle(driverPos, 5, Paint()..color = Colors.white);
    }

    // 7. Radar Pulse Animation (when searching for drivers)
    if (showRadar) {
      final center = Offset(size.width * 0.5, size.height * 0.5);
      final maxRadius = size.width * 0.4;

      for (int i = 0; i < 3; i++) {
        final currentFraction = (pulseValue + (i / 3.0)) % 1.0;
        final radius = currentFraction * maxRadius;
        final alpha = ((1.0 - currentFraction) * 0.5).clamp(0.0, 1.0);

        final radarCirclePaint = Paint()
          ..color = AppColors.primary.withOpacity(alpha)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;
        canvas.drawCircle(center, radius, radarCirclePaint);
      }

      // Center user ping
      canvas.drawCircle(center, 9, Paint()..color = AppColors.primary);
      canvas.drawCircle(center, 4, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant AddisMapPainter oldDelegate) => true;
}
