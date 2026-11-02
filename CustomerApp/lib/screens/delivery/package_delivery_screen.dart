import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/demo_notice.dart';
import '../../widgets/gebeta_map_widget.dart';
import '../../widgets/app_artwork.dart';

class PackageDeliveryScreen extends StatefulWidget {
  const PackageDeliveryScreen({super.key});
  @override
  State<PackageDeliveryScreen> createState() => _PackageDeliveryScreenState();
}

class _PackageDeliveryScreenState extends State<PackageDeliveryScreen> {
  String _category = 'Documents', _mode = 'Moto courier';
  int _pickup = 0, _destination = 1;
  final _name = TextEditingController(text: 'Demo recipient');
  final _phone = TextEditingController(text: '911234567');
  final _form = GlobalKey<FormState>();
  int get _quote => _mode == 'Moto courier' ? 165 : 450;
  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _preview() {
    if (!_form.currentState!.validate()) return;
    if (_pickup == _destination) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Choose different pickup and delivery locations.'),
        ),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    showDialog<void>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Delivery request preview'),
        content: SingleChildScrollView(
          child: Text(
            '$_category · $_mode\n\nFrom: ${demoPlaces[_pickup].name}\nTo: ${demoPlaces[_destination].name}\nRecipient: ${_name.text.trim()}\nPhone: ${DemoStore.normalizePhone(_phone.text)}\nSample quote: $_quote ETB · Cash\n\nThis preview does not create a delivery or dispatch a courier.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Package preview')),
    body: SafeArea(
      child: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const DemoNotice(
              text:
                  'Upcoming service · Explore document and package booking. No courier is dispatched.',
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Send it\nacross Addis.',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -.5,
                      height: 1.15,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const AppPhoto(
                  AppArtwork.parcel,
                  width: 142,
                  height: 110,
                  fit: BoxFit.contain,
                  cacheWidth: 480,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              children: [
                for (final category in ['Documents', 'Parcel', 'Keys'])
                  ChoiceChip(
                    label: Text(category),
                    selected: _category == category,
                    onSelected: (_) => setState(() => _category = category),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                for (final mode in ['Moto courier', 'Cargo van'])
                  ChoiceChip(
                    avatar: Icon(
                      mode == 'Cargo van'
                          ? Icons.local_shipping_outlined
                          : Icons.two_wheeler_outlined,
                      size: 18,
                    ),
                    label: Text(mode),
                    selected: _mode == mode,
                    onSelected: (_) => setState(() => _mode = mode),
                  ),
              ],
            ),
            const SizedBox(height: 22),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: GebetaMapWidget(
                height: 180,
                pickupLat: demoPlaces[_pickup].latitude,
                pickupLon: demoPlaces[_pickup].longitude,
                destLat: demoPlaces[_destination].latitude,
                destLon: demoPlaces[_destination].longitude,
                showDriverPin: false,
              ),
            ),
            const SizedBox(height: 18),
            DropdownButtonFormField<int>(
              initialValue: _pickup,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Pickup'),
              items: [
                for (var i = 0; i < demoPlaces.length; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      demoPlaces[i].name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (value) => setState(() => _pickup = value!),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<int>(
              initialValue: _destination,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Deliver to'),
              items: [
                for (var i = 0; i < demoPlaces.length; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      demoPlaces[i].name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (value) => setState(() => _destination = value!),
            ),
            const SizedBox(height: 22),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Recipient name'),
              validator: (value) => (value ?? '').trim().isEmpty
                  ? 'Enter a recipient name.'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Recipient phone',
                prefixText: '+251  ',
              ),
              validator: (value) =>
                  DemoStore.normalizePhone(value ?? '') == null
                  ? 'Enter a valid Ethiopian mobile number.'
                  : null,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Sample quote · Cash',
                    style: TextStyle(color: AppColors.outline),
                  ),
                ),
                Text(
                  '$_quote ETB',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: _preview,
              child: const Text('Preview delivery request'),
            ),
          ],
        ),
      ),
    ),
  );
}
