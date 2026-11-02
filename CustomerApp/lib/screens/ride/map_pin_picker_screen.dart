import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/services/gebeta_maps_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/state/demo_store.dart';
import '../../widgets/gebeta_map_widget.dart';
import 'ride_booking_screen.dart';

class MapPinPickerScreen extends StatefulWidget {
  const MapPinPickerScreen({
    super.key,
    this.initialPlace,
    this.returnSelection = false,
  });
  final RidePlace? initialPlace;
  final bool returnSelection;
  @override
  State<MapPinPickerScreen> createState() => _MapPinPickerScreenState();
}

class _MapPinPickerScreenState extends State<MapPinPickerScreen> {
  late RidePlace _selected = widget.initialPlace ?? demoPlaces[0];
  bool _lookingUp = false;
  int _lookup = 0;

  Future<void> _selectPoint(double lat, double lon) async {
    final id = ++_lookup;
    setState(() {
      _selected = RidePlace(
        'Map pin (${lat.toStringAsFixed(4)}, ${lon.toStringAsFixed(4)})',
        lat,
        lon,
      );
      _lookingUp = true;
    });
    final name = await GebetaMapsService.reverseGeocode(lat, lon);
    if (!mounted || id != _lookup) return;
    setState(() {
      if (name != null && name.isNotEmpty) {
        _selected = RidePlace(name, lat, lon);
      }
      _lookingUp = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Choose a map point')),
    body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (_, size) => GebetaMapWidget(
                height: size.maxHeight,
                initialLat: _selected.latitude,
                initialLon: _selected.longitude,
                pickupLat: _selected.latitude,
                pickupLon: _selected.longitude,
                showRoute: false,
                showDriverPin: false,
                quietMap: DemoScope.of(context).quietMap,
                onPointSelected: _selectPoint,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tap the live map to move your pin.',
                  style: TextStyle(color: AppColors.outline, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  _selected.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (_lookingUp)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Looking up address… You can also confirm the coordinates.',
                      style: TextStyle(fontSize: 11, color: AppColors.outline),
                    ),
                  ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    if (widget.returnSelection) {
                      Navigator.pop(context, _selected);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RideBookingScreen(
                            pickupAddress: _selected.name,
                            pickupLat: _selected.latitude,
                            pickupLon: _selected.longitude,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Use this location'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
