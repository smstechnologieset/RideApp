import 'package:flutter/material.dart';
import 'super_app_home_screen.dart';
import '../history/ride_history_screen.dart';
import '../payment/payment_methods_screen.dart';
import '../profile/profile_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key, this.initialTab = 0});
  final int initialTab;
  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.initialTab > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => switch (widget.initialTab) {
              1 => const RideHistoryScreen(),
              2 => const PaymentMethodsScreen(),
              _ => const ProfileScreen(),
            },
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) => SuperAppHomeScreen(
    onOpenDrawer: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    ),
  );
}
