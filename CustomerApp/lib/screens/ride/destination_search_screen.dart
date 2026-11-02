import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/services/gebeta_maps_service.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/gebeta_map_widget.dart';
import '../../widgets/polished_components.dart';
import 'map_pin_picker_screen.dart';
import 'ride_booking_screen.dart';

class DestinationSearchScreen extends StatefulWidget {
  const DestinationSearchScreen({
    super.key,
    this.initialPickup,
    this.initialDestination,
    this.returnSelection = false,
    this.placeSelection = false,
  });
  final RidePlace? initialPickup, initialDestination;
  final bool returnSelection, placeSelection;
  @override
  State<DestinationSearchScreen> createState() =>
      _DestinationSearchScreenState();
}

class _DestinationSearchScreenState extends State<DestinationSearchScreen> {
  late RidePlace _pickup = widget.initialPickup ?? demoPlaces[0],
      _destination = widget.initialDestination ?? demoPlaces[1];
  bool _editingPickup = false, _searching = false;
  final _query = TextEditingController();
  final _focus = FocusNode();
  List<RidePlace> _results = [];
  Timer? _debounce;
  int _searchId = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    _query.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _search(String query) {
    _debounce?.cancel();
    final id = ++_searchId;
    setState(() {
      _results = [];
      _searching = query.trim().length >= 2;
    });
    if (!_searching) return;
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final places = await GebetaMapsService.geocode(query);
      if (!mounted || id != _searchId) return;
      setState(() {
        _searching = false;
        _results = places
            .where((p) => p.name.isNotEmpty)
            .map((p) => RidePlace(p.name, p.latitude, p.longitude))
            .toList();
      });
    });
  }

  void _select(RidePlace place) {
    _debounce?.cancel();
    ++_searchId;
    DemoScope.of(context).selectionFeedback();
    setState(() {
      if (_editingPickup) {
        _pickup = place;
        _editingPickup = false;
      } else {
        _destination = place;
      }
      _query.clear();
      _results = [];
      _searching = false;
    });
    _focus.unfocus();
  }

  Future<void> _pickOnMap() async {
    _focus.unfocus();
    final place = await Navigator.push<RidePlace>(
      context,
      MaterialPageRoute(
        builder: (_) => MapPinPickerScreen(
          initialPlace: _editingPickup ? _pickup : _destination,
          returnSelection: true,
        ),
      ),
    );
    if (place != null && mounted) _select(place);
  }

  void _continue() {
    _focus.unfocus();
    if (widget.placeSelection) {
      Navigator.pop(context, _destination);
      return;
    }
    if (widget.returnSelection) {
      Navigator.pop(context, (pickup: _pickup, destination: _destination));
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RideBookingScreen(
          pickupAddress: _pickup.name,
          destinationAddress: _destination.name,
          pickupLat: _pickup.latitude,
          pickupLon: _pickup.longitude,
          destLat: _destination.latitude,
          destLon: _destination.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = DemoScope.of(context);
    final text = _query.text.toLowerCase().trim();
    final local = demoPlaces
        .where((p) => p.name.toLowerCase().contains(text))
        .toList();
    final saved = store.savedPlaces.entries.where(
      (e) => '${e.key} ${e.value.name}'.toLowerCase().contains(text),
    );
    final recent = <RidePlace>[];
    for (final trip in store.trips) {
      if (!recent.any((p) => p.name == trip.destination.name) &&
          trip.destination.name.toLowerCase().contains(text)) {
        recent.add(trip.destination);
      }
      if (recent.length == 2) break;
    }
    final keyboard = MediaQuery.viewInsetsOf(context).bottom > 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, size) {
          final top = MediaQuery.paddingOf(context).top;
          final sheetHeight = math.min(
            math.max(0.0, size.maxHeight - top),
            math.max(320.0, size.maxHeight * (keyboard ? 1 : .79)),
          );
          final hideWaypoints = keyboard && sheetHeight < 400;
          return Stack(
            children: [
              Positioned.fill(
                child: GebetaMapWidget(
                  height: size.maxHeight,
                  initialLat: _pickup.latitude,
                  initialLon: _pickup.longitude,
                  pickupLat: _pickup.latitude,
                  pickupLon: _pickup.longitude,
                  showRoute: false,
                  showDriverPin: false,
                  quietMap: store.quietMap,
                ),
              ),
              Positioned.fill(
                child: ColoredBox(color: Colors.black.withValues(alpha: .08)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: sheetHeight,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(26),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.outlineVariant,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 16, 0),
                          child: Row(
                            children: [
                              IconButton(
                                tooltip: 'Back',
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back_rounded),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  widget.placeSelection
                                      ? 'Choose a place'
                                      : 'Where to?',
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              if (!widget.placeSelection && !hideWaypoints)
                                _location('Pickup', _pickup, true),
                              if (!hideWaypoints)
                                _location(
                                  widget.placeSelection
                                      ? 'Place'
                                      : 'Destination',
                                  _destination,
                                  false,
                                ),
                              const SizedBox(height: 10),
                              TextField(
                                key: const Key('place_search'),
                                controller: _query,
                                focusNode: _focus,
                                autofocus: true,
                                onChanged: _search,
                                onSubmitted: (_) => _focus.unfocus(),
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  hintText: _editingPickup
                                      ? 'Search pickup'
                                      : 'Search destination',
                                  prefixIcon: const Icon(
                                    Icons.search_rounded,
                                    size: 21,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (_query.text.isNotEmpty)
                                        IconButton(
                                          tooltip: 'Clear search',
                                          onPressed: () {
                                            _query.clear();
                                            _search('');
                                            _focus.requestFocus();
                                          },
                                          icon: const Icon(
                                            Icons.close_rounded,
                                            size: 18,
                                          ),
                                        ),
                                      TextButton.icon(
                                        onPressed: _pickOnMap,
                                        icon: const Icon(
                                          Icons.map_outlined,
                                          size: 17,
                                        ),
                                        label: const Text('Map'),
                                      ),
                                      const SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        if (_searching)
                          const LinearProgressIndicator(minHeight: 2),
                        Expanded(
                          child: ListView(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              if (_results.isNotEmpty) ...[
                                const SectionLabel('Gebeta search results'),
                                for (final place in _results) _placeTile(place),
                              ],
                              if (!_searching &&
                                  text.length >= 2 &&
                                  _results.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'No live results returned. Try another name or choose on the map.',
                                    style: TextStyle(
                                      color: AppColors.outline,
                                      fontSize: 12,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              if (saved.isNotEmpty) ...[
                                const SectionLabel('Saved places'),
                                for (final entry in saved)
                                  _placeTile(
                                    entry.value,
                                    label: entry.key,
                                    icon: entry.key == 'Home'
                                        ? Icons.home_outlined
                                        : entry.key == 'Work'
                                        ? Icons.work_outline_rounded
                                        : Icons.bookmark_border_rounded,
                                  ),
                              ],
                              if (recent.isNotEmpty) ...[
                                const SectionLabel('Recent destinations'),
                                for (final place in recent)
                                  _placeTile(
                                    place,
                                    icon: Icons.history_rounded,
                                  ),
                              ],
                              if (local.isNotEmpty) ...[
                                const SectionLabel('Popular in Addis Ababa'),
                                for (final place in local) _placeTile(place),
                              ],
                            ],
                          ),
                        ),
                        if (!keyboard || sheetHeight >= 280)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                            child: ElevatedButton(
                              key: const Key('see_ride_options'),
                              onPressed:
                                  !widget.placeSelection &&
                                      _pickup.latitude ==
                                          _destination.latitude &&
                                      _pickup.longitude ==
                                          _destination.longitude
                                  ? null
                                  : _continue,
                              child: Text(
                                widget.placeSelection
                                    ? 'Use this place'
                                    : widget.returnSelection
                                    ? 'Update route'
                                    : 'See ride options',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _location(String label, RidePlace place, bool pickup) => InkWell(
    onTap: () {
      _debounce?.cancel();
      ++_searchId;
      setState(() {
        _editingPickup = pickup;
        _query.clear();
        _results = [];
        _searching = false;
      });
      _focus.requestFocus();
    },
    borderRadius: BorderRadius.circular(10),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            pickup ? Icons.trip_origin_rounded : Icons.location_on_rounded,
            size: 16,
            color: pickup ? AppColors.tertiaryContainer : AppColors.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.outline,
                  ),
                ),
                Text(
                  place.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: _editingPickup == pickup
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            _editingPickup == pickup ? Icons.edit_rounded : Icons.edit_outlined,
            size: 16,
            color: AppColors.outline,
          ),
        ],
      ),
    ),
  );

  Widget _placeTile(
    RidePlace place, {
    String? label,
    IconData icon = Icons.place_outlined,
  }) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 20, color: AppColors.onSurfaceVariant),
    ),
    title: Text(
      label ?? place.name,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
    subtitle: Text(
      label == null ? 'Addis Ababa' : place.name,
      style: const TextStyle(fontSize: 12, color: AppColors.outline),
    ),
    trailing: const Icon(
      Icons.north_west_rounded,
      size: 16,
      color: AppColors.outline,
    ),
    onTap: () => _select(place),
  );
}
