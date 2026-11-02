import 'package:flutter/material.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';
import '../history/ride_history_screen.dart';
import '../payment/payment_methods_screen.dart';
import '../onboarding/profile_setup_screen.dart';
import 'help_screen.dart';
import 'saved_places_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  void _open(BuildContext context, Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  @override
  Widget build(BuildContext context) {
    final store = DemoScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your account')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      store.phone.isEmpty ? 'Customer account' : store.phone,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.outline,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () => _open(
                        context,
                        const ProfileSetupScreen(editing: true),
                      ),
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: const Text('Edit profile'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.primaryFixed,
                child: Text(
                  store.initials,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _shortcut(
                  'Trips',
                  Icons.receipt_long_outlined,
                  () => _open(context, const RideHistoryScreen()),
                ),
              ),
              Expanded(
                child: _shortcut(
                  'Help',
                  Icons.support_agent_rounded,
                  () => _open(context, const HelpScreen()),
                ),
              ),
              Expanded(
                child: _shortcut(
                  'Saved places',
                  Icons.bookmark_border_rounded,
                  () => _open(context, const SavedPlacesScreen()),
                ),
              ),
              Expanded(
                child: _shortcut(
                  'Settings',
                  Icons.settings_outlined,
                  () => _open(context, const SettingsScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Payment',
                subtitle: 'Cash · Demo',
                icon: Icons.payments_outlined,
                onTap: () => _open(context, const PaymentMethodsScreen()),
              ),
              SettingRow(
                title: 'Saved places',
                subtitle: 'Home, Work and your favourites',
                icon: Icons.place_outlined,
                onTap: () => _open(context, const SavedPlacesScreen()),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Drivers use Zemen Pro',
                subtitle: 'The separate app for drivers',
                icon: Icons.directions_car_outlined,
                onTap: () => showPolishedSheet<void>(
                  context,
                  title: 'Meet Zemen Pro',
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VehicleArt(width: 130, height: 74),
                      SizedBox(height: 16),
                      Text(
                        'Zemen Pro is the separate mobile app for drivers. This ZemenGo demo shows the customer experience, with simulated driver matching and movement.',
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SettingRow(
                title: 'About ZemenGo',
                icon: Icons.info_outline_rounded,
                onTap: () => showZemenAbout(context),
              ),
              SettingRow(
                title: 'Settings',
                icon: Icons.settings_outlined,
                onTap: () => _open(context, const SettingsScreen()),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Align(alignment: Alignment.centerLeft, child: DemoChip()),
          const SizedBox(height: 8),
          const Text(
            'Your profile, trips and saved places stay on this phone.',
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

  Widget _shortcut(String title, IconData icon, VoidCallback onTap) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(14),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
