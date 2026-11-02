import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../core/state/demo_store.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/polished_components.dart';
import '../onboarding/phone_login_screen.dart';
import '../onboarding/profile_setup_screen.dart';
import 'help_screen.dart';

Future<void> showZemenAbout(BuildContext context) async {
  final info = await PackageInfo.fromPlatform();
  if (!context.mounted) return;
  showAboutDialog(
    context: context,
    applicationIcon: const BrandLogo(size: 48),
    applicationName: 'ZemenGo',
    applicationVersion: '${info.version} (${info.buildNumber})',
    applicationLegalese: 'All Your Needs One Tap\nPowered by SMS Technologies',
  );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _leave(BuildContext context, {bool reset = false}) async {
    final store = DemoScope.of(context);
    if (reset) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Reset demo data?'),
          content: const Text(
            'This removes this phone’s demo profile, trips, saved places, reports and preferences. It starts a fresh presentation.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: const Text('Keep data'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: const Text('Reset demo'),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
      await store.reset();
    } else {
      await store.signOut();
    }
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = DemoScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
        children: [
          const SectionLabel('Account'),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Personal details',
                subtitle: store.phone.isEmpty ? store.name : store.phone,
                icon: Icons.person_outline_rounded,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileSetupScreen(editing: true),
                  ),
                ),
              ),
            ],
          ),
          const SectionLabel('Map & preferences'),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Quiet map',
                subtitle: 'Reduce extra place labels on the live map',
                icon: Icons.map_outlined,
                trailing: Switch(
                  key: const Key('quiet_map_setting'),
                  value: store.quietMap,
                  onChanged: (value) => store.setPreferences(quietMap: value),
                ),
              ),
              SettingRow(
                title: 'Haptic feedback',
                subtitle: 'Feel vehicle, place and rating selections',
                icon: Icons.vibration_rounded,
                trailing: Switch(
                  key: const Key('haptics_setting'),
                  value: store.haptics,
                  onChanged: (value) async {
                    await store.setPreferences(haptics: value);
                    store.selectionFeedback();
                  },
                ),
              ),
              SettingRow(
                title: 'Ride notifications',
                subtitle: store.rideAlerts
                    ? 'In-app alerts on'
                    : 'In-app alerts off',
                icon: Icons.notifications_none_rounded,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RideNotificationsScreen(),
                  ),
                ),
              ),
            ],
          ),
          const SectionLabel('Information'),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Help & demo guide',
                icon: Icons.help_outline_rounded,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpScreen()),
                ),
              ),
              SettingRow(
                title: 'About ZemenGo',
                icon: Icons.info_outline_rounded,
                onTap: () => showZemenAbout(context),
              ),
            ],
          ),
          const SectionLabel('This device'),
          GroupedSection(
            children: [
              SettingRow(
                title: 'Log out',
                subtitle: 'Keep your saved trips and places',
                icon: Icons.logout_rounded,
                onTap: () => _leave(context),
              ),
              SettingRow(
                title: 'Reset demo data',
                icon: Icons.restart_alt_rounded,
                danger: true,
                onTap: () => _leave(context, reset: true),
              ),
            ],
          ),
          const SizedBox(height: 24),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (_, snapshot) => Text(
              'ZemenGo${snapshot.hasData ? ' v${snapshot.data!.version}' : ''}\nPowered by SMS Technologies',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.outline,
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RideNotificationsScreen extends StatelessWidget {
  const RideNotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final store = DemoScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ride notifications')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GroupedSection(
            children: [
              SettingRow(
                title: 'In-app ride alerts',
                subtitle:
                    'Show a brief banner for assignment, start and arrival',
                icon: Icons.notifications_none_rounded,
                trailing: Switch(
                  key: const Key('ride_alerts_setting'),
                  value: store.rideAlerts,
                  onChanged: (value) => store.setPreferences(rideAlerts: value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Your ride status always remains visible on the trip screen. This preference controls banners while the app is open. Background push notifications are not connected in this demo.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.outline,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
