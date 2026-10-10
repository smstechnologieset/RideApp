import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gebeta_gl/gebeta_gl.dart';
import '../core/services/gebeta_maps_service.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import 'map_view_canvas.dart';

class GebetaMapWidget extends StatefulWidget {
  final double height;
  final double initialLat;
  final double initialLon;
  final double zoom;
  final bool showRoute;
  final bool showDriverPin;
  final bool showRadar;
  final String pickupLabel;
  final String destinationLabel;
  final void Function(GebetaMapController controller)? onMapCreated;

  const GebetaMapWidget({
    super.key,
    this.height = 300,
    this.initialLat = 9.0108, // Addis Ababa center
    this.initialLon = 38.7613,
    this.zoom = 13.5,
    this.showRoute = true,
    this.showDriverPin = true,
    this.showRadar = false,
    this.pickupLabel = 'Bole Bulbula',
    this.destinationLabel = 'Piassa, Churchill Ave',
    this.onMapCreated,
  });

  @override
  State<GebetaMapWidget> createState() => _GebetaMapWidgetState();
}

class _GebetaMapWidgetState extends State<GebetaMapWidget> {
  bool get _isGlSupported {
    // gebeta_gl supports Android, iOS, and Web. Desktop platforms use fallback canvas.
    return !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          // If platform is Android or iOS, render native GebetaMap
          if (_isGlSupported)
            GebetaMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.initialLat, widget.initialLon),
                zoom: widget.zoom,
              ),
              styleString: GebetaMapsService.standardStyleUrl,
              compassEnabled: true,
              myLocationEnabled: true,
              onMapCreated: widget.onMapCreated,
            )
          else
            // High-fidelity fallback with Gebeta live route rendering
            MapViewCanvas(
              height: widget.height,
              showRoute: widget.showRoute,
              showDriverPin: widget.showDriverPin,
              showRadar: widget.showRadar,
              pickupLabel: widget.pickupLabel,
              destinationLabel: widget.destinationLabel,
            ),

          // Gebeta Maps Official Watermark Badge
          Positioned(
            bottom: 8,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.tertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Gebeta Maps • Addis Ababa',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurface,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
