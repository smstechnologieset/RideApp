import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../core/models/demo_trip.dart';
import '../core/state/demo_store.dart';
import '../core/theme/app_colors.dart';
import 'gebeta_map_widget.dart';

/// One native map lives under the booking, matching and tracking sheets.
class RideMapScaffold extends StatefulWidget {
  const RideMapScaffold({
    super.key,
    required this.pickup,
    required this.destination,
    required this.children,
    required this.footer,
    required this.onBack,
    this.route = const [],
    this.showDriver = false,
    this.progress = 0,
    this.initialExtent = .53,
    this.sheetLabel = 'Ride options',
  });
  final RidePlace pickup, destination;
  final List<List<double>> route;
  final List<Widget> children;
  final Widget footer;
  final VoidCallback onBack;
  final bool showDriver;
  final double progress, initialExtent;
  final String sheetLabel;
  @override
  State<RideMapScaffold> createState() => _RideMapScaffoldState();
}

class _RideMapScaffoldState extends State<RideMapScaffold> {
  final _sheet = DraggableScrollableController();
  late double _extent = widget.initialExtent;
  double _footerHeight = 100;
  int _recenter = 0;

  @override
  void initState() {
    super.initState();
    _sheet.addListener(_sheetMoved);
  }

  void _sheetMoved() {
    // Flutter can replace a sheet extent during layout. Defer the parent
    // update so that controls/camera padding never rebuild during that layout.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          _sheet.isAttached &&
          (_extent - _sheet.size).abs() > .002) {
        setState(() => _extent = _sheet.size);
      }
    });
  }

  @override
  void didUpdateWidget(covariant RideMapScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sheetLabel != widget.sheetLabel && _sheet.isAttached) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _sheet.isAttached) {
          _sheet.animateTo(
            widget.initialExtent,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _sheet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.surfaceContainerLow,
    body: LayoutBuilder(
      builder: (context, constraints) {
        final top = MediaQuery.paddingOf(context).top + 8;
        final sheetSpace = math.max(
          100.0,
          constraints.maxHeight - _footerHeight - top,
        );
        final covered = _footerHeight + sheetSpace * _extent;
        final showControls =
            _extent < .72 && constraints.maxHeight - covered > top + 90;
        return Stack(
          children: [
            Positioned.fill(
              key: const ValueKey('map_position'),
              child: GebetaMapWidget(
                key: const Key('ride_live_map'),
                height: constraints.maxHeight,
                initialLat: widget.pickup.latitude,
                initialLon: widget.pickup.longitude,
                pickupLat: widget.pickup.latitude,
                pickupLon: widget.pickup.longitude,
                destLat: widget.destination.latitude,
                destLon: widget.destination.longitude,
                pickupLabel: widget.pickup.name,
                destinationLabel: widget.destination.name,
                routeCoordinates: widget.route,
                showDriverPin: widget.showDriver,
                driverProgress: widget.progress,
                bottomPadding: covered,
                recenterToken: _recenter,
                quietMap: DemoScope.of(context).quietMap,
              ),
            ),
            if (showControls) ...[
              Positioned(
                key: const ValueKey('back_position'),
                left: 16,
                bottom: covered + 12,
                child: _mapButton(
                  'Back to home',
                  Icons.arrow_back_rounded,
                  widget.onBack,
                  const Key('ride_back'),
                ),
              ),
              Positioned(
                key: const ValueKey('recenter_position'),
                right: 16,
                bottom: covered + 12,
                child: _mapButton(
                  'Recenter route',
                  Icons.center_focus_strong_rounded,
                  () => setState(() => _recenter++),
                  const Key('recenter_route'),
                ),
              ),
            ],
            Positioned(
              key: const ValueKey('sheet_position'),
              top: top,
              bottom: _footerHeight,
              left: 0,
              right: 0,
              child: DraggableScrollableSheet(
                key: const Key('ride_sheet'),
                controller: _sheet,
                initialChildSize: widget.initialExtent,
                minChildSize: .28,
                maxChildSize: .92,
                snap: true,
                snapSizes: const [.40, .56, .92],
                builder: (context, controller) => Material(
                  color: Colors.white,
                  elevation: 7,
                  shadowColor: const Color(0x18000000),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(26),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CustomScrollView(
                    controller: controller,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Semantics(
                          label: 'Expand or collapse ${widget.sheetLabel}',
                          button: true,
                          child: InkWell(
                            key: const Key('toggle_ride_sheet'),
                            onTap: () => _sheet.animateTo(
                              _extent < .70 ? .92 : widget.initialExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutCubic,
                            ),
                            child: SizedBox(
                              height: 28,
                              child: Center(
                                child: Container(
                                  width: 36,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: AppColors.outlineVariant,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                        sliver: SliverList.list(
                          children: [
                            if (!showControls)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  tooltip: 'Back to home',
                                  onPressed: widget.onBack,
                                  icon: const Icon(Icons.arrow_back_rounded),
                                ),
                              ),
                            ...widget.children,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              key: const ValueKey('footer_position'),
              bottom: 0,
              left: 0,
              right: 0,
              child: _MeasureSize(
                onChange: (size) {
                  if (mounted && (_footerHeight - size.height).abs() > .5) {
                    setState(() => _footerHeight = size.height);
                  }
                },
                child: Material(
                  color: Colors.white,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.outlineVariant,
                          width: .5,
                        ),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      minimum: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                      child: widget.footer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  Widget _mapButton(String label, IconData icon, VoidCallback onTap, Key key) =>
      Material(
        color: Colors.white,
        shape: const CircleBorder(),
        elevation: 3,
        shadowColor: const Color(0x18000000),
        child: IconButton(
          key: key,
          tooltip: label,
          onPressed: onTap,
          icon: Icon(icon, size: 23),
          style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
        ),
      );
}

class _MeasureSize extends SingleChildRenderObjectWidget {
  const _MeasureSize({required this.onChange, required super.child});
  final ValueChanged<Size> onChange;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      _SizeReporter(onChange);
  @override
  void updateRenderObject(
    BuildContext context,
    covariant _SizeReporter renderObject,
  ) => renderObject.onChange = onChange;
}

class _SizeReporter extends RenderProxyBox {
  _SizeReporter(this.onChange);
  ValueChanged<Size> onChange;
  Size? _previous;
  @override
  void performLayout() {
    super.performLayout();
    if (_previous == size) return;
    _previous = size;
    final measured = size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (attached) onChange(measured);
    });
  }
}
