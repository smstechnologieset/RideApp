import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gebeta_gl/gebeta_gl.dart';
import '../core/services/gebeta_maps_service.dart';
import '../core/theme/app_colors.dart';
import 'app_artwork.dart';

class GebetaMapWidget extends StatefulWidget {
  const GebetaMapWidget({
    super.key,
    this.height = 300,
    this.initialLat = 9.0108,
    this.initialLon = 38.7613,
    this.zoom = 13.5,
    this.showRoute = true,
    this.showDriverPin = true,
    this.showRadar = false,
    this.pickupLabel = 'Bole Bulbula',
    this.destinationLabel = 'Piassa, Churchill Ave',
    this.onMapCreated,
    this.pickupLat = 8.9890,
    this.pickupLon = 38.7903,
    this.destLat = 9.0300,
    this.destLon = 38.7500,
    this.routeCoordinates = const [],
    this.driverProgress = 0,
    this.onPointSelected,
    this.bottomPadding = 38,
    this.recenterToken = 0,
    this.quietMap = true,
  });
  final double height, initialLat, initialLon, zoom;
  final double pickupLat,
      pickupLon,
      destLat,
      destLon,
      driverProgress,
      bottomPadding;
  final bool showRoute, showDriverPin, showRadar, quietMap;
  final int recenterToken;
  final String pickupLabel, destinationLabel;
  final List<List<double>> routeCoordinates;
  final void Function(GebetaMapController)? onMapCreated;
  final void Function(double latitude, double longitude)? onPointSelected;
  @override
  State<GebetaMapWidget> createState() => _GebetaMapWidgetState();
}

class _GebetaMapWidgetState extends State<GebetaMapWidget> {
  GebetaMapController? _controller;
  bool _accessReady = false, _styleReady = false, _annotationsReady = false;
  String? _error, _annotationError;
  int _generation = 0;
  Timer? _loadTimeout, _cameraDebounce;
  Map<String, dynamic> _style = {};
  Symbol? _driver;
  ui.Image? _previewCar;
  Future<void> _drawing = Future.value();

  bool get _native =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  void initState() {
    super.initState();
    if (_native) {
      _prepare();
    } else {
      _preparePreviewCar();
    }
  }

  Future<void> _preparePreviewCar() async {
    final image = await _decodeCarImage();
    if (!mounted) {
      image.dispose();
      return;
    }
    setState(() => _previewCar = image);
  }

  Future<void> _prepare() async {
    _loadTimeout?.cancel();
    final generation = ++_generation;
    setState(() {
      _accessReady = false;
      _styleReady = false;
      _annotationsReady = false;
      _error = null;
      _annotationError = null;
      _driver = null;
    });
    try {
      final style = await GebetaMapsService.checkMapAccess();
      if (!mounted || generation != _generation) return;
      _style = style;
      setState(() => _accessReady = true);
      _loadTimeout = Timer(const Duration(seconds: 25), () {
        if (mounted && !_styleReady) {
          setState(
            () => _error =
                'The map is taking too long to load. Check your connection and retry.',
          );
        }
      });
    } catch (error) {
      if (mounted && generation == _generation) {
        setState(
          () => _error = error is StateError
              ? error.message.toString()
              : 'Could not reach Gebeta Maps. Check your connection and retry.',
        );
      }
    }
  }

  @override
  void didUpdateWidget(covariant GebetaMapWidget old) {
    super.didUpdateWidget(old);
    if (!_styleReady) return;
    final geometryChanged =
        old.routeCoordinates != widget.routeCoordinates ||
        old.pickupLat != widget.pickupLat ||
        old.pickupLon != widget.pickupLon ||
        old.destLat != widget.destLat ||
        old.destLon != widget.destLon ||
        old.showRoute != widget.showRoute;
    if (geometryChanged) _queue(() => _drawRoute());
    if (old.quietMap != widget.quietMap) _queue(_applyStyle);
    if (geometryChanged ||
        old.driverProgress != widget.driverProgress ||
        old.showDriverPin != widget.showDriverPin) {
      _queue(_moveDriver);
    }
    if (geometryChanged ||
        old.recenterToken != widget.recenterToken ||
        (old.bottomPadding - widget.bottomPadding).abs() > 2) {
      _cameraDebounce?.cancel();
      _cameraDebounce = Timer(
        const Duration(milliseconds: 280),
        () => _queue(_fit),
      );
    }
  }

  List<LatLng> get _route => widget.routeCoordinates
      .where((p) => p.length >= 2 && p[0].isFinite && p[1].isFinite)
      .map((p) => LatLng(p[0], p[1]))
      .toList();

  void _queue(Future<void> Function() action) {
    _drawing = _drawing.then((_) async {
      if (!mounted || !_styleReady || _controller == null) return;
      try {
        await action();
      } catch (_) {
        if (mounted) {
          setState(
            () => _annotationError = 'Map overlay unavailable. Tap to retry.',
          );
        }
      }
    });
  }

  Future<void> _applyStyle() async {
    final controller = _controller!;
    // Change only properties valid for each layer type. Keep the provider's
    // sources, layout, labels and attribution; unsupported properties fall back.
    for (final raw in _style['layers'] as List? ?? []) {
      if (!mounted) return;
      final layer = Map<String, dynamic>.from(raw as Map);
      final id = layer['id'] as String;
      final name = id.toLowerCase();
      final sourceLayer = layer['source-layer']?.toString() ?? '';
      final paint = layer['paint'] as Map? ?? {};
      try {
        if (layer['type'] == 'background') {
          await controller.setLayerProperties(
            id,
            const _BackgroundProperties(),
          );
        } else if (layer['type'] == 'fill' && name.contains('building')) {
          await controller.setLayerProperties(
            id,
            const FillLayerProperties(fillColor: '#E3E6DF', fillOpacity: .55),
          );
        } else if (layer['type'] == 'line' &&
            sourceLayer == 'transportation' &&
            !name.contains('rail') &&
            !name.contains('cable') &&
            !name.contains('ferry')) {
          final casing = name.contains('casing') || name.contains('case');
          await controller.setLayerProperties(
            id,
            LineLayerProperties(
              lineColor: casing
                  ? '#DDE1D8'
                  : name.contains('motorway')
                  ? '#F4EAD5'
                  : '#FFFFFF',
            ),
          );
        } else if (layer['type'] == 'symbol' &&
            (sourceLayer == 'poi' || name.contains('housenumber'))) {
          await controller.setLayerProperties(
            id,
            SymbolLayerProperties(
              textOpacity: widget.quietMap ? 0 : (paint['text-opacity'] ?? 1),
              iconOpacity: widget.quietMap ? 0 : (paint['icon-opacity'] ?? 1),
            ),
          );
        } else if (layer['type'] == 'symbol' &&
            sourceLayer == 'place' &&
            (name.contains('suburb') ||
                name.contains('neighbour') ||
                name.contains('quarter'))) {
          await controller.setLayerProperties(
            id,
            SymbolLayerProperties(
              textSize: 11,
              textColor: '#728078',
              textHaloColor: '#F4F5F0',
              textHaloWidth: 1,
              textTransform: 'none',
              textOpacity: widget.quietMap ? .60 : .90,
            ),
          );
        }
      } catch (_) {
        /* Preserve the live base map if this style revision differs. */
      }
    }
  }

  Future<void> _initializeAnnotations() async {
    final controller = _controller!;
    await controller.addImage('zemengo-car', await _markerImage(car: true));
    await controller.addImage(
      'zemengo-destination',
      await _markerImage(car: false),
    );
    await controller.setSymbolIconAllowOverlap(true);
    _annotationsReady = true;
    await _drawRoute();
    await _moveDriver();
    await _fit();
  }

  Future<void> _drawRoute() async {
    if (!_annotationsReady) return;
    final controller = _controller!;
    await controller.clearLines();
    await controller.clearCircles();
    await controller.clearSymbols();
    _driver = null;
    final pickup = LatLng(widget.pickupLat, widget.pickupLon);
    final destination = LatLng(widget.destLat, widget.destLon);
    final route = _route;
    if (widget.showRoute && route.length > 1) {
      await controller.addLine(
        LineOptions(
          geometry: route,
          lineColor: '#FFFFFF',
          lineWidth: 9,
          lineOpacity: .95,
        ),
      );
      await controller.addLine(
        LineOptions(
          geometry: route,
          lineColor: '#1B50EB',
          lineWidth: 5,
          lineOpacity: 1,
        ),
      );
    }
    await controller.addCircle(
      CircleOptions(
        geometry: pickup,
        circleColor: '#42EBA8',
        circleRadius: 8,
        circleStrokeColor: '#FFFFFF',
        circleStrokeWidth: 3,
      ),
    );
    await controller.addCircle(
      CircleOptions(
        geometry: pickup,
        circleColor: '#155A42',
        circleRadius: 2.5,
      ),
    );
    if (widget.showRoute) {
      if (widget.height < 400 && widget.bottomPadding <= 80) {
        await controller.addCircle(
          CircleOptions(
            geometry: destination,
            circleColor: '#1B50EB',
            circleRadius: 7,
            circleStrokeColor: '#FFFFFF',
            circleStrokeWidth: 3,
          ),
        );
      } else {
        await controller.addSymbol(
          SymbolOptions(
            geometry: destination,
            iconImage: 'zemengo-destination',
            iconSize: .7,
            iconAnchor: 'bottom',
            zIndex: 2,
          ),
        );
      }
    }
    if (mounted && _annotationError != null) {
      setState(() => _annotationError = null);
    }
  }

  Future<void> _moveDriver() async {
    if (!_annotationsReady) return;
    final controller = _controller!;
    if (!widget.showDriverPin) {
      if (_driver != null) await controller.removeSymbol(_driver!);
      _driver = null;
      return;
    }
    final route = _route;
    final points = route.length > 1
        ? route
        : [
            LatLng(widget.pickupLat, widget.pickupLon),
            LatLng(widget.destLat, widget.destLon),
          ];
    final pose = routePose(points, widget.driverProgress);
    final options = SymbolOptions(
      geometry: pose.$1,
      iconImage: 'zemengo-car',
      iconSize: .62,
      iconRotate: pose.$2,
      iconAnchor: 'center',
      zIndex: 3,
    );
    if (_driver == null) {
      _driver = await controller.addSymbol(options);
    } else {
      await controller.updateSymbol(_driver!, options);
    }
  }

  Future<void> _fit() async {
    final controller = _controller!;
    if (!widget.showRoute) {
      await controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(widget.pickupLat, widget.pickupLon)),
      );
      return;
    }
    final points = [
      LatLng(widget.pickupLat, widget.pickupLon),
      ..._route,
      LatLng(widget.destLat, widget.destLon),
    ];
    final latitudes = points.map((p) => p.latitude);
    final longitudes = points.map((p) => p.longitude);
    final minLat = latitudes.reduce(math.min),
        maxLat = latitudes.reduce(math.max);
    final minLon = longitudes.reduce(math.min),
        maxLon = longitudes.reduce(math.max);
    final insets = gebetaRouteInsets(
      height: widget.height,
      bottomPadding: widget.bottomPadding,
      safeTop: MediaQuery.paddingOf(context).top,
    );
    await controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat - .0002, minLon - .0002),
          northeast: LatLng(maxLat + .0002, maxLon + .0002),
        ),
        left: insets.left,
        right: insets.right,
        top: insets.top,
        bottom: insets.bottom,
      ),
    );
  }

  @override
  void dispose() {
    _loadTimeout?.cancel();
    _cameraDebounce?.cancel();
    _previewCar?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.height,
    width: double.infinity,
    child: Stack(
      fit: StackFit.expand,
      children: [
        if (!_native)
          GestureDetector(
            onTapUp: widget.onPointSelected == null
                ? null
                : (details) {
                    // Desktop is a visual preview, never a substitute for native map selection.
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(
                        content: Text('Choose a live map point on Android.'),
                      ),
                    );
                  },
            child: CustomPaint(
              painter: _MapPreviewPainter(
                showRoute: widget.showRoute,
                driver: widget.showDriverPin,
                progress: widget.driverProgress,
                bottom: widget.bottomPadding,
                carImage: _previewCar,
              ),
            ),
          )
        else if (_accessReady && _error == null)
          GebetaMap(
            key: ValueKey(_generation),
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.initialLat, widget.initialLon),
              zoom: widget.zoom,
            ),
            styleString: GebetaMapsService.standardStyleUrl,
            apiKey: GebetaMapsService.effectiveKey,
            compassEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            myLocationEnabled: false,
            logoViewMargins: math.Point(12, widget.bottomPadding + 66),
            attributionButtonPosition: AttributionButtonPosition.topRight,
            attributionButtonMargins: math.Point(
              12,
              MediaQuery.paddingOf(context).top + 12,
            ),
            onMapCreated: (controller) {
              _controller = controller;
              widget.onMapCreated?.call(controller);
            },
            onStyleLoadedCallback: () {
              _loadTimeout?.cancel();
              if (!mounted) return;
              setState(() => _styleReady = true);
              _queue(_initializeAnnotations);
              _queue(_applyStyle);
            },
            onMapClick: (_, point) =>
                widget.onPointSelected?.call(point.latitude, point.longitude),
          ),
        if (_native && !_styleReady && _error == null)
          const ColoredBox(
            color: AppColors.surfaceContainerLow,
            child: Align(
              alignment: Alignment(0, -.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(strokeWidth: 2),
                  SizedBox(height: 12),
                  Text('Loading Gebeta map…'),
                ],
              ),
            ),
          ),
        if (_error != null)
          ColoredBox(
            color: AppColors.surfaceContainerLow,
            child: Align(
              alignment: const Alignment(0, -.6),
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.wifi_off_rounded,
                      color: AppColors.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13),
                    ),
                    TextButton.icon(
                      onPressed: _prepare,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry map'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (!_native)
          Positioned(
            top: MediaQuery.paddingOf(context).top + 14,
            left: 16,
            child: IgnorePointer(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .94),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Map preview · Live on Android',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        if (_annotationError != null)
          Positioned(
            top: MediaQuery.paddingOf(context).top + 55,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {
                  _queue(_initializeAnnotations);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _annotationError!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

/// Native bounds fitting needs some free viewport after reserving UI space.
/// Embedded preview cards have no ride sheet and use a smaller marker/padding.
EdgeInsets gebetaRouteInsets({
  required double height,
  required double bottomPadding,
  required double safeTop,
}) {
  final compact = height < 400 && bottomPadding <= 80;
  final top = compact
      ? math.min(56.0, height * .4)
      : math.min(safeTop + 72, height * .25);
  final requestedBottom = compact
      ? 24.0
      : math.min(bottomPadding + 76, height * .78);
  final bottom = math.min(
    requestedBottom,
    math.max(12.0, height - top - math.min(80.0, height * .4)),
  );
  return EdgeInsets.fromLTRB(36, top, 36, bottom);
}

/// Interpolate by segment distance, so dense route vertices do not slow the car.
(LatLng, double) routePose(List<LatLng> points, double progress) {
  if (points.length < 2) return (points.first, 0);
  final lengths = <double>[];
  for (var i = 1; i < points.length; i++) {
    final a = points[i - 1], b = points[i];
    lengths.add(
      math.sqrt(
        math.pow(b.latitude - a.latitude, 2) +
            math.pow(
              (b.longitude - a.longitude) *
                  math.cos(a.latitude * math.pi / 180),
              2,
            ),
      ),
    );
  }
  var remaining =
      lengths.fold<double>(0, (a, b) => a + b) * progress.clamp(0, 1);
  var index = 0;
  while (index < lengths.length - 1 && remaining > lengths[index]) {
    remaining -= lengths[index];
    index++;
  }
  final a = points[index], b = points[index + 1];
  final fraction = lengths[index] == 0
      ? 0.0
      : (remaining / lengths[index]).clamp(0.0, 1.0);
  final angle =
      math.atan2(
        (b.longitude - a.longitude) * math.cos(a.latitude * math.pi / 180),
        b.latitude - a.latitude,
      ) *
      180 /
      math.pi;
  return (
    LatLng(
      a.latitude + (b.latitude - a.latitude) * fraction,
      a.longitude + (b.longitude - a.longitude) * fraction,
    ),
    angle,
  );
}

Future<ui.Image> _decodeCarImage() async {
  final data = await rootBundle.load(AppArtwork.mapCar);
  final codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetWidth: 64,
  );
  final frame = await codec.getNextFrame();
  codec.dispose();
  return frame.image;
}

Future<Uint8List> _markerImage({required bool car}) async {
  if (car) {
    final image = await _decodeCarImage();
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return bytes!.buffer.asUint8List();
  }
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawCircle(const Offset(32, 76), 7, Paint()..color = Colors.white);
  canvas.drawLine(
    const Offset(32, 20),
    const Offset(32, 76),
    Paint()
      ..color = const Color(0xFF17232B)
      ..strokeWidth = 5,
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(19, 3, 45, 36),
      const Radius.circular(10),
    ),
    Paint()..color = Colors.white,
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(22, 6, 39, 30),
      const Radius.circular(8),
    ),
    Paint()..color = const Color(0xFF17232B),
  );
  for (var y = 0; y < 3; y++) {
    for (var x = 0; x < 4; x++) {
      if ((x + y).isEven) {
        canvas.drawRect(
          Rect.fromLTWH(28 + x * 7, 11 + y * 7, 7, 7),
          Paint()..color = Colors.white,
        );
      }
    }
  }
  final picture = recorder.endRecording();
  final image = await picture.toImage(80, 84);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  picture.dispose();
  return bytes!.buffer.asUint8List();
}

class _BackgroundProperties implements LayerProperties {
  const _BackgroundProperties();
  @override
  Map<String, dynamic> toJson() => {'background-color': '#F4F5F0'};
}

class _MapPreviewPainter extends CustomPainter {
  _MapPreviewPainter({
    required this.showRoute,
    required this.driver,
    required this.progress,
    required this.bottom,
    this.carImage,
  });
  final bool showRoute, driver;
  final double progress, bottom;
  final ui.Image? carImage;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(const Color(0xFFF0F2EB), BlendMode.srcOver);
    final area = math.max(160.0, size.height - bottom);
    final road = Paint()
      ..color = Colors.white
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke;
    for (var i = -3; i < 10; i++) {
      canvas.drawLine(
        Offset(i * 67, 0),
        Offset(i * 67 + 150, size.height),
        road,
      );
      canvas.drawLine(
        Offset(0, i * 100),
        Offset(size.width, i * 100 + 110),
        road,
      );
    }
    canvas.drawOval(
      Rect.fromLTWH(size.width * .60, area * .15, 160, 130),
      Paint()..color = const Color(0xFFE0EAD7),
    );
    final start = Offset(size.width * .25, area * .72),
        end = Offset(size.width * .70, area * .28);
    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(start.dx + 40, start.dy - 80)
      ..lineTo(end.dx - 40, end.dy + 35)
      ..lineTo(end.dx, end.dy);
    if (showRoute) {
      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.white
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round,
      );
      canvas.drawPath(
        path,
        Paint()
          ..color = AppColors.primary
          ..strokeWidth = 5
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round,
      );
      canvas.drawCircle(end, 8, Paint()..color = AppColors.onSurface);
    }
    canvas.drawCircle(start, 10, Paint()..color = Colors.white);
    canvas.drawCircle(start, 7, Paint()..color = const Color(0xFF42EBA8));
    if (showRoute && driver) {
      final metric = path.computeMetrics().first;
      final tangent = metric.getTangentForOffset(
        metric.length * progress.clamp(0, 1),
      );
      if (tangent != null) {
        canvas.save();
        canvas.translate(tangent.position.dx, tangent.position.dy);
        canvas.rotate(tangent.angle + math.pi / 2);
        if (carImage != null) {
          canvas.drawImageRect(
            carImage!,
            Rect.fromLTWH(
              0,
              0,
              carImage!.width.toDouble(),
              carImage!.height.toDouble(),
            ),
            const Rect.fromLTWH(-14, -18, 28, 36),
            Paint()..filterQuality = FilterQuality.high,
          );
        }
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(_MapPreviewPainter old) =>
      old.carImage != carImage ||
      old.progress != progress ||
      old.bottom != bottom ||
      old.showRoute != showRoute ||
      old.driver != driver;
}
