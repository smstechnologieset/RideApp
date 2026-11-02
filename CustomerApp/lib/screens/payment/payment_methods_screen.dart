import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/polished_components.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Payment')),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      children: [
        const SectionLabel('Your payment method'),
        const GroupedSection(
          children: [
            SettingRow(
              title: 'Cash',
              subtitle: 'Selected for demo rides',
              icon: Icons.payments_outlined,
              trailing: Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'No money is collected or transferred in this demo.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SectionLabel('Digital payments'),
        const Text(
          'Wallets and cards will be connected in a later phase. No top-up or bank card is needed for the presentation.',
          style: TextStyle(fontSize: 13, color: AppColors.outline, height: 1.6),
        ),
        const SizedBox(height: 20),
        const Align(alignment: Alignment.centerLeft, child: DemoChip()),
      ],
    ),
  );
}
