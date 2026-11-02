import 'package:flutter/material.dart';
import '../../core/models/demo_trip.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';
import '../ride/destination_search_screen.dart';

class SavedPlacesScreen extends StatelessWidget {
  const SavedPlacesScreen({super.key});

  Future<void> _choose(
    BuildContext context, {
    String? label,
    RidePlace? existing,
  }) async {
    final place = await Navigator.push<RidePlace>(
      context,
      MaterialPageRoute(
        builder: (_) => DestinationSearchScreen(
          placeSelection: true,
          initialDestination: existing,
        ),
      ),
    );
    if (place == null || !context.mounted) return;
    final store = DemoScope.of(context);
    var name = label;
    if (name == null) {
      final controller = TextEditingController();
      final form = GlobalKey<FormState>();
      name = await showDialog<String>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Name this place'),
          content: Form(
            key: form,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              maxLength: 35,
              decoration: const InputDecoration(hintText: 'For example: Gym'),
              validator: (value) {
                if ((value ?? '').trim().isEmpty) return 'Enter a name';
                if (store.savedPlaces.keys.any(
                      (key) => key.toLowerCase() == value!.trim().toLowerCase(),
                    ) ||
                    ['home', 'work'].contains(value!.trim().toLowerCase())) {
                  return 'Use a different name';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (form.currentState!.validate()) {
                  Navigator.pop(dialog, controller.text.trim());
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 300));
      controller.dispose();
    }
    if (name != null && context.mounted) {
      await store.savePlace(name, place);
      store.selectionFeedback();
    }
  }

  Future<void> _edit(BuildContext context, String label, RidePlace place) =>
      showPolishedSheet<void>(
        context,
        title: label,
        child: Builder(
          builder: (sheet) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                place.name,
                style: const TextStyle(color: AppColors.outline, height: 1.5),
              ),
              const SizedBox(height: 16),
              SettingRow(
                title: 'Change place',
                icon: Icons.edit_location_alt_outlined,
                onTap: () {
                  Navigator.pop(sheet);
                  _choose(context, label: label, existing: place);
                },
              ),
              SettingRow(
                title: 'Delete saved place',
                icon: Icons.delete_outline_rounded,
                danger: true,
                onTap: () async {
                  final store = DemoScope.of(sheet);
                  final confirmed = await showDialog<bool>(
                    context: sheet,
                    builder: (dialog) => AlertDialog(
                      title: Text('Delete $label?'),
                      content: const Text(
                        'You can save this place again later.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialog, false),
                          child: const Text('Keep'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(dialog, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    await store.removePlace(label);
                    if (sheet.mounted) Navigator.pop(sheet);
                  }
                },
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final places = DemoScope.of(context).savedPlaces;
    return Scaffold(
      appBar: AppBar(title: const Text('Saved places')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          const Text(
            'Your familiar places, a tap away.',
            style: TextStyle(color: AppColors.outline, height: 1.5),
          ),
          const SectionLabel('Everyday'),
          GroupedSection(
            children: [
              for (final label in ['Home', 'Work'])
                SettingRow(
                  title: label,
                  subtitle: places[label]?.name ?? 'Add $label address',
                  icon: label == 'Home'
                      ? Icons.home_outlined
                      : Icons.work_outline_rounded,
                  onTap: () => places.containsKey(label)
                      ? _edit(context, label, places[label]!)
                      : _choose(context, label: label),
                ),
            ],
          ),
          const SectionLabel('Other places'),
          GroupedSection(
            children: [
              for (final entry in places.entries.where(
                (e) => e.key != 'Home' && e.key != 'Work',
              ))
                SettingRow(
                  title: entry.key,
                  subtitle: entry.value.name,
                  icon: Icons.bookmark_border_rounded,
                  onTap: () => _edit(context, entry.key, entry.value),
                ),
              SettingRow(
                title: 'Add a place',
                icon: Icons.add_rounded,
                onTap: () => _choose(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Saved on this phone and available in destination search.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.outline,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
