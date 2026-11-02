import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/models/demo_trip.dart';
import '../../core/models/ride_models.dart';
import '../../core/services/gebeta_maps_service.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';
import '../../widgets/app_artwork.dart';
import '../../widgets/ride_map_scaffold.dart';
import '../home/main_shell_screen.dart';
import 'destination_search_screen.dart';
import 'saved_trip_receipt_screen.dart';

class RideFlowScreen extends StatefulWidget {
  const RideFlowScreen({
    super.key,
    this.tripId,
    this.pickup = const RidePlace('Bole Bulbula, Gate 2', 8.9890, 38.7903),
    this.destination = const RidePlace(
      'Piassa, Churchill Avenue',
      9.0300,
      38.7500,
    ),
  });
  final String? tripId;
  final RidePlace pickup, destination;
  @override
  State<RideFlowScreen> createState() => _RideFlowScreenState();
}

class _RideFlowScreenState extends State<RideFlowScreen> {
  DemoStore? _store;
  String? _tripId;
  late RidePlace _pickup = widget.pickup, _destination = widget.destination;
  String _selected = 'standard', _note = '';
  bool _loading = true, _busy = false;
  GebetaRouteResult? _route;
  Timer? _matching, _progressTimer;
  double _progress = 0;
  int _rating = 0, _routeRequest = 0;

  DemoTrip? get _trip => _tripId == null ? null : _store!.tripById(_tripId!);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_store != null) return;
    _store = DemoScope.of(context);
    _tripId = widget.tripId;
    if (_tripId == null) {
      _loadRoute();
    } else {
      _loading = false;
      _progress = _trip!.status == RideStatus.completed ? 1 : _trip!.progress;
      _resumeSimulation();
    }
  }

  void _resumeSimulation() {
    _matching?.cancel();
    if (_trip?.status == RideStatus.searching) {
      _matching = Timer(
        const Duration(seconds: 3),
        () => _transition(RideStatus.assigned),
      );
    } else if (_trip?.status == RideStatus.inProgress) {
      _animateDriver();
    }
  }

  Future<void> _loadRoute() async {
    final request = ++_routeRequest;
    setState(() => _loading = true);
    final result = await GebetaMapsService.getDirections(
      originLat: _pickup.latitude,
      originLon: _pickup.longitude,
      destLat: _destination.latitude,
      destLon: _destination.longitude,
    );
    if (mounted && request == _routeRequest) {
      setState(() {
        _route = result;
        _loading = false;
      });
    }
  }

  double get _distance {
    if (_route != null) return _route!.distanceKm;
    const radians = math.pi / 180;
    final a =
        math.pow(
          math.sin((_destination.latitude - _pickup.latitude) * radians / 2),
          2,
        ) +
        math.cos(_pickup.latitude * radians) *
            math.cos(_destination.latitude * radians) *
            math.pow(
              math.sin(
                (_destination.longitude - _pickup.longitude) * radians / 2,
              ),
              2,
            );
    return math.max(.5, 6371 * 2 * math.asin(math.sqrt(a.clamp(0, 1))) * 1.3);
  }

  int get _minutes =>
      math.max(1, _route?.durationMinutes ?? (_distance / 18 * 60).round());

  Future<void> _request() async {
    if (_busy || _loading) return;
    setState(() => _busy = true);
    _store!.selectionFeedback();
    try {
      final trip = await _store!.requestRide(
        pickup: _pickup,
        destination: _destination,
        rideId: _selected,
        distanceKm: _distance,
        durationMinutes: _minutes,
        route: _route?.polylineCoordinates ?? const [],
        liveRoute: _route != null,
        pickupNote: _note,
      );
      if (!mounted) return;
      setState(() {
        _tripId = trip.id;
        _progress = trip.progress;
        _busy = false;
      });
      _resumeSimulation();
    } catch (_) {
      if (mounted) {
        setState(() => _busy = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open this demo ride. Please try again.'),
          ),
        );
      }
    }
  }

  void _animateDriver() {
    _progressTimer?.cancel();
    var ticks = 0;
    _progressTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted ||
          _trip?.status != RideStatus.inProgress ||
          _progress >= .96) {
        timer.cancel();
        return;
      }
      setState(() => _progress = (_progress + .0125).clamp(0, .96));
      if (++ticks % 6 == 0 || _progress >= .96) {
        _store!.saveProgress(_tripId!, _progress);
      }
    });
  }

  Future<void> _transition(RideStatus next) async {
    if (_busy || !mounted || _tripId == null) return;
    setState(() => _busy = true);
    final changed = await _store!.transition(_tripId!, next);
    if (!mounted) return;
    if (changed) {
      _store!.selectionFeedback();
      if (next == RideStatus.inProgress) _animateDriver();
      if (next == RideStatus.completed) {
        _progressTimer?.cancel();
        _progress = 1;
      }
      if (_store!.rideAlerts) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(switch (next) {
              RideStatus.assigned =>
                'Demo driver assigned. Your ride is ready to preview.',
              RideStatus.inProgress =>
                'Demo ride started. Driver movement is simulated.',
              RideStatus.completed => 'You arrived. Your demo trip is saved.',
              _ => 'Ride updated.',
            }),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              120 + MediaQuery.paddingOf(context).bottom,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
    setState(() => _busy = false);
  }

  void _home() {
    if (_trip?.status == RideStatus.inProgress) {
      _store!.saveProgress(_tripId!, _progress);
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShellScreen()),
      (_) => false,
    );
  }

  void _back() {
    if (_tripId == null && Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      _home();
    }
  }

  Future<void> _editRoute() async {
    final draft = await Navigator.push<RideDraft>(
      context,
      MaterialPageRoute(
        builder: (_) => DestinationSearchScreen(
          initialPickup: _pickup,
          initialDestination: _destination,
          returnSelection: true,
        ),
      ),
    );
    if (!mounted || draft == null) return;
    setState(() {
      _pickup = draft.pickup;
      _destination = draft.destination;
      _route = null;
    });
    _loadRoute();
  }

  Future<void> _options() async {
    final controller = TextEditingController(text: _note);
    final note = await showPolishedSheet<String>(
      context,
      title: 'Ride options',
      child: Builder(
        builder: (sheet) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pickup note',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add a landmark or entrance to help explain your pickup.',
              style: TextStyle(fontSize: 13, color: AppColors.outline),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLength: 180,
              minLines: 2,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'For example: by the main gate',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(sheet, controller.text.trim()),
              child: const Text('Save note'),
            ),
          ],
        ),
      ),
    );
    // The modal's route animation can still reference its text field.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    controller.dispose();
    if (mounted && note != null) setState(() => _note = note);
  }

  Future<void> _cash() => showPolishedSheet<void>(
    context,
    title: 'Payment method',
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.payments_outlined),
          title: Text('Cash'),
          subtitle: Text('Selected for this demo'),
          trailing: Icon(Icons.check_circle_rounded, color: AppColors.primary),
        ),
        SizedBox(height: 16),
        Text(
          'No payment is collected. Digital payments will be connected in a later phase.',
          style: TextStyle(color: AppColors.outline, height: 1.5),
        ),
      ],
    ),
  );

  Future<void> _cancel() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Cancel this demo ride?'),
        content: const Text(
          'No cancellation fee is charged. Your cancelled trip stays in history.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Keep ride'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: const Text('Cancel ride'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    _matching?.cancel();
    await _store!.transition(_tripId!, RideStatus.cancelled);
    if (mounted) _home();
  }

  Future<void> _details() => showPolishedSheet<void>(
    context,
    title: 'Driver & ride details',
    child: Builder(
      builder: (sheet) {
        final trip = _trip!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _driverCard(trip, tappable: false),
            const SectionLabel('Route'),
            RouteSummary(
              pickup: trip.pickup.name,
              destination: trip.destination.name,
            ),
            if (trip.pickupNote.isNotEmpty) ...[
              const SizedBox(height: 14),
              _detail('Pickup note', trip.pickupNote),
            ],
            const SectionLabel('Your ride'),
            _detail('Service', trip.option.title),
            _detail('Booked', tripDate(trip.createdAt)),
            _detail(
              trip.liveRoute ? 'Gebeta route' : 'Demo estimate',
              '${trip.distanceKm.toStringAsFixed(1)} km · ${trip.durationMinutes} min',
            ),
            _detail('Quoted fare', '${trip.fare} ETB'),
            _detail('Payment', 'Cash · Demo'),
            SettingRow(
              title: 'Copy trip ID',
              subtitle: trip.id,
              icon: Icons.copy_rounded,
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: trip.id));
                if (sheet.mounted) {
                  ScaffoldMessenger.of(sheet).showSnackBar(
                    const SnackBar(content: Text('Trip ID copied')),
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            const Text(
              'Driver identity and activity are demo data. No real driver has been dispatched.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.outline,
                height: 1.5,
              ),
            ),
          ],
        );
      },
    ),
  );

  Future<void> _issues() => showPolishedSheet<void>(
    context,
    title: 'Ride issues',
    child: Builder(
      builder: (sheet) {
        final saved = _store!.issuesFor(_tripId!);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose a category to save a demo report on this phone. These reports are not sent to a support team.',
              style: TextStyle(color: AppColors.outline, height: 1.5),
            ),
            const SizedBox(height: 16),
            for (final issue in [
              'Pickup or route',
              'Driver or vehicle',
              'Fare or payment',
              'Something else',
            ])
              SettingRow(
                title: issue,
                icon: Icons.chat_bubble_outline_rounded,
                trailing: saved.contains(issue)
                    ? const Icon(
                        Icons.check_rounded,
                        color: AppColors.tertiaryContainer,
                      )
                    : null,
                onTap: () async {
                  await _store!.reportIssue(_tripId!, issue);
                  if (!sheet.mounted) return;
                  Navigator.pop(sheet);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Demo report saved on this phone. It was not sent.',
                        ),
                      ),
                    );
                  }
                },
              ),
          ],
        );
      },
    ),
  );

  Future<void> _contact() => showPolishedSheet<void>(
    context,
    title: 'Contact driver',
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.forum_outlined, size: 42, color: AppColors.primary),
        SizedBox(height: 16),
        Text(
          'Contact preview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Text(
          'Calls and chat will connect through the separate Zemen Pro driver app in a later phase. This ride uses a simulated driver, so no call or message is sent.',
          style: TextStyle(color: AppColors.outline, height: 1.6),
        ),
      ],
    ),
  );

  @override
  void dispose() {
    _matching?.cancel();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DemoScope.of(context);
    final trip = _trip;
    final options = demoRideOptions(_distance);
    final selected = options.firstWhere((o) => o.id == _selected);
    final completed = trip?.status == RideStatus.completed;
    return PopScope(
      canPop: trip == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && !_busy) _back();
      },
      child: RideMapScaffold(
        pickup: trip?.pickup ?? _pickup,
        destination: trip?.destination ?? _destination,
        route: trip?.route ?? _route?.polylineCoordinates ?? const [],
        showDriver: trip != null && trip.status != RideStatus.searching,
        progress: _progress,
        onBack: _back,
        initialExtent: trip == null
            ? .60
            : completed
            ? .56
            : .44,
        sheetLabel: trip?.statusLabel ?? 'Choose your ride',
        footer: ElevatedButton(
          key: Key(trip == null ? 'request_ride' : 'ride_primary_action'),
          onPressed:
              _busy ||
                  (trip == null && _loading) ||
                  trip?.status == RideStatus.searching
              ? null
              : trip == null
              ? _request
              : trip.status == RideStatus.assigned
              ? () => _transition(RideStatus.inProgress)
              : trip.status == RideStatus.inProgress
              ? () => _transition(RideStatus.completed)
              : _home,
          child: Text(
            _busy
                ? 'Please wait…'
                : trip == null
                ? _loading
                      ? 'Getting your route…'
                      : 'Request ${selected.title.replaceFirst('Zemen ', '')} · ${selected.price} ETB'
                : switch (trip.status) {
                    RideStatus.searching => 'Finding a demo driver…',
                    RideStatus.assigned => 'Start demo ride',
                    RideStatus.inProgress => 'Finish demo ride',
                    _ => 'Done',
                  },
          ),
        ),
        children: trip == null ? _booking(options, selected) : _journey(trip),
      ),
    );
  }

  List<Widget> _booking(List<RideOption> options, RideOption selected) => [
    const Row(
      children: [
        Expanded(
          child: Text(
            'Choose your ride',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -.6,
            ),
          ),
        ),
        DemoChip(),
      ],
    ),
    const SizedBox(height: 16),
    RouteSummary(
      pickup: _pickup.name,
      destination: _destination.name,
      onEdit: _busy ? null : _editRoute,
    ),
    const SizedBox(height: 16),
    if (_loading)
      const LinearProgressIndicator(minHeight: 2)
    else
      Row(
        children: [
          Icon(
            _route == null ? Icons.info_outline : Icons.route_rounded,
            size: 14,
            color: AppColors.outline,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              _route == null
                  ? 'Demo estimate · ${_distance.toStringAsFixed(1)} km · $_minutes min'
                  : 'Gebeta route · ${_distance.toStringAsFixed(1)} km · $_minutes min',
              style: const TextStyle(fontSize: 12, color: AppColors.outline),
            ),
          ),
          if (_route == null)
            TextButton(onPressed: _loadRoute, child: const Text('Retry')),
        ],
      ),
    const SizedBox(height: 14),
    SizedBox(
      height:
          160 +
          math.max(0.0, MediaQuery.textScalerOf(context).scale(14) - 14) * 4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (_, index) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final option = options[index], isSelected = option.id == _selected;
          return SizedBox(
            width:
                144 *
                (MediaQuery.textScalerOf(context).scale(14) / 14).clamp(
                  1.0,
                  1.5,
                ),
            child: Material(
              color: isSelected
                  ? AppColors.primaryFixed
                  : AppColors.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 1.7,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                key: Key('ride_${option.id}'),
                onTap: _busy
                    ? null
                    : () {
                        _store!.selectionFeedback();
                        setState(() => _selected = option.id);
                      },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: VehicleArt(
                            rideId: option.id,
                            width: 120,
                            height: 72,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              option.title.replaceFirst('Zemen ', ''),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.primary,
                              size: 16,
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        option.capacity,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.outline,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _loading ? '—' : '${option.price} ETB',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
    const SizedBox(height: 14),
    const Divider(),
    Row(
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.payments_outlined, size: 22),
            title: const Text(
              'Cash',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Demo payment',
              style: TextStyle(fontSize: 11),
            ),
            trailing: const Icon(Icons.chevron_right_rounded, size: 18),
            onTap: _cash,
          ),
        ),
        const SizedBox(width: 18),
        TextButton.icon(
          onPressed: _options,
          icon: const Icon(Icons.tune_rounded, size: 18),
          label: Text(_note.isEmpty ? 'Options' : 'Note added'),
        ),
      ],
    ),
    if (_note.isNotEmpty)
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          _note,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
    const Text(
      'No driver is dispatched and no payment is collected.',
      style: TextStyle(fontSize: 12, color: AppColors.outline),
    ),
  ];

  List<Widget> _journey(DemoTrip trip) {
    final completed = trip.status == RideStatus.completed;
    final saved = _store!.savedPlaces.values.any(
      (p) =>
          p.latitude == trip.destination.latitude &&
          p.longitude == trip.destination.longitude,
    );
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  switch (trip.status) {
                    RideStatus.searching => 'Finding your driver',
                    RideStatus.assigned => 'Your driver is ready',
                    RideStatus.inProgress => 'On your way',
                    RideStatus.completed => 'You arrived',
                    RideStatus.cancelled => 'Ride cancelled',
                  },
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -.6,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  switch (trip.status) {
                    RideStatus.searching => 'Matching a demo driver nearby',
                    RideStatus.assigned =>
                      'Demo arrival · ${trip.option.etaMinutes} min',
                    RideStatus.inProgress =>
                      '~${math.max(1, (trip.durationMinutes * (1 - _progress)).ceil())} min left · Simulated progress',
                    RideStatus.completed => trip.destination.name,
                    RideStatus.cancelled => 'No cancellation fee',
                  },
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.outline,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const DemoChip(),
        ],
      ),
      const SizedBox(height: 20),
      if (trip.status == RideStatus.searching) ...[
        const LinearProgressIndicator(minHeight: 3),
        const SizedBox(height: 22),
        const Text(
          'A moment away from your next journey.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 22),
      ] else if (completed) ...[
        Text(
          '${trip.fare} ETB',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Cash · Demo total',
          style: TextStyle(fontSize: 13, color: AppColors.outline),
        ),
        const SizedBox(height: 16),
        const Text(
          'How was your ride?',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (i) => IconButton(
              tooltip: '${i + 1} stars',
              onPressed: trip.rating != null
                  ? null
                  : () {
                      _store!.selectionFeedback();
                      setState(() => _rating = i + 1);
                    },
              icon: Icon(
                i < (trip.rating ?? _rating)
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: const Color(0xFFE5AB36),
                size: 32,
              ),
            ),
          ),
        ),
        if (trip.rating != null)
          const Text(
            'Thank you. Your rating is saved.',
            style: TextStyle(fontSize: 12, color: AppColors.tertiaryContainer),
          )
        else if (_rating > 0)
          TextButton(
            onPressed: () => _store!.rate(trip.id, _rating),
            child: const Text('Save rating'),
          ),
        SettingRow(
          title: 'View receipt',
          subtitle: 'Saved fare and trip details',
          icon: Icons.receipt_long_outlined,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SavedTripReceiptScreen(tripId: trip.id),
            ),
          ),
        ),
      ] else ...[
        _driverCard(trip),
        const SizedBox(height: 14),
        if (trip.status == RideStatus.inProgress) ...[
          LinearProgressIndicator(
            value: _progress,
            minHeight: 3,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 12),
        ],
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _contact,
                icon: const Icon(Icons.forum_outlined, size: 18),
                label: const Text('Contact preview'),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              tooltip: saved ? 'Destination saved' : 'Save destination',
              onPressed: saved
                  ? null
                  : () async {
                      await _store!.savePlace(
                        trip.destination.name,
                        trip.destination,
                      );
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Destination saved to your places'),
                          ),
                        );
                      }
                    },
              icon: Icon(
                saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              ),
            ),
          ],
        ),
      ],
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 20),
      RouteSummary(
        pickup: trip.pickup.name,
        destination: trip.destination.name,
      ),
      if (trip.pickupNote.isNotEmpty) ...[
        const SizedBox(height: 12),
        _detail('Pickup note', trip.pickupNote),
      ],
      const SizedBox(height: 20),
      const Divider(),
      SettingRow(
        title: 'Cash',
        subtitle: '${trip.fare} ETB · Quoted demo fare',
        icon: Icons.payments_outlined,
        onTap: _cash,
      ),
      if (trip.status != RideStatus.searching)
        SettingRow(
          title: 'Driver & ride details',
          icon: Icons.badge_outlined,
          onTap: _details,
        ),
      SettingRow(
        title: 'Ride issues',
        subtitle: _store!.issuesFor(trip.id).isEmpty
            ? 'Demo reports stay on this phone'
            : '${_store!.issuesFor(trip.id).length} report(s) saved on this phone',
        icon: Icons.help_outline_rounded,
        onTap: _issues,
      ),
      if (trip.active)
        SettingRow(
          title: 'Return home',
          subtitle: 'Your ride stays available to resume',
          icon: Icons.home_outlined,
          onTap: _home,
        ),
      if (trip.status == RideStatus.searching ||
          trip.status == RideStatus.assigned) ...[
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),
        SettingRow(
          title: 'Cancel demo ride',
          icon: Icons.close_rounded,
          danger: true,
          onTap: _busy ? null : _cancel,
        ),
      ],
      const SizedBox(height: 12),
      const Text(
        'Live Gebeta map · Simulated driver · No payment collected',
        style: TextStyle(fontSize: 11, color: AppColors.outline, height: 1.5),
      ),
    ];
  }

  Widget _driverCard(DemoTrip trip, {bool tappable = true}) {
    const driver = DriverInfo.defaultDriver;
    final model = switch (trip.rideId) {
      'comfort' => 'Toyota Corolla',
      'xl' => 'Toyota Hiace',
      'moto' => 'Motorcycle',
      _ => 'Toyota Vitz',
    };
    final colour = switch (trip.rideId) {
      'comfort' => 'Graphite',
      'moto' => 'Blue',
      _ => 'Silver',
    };
    return InkWell(
      onTap: tappable ? _details : null,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      driver.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: AppColors.onSurfaceVariant,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${driver.rating}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '$colour · $model',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.outline,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'DEMO 01',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 96,
            height: 92,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 3,
                  child: VehicleArt(rideId: trip.rideId, width: 96, height: 54),
                ),
                Positioned(
                  right: 4,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const ClipOval(
                      child: AppPhoto(
                        AppArtwork.driver,
                        width: 40,
                        height: 40,
                        cacheWidth: 160,
                        label: 'Illustrative demo driver portrait',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.outline),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
