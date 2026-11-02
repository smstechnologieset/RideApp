import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Help & demo guide')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Icon(
          Icons.support_agent_rounded,
          size: 52,
          color: AppColors.primary,
        ),
        const SizedBox(height: 20),
        const Text(
          'A smoother journey starts here.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: -.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'This presentation uses a live map and simulated ride activity.',
          style: TextStyle(color: AppColors.outline, height: 1.6),
        ),
        const SectionLabel('Good to know'),
        GroupedSection(
          children: [
            _answer(
              'How do I show a ride?',
              'Choose pickup and destination, select a vehicle and request. A demo driver appears in about three seconds. Start and finish the demo ride using the bottom button, then rate it and view the saved receipt.',
            ),
            _answer(
              'What is live?',
              'Android map tiles, place search and route directions use Gebeta Maps and need internet. Driver identity, matching and movement are simulated. No driver is dispatched.',
            ),
            _answer(
              'How does payment work?',
              'Cash is the demo method. No money is collected and no wallet or card purchase is required.',
            ),
            _answer(
              'What if I leave a ride?',
              'The ride remains available from Home and Trips. Back and sheet dismissal do not cancel it. Use Cancel demo ride explicitly before the trip starts.',
            ),
            _answer(
              'How do I sign in or reset?',
              'Use a valid Ethiopian phone number and the demo code 8429. Account → Settings → Reset demo data starts a fresh presentation. Reset removes local profile, places, reports and trips.',
            ),
            _answer(
              'What about Food, Package and Zemen Pro?',
              'Food and Package are previews. Zemen Pro is the separate driver mobile app. Calls, chat, delivery dispatch and live support are later integrations.',
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Ride issue categories save a local demonstration report. They do not contact a support team or emergency service.',
          style: TextStyle(fontSize: 12, color: AppColors.outline, height: 1.5),
        ),
      ],
    ),
  );
  Widget _answer(String question, String answer) => ExpansionTile(
    tilePadding: const EdgeInsets.symmetric(horizontal: 16),
    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
    title: Text(
      question,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
    children: [
      Text(
        answer,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.onSurfaceVariant,
          height: 1.6,
        ),
      ),
    ],
  );
}
