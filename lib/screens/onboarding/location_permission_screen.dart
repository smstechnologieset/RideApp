import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/map_view_canvas.dart';
import '../home/main_shell_screen.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  void _proceedToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShellScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const Spacer(),

              // Stylized Map Graphic
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: const MapViewCanvas(
                  height: 220,
                  showRoute: true,
                  showDriverPin: true,
                ),
              ),

              const SizedBox(height: 36),

              // Title
              Text(
                'Enable precise location\nfor accurate pickups',
                textAlign: TextAlign.center,
                style: AppTypography.displayLgMobile.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                'ZemenGo uses your GPS to find nearby drivers in Addis Ababa and provide exact ETA estimates for Bole, Piassa, and your destination.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Allow Button
              ElevatedButton(
                onPressed: () => _proceedToHome(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.near_me_rounded, size: 20),
                    SizedBox(width: 8),
                    Text('Allow While Using App'),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Manual fallback
              TextButton(
                onPressed: () => _proceedToHome(context),
                child: Text(
                  'Set Location Later (Manual)',
                  style: AppTypography.bodyMdMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
