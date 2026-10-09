import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String _selectedMethod = 'telebirr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Wallet & Payment',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Telebirr Hero Wallet Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF005E9E),
                      AppColors.telebirr,
                      Color(0xFF008DE8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.telebirr.withOpacity(0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.account_balance_wallet_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Telebirr SuperApp Wallet',
                              style: AppTypography.headlineSm.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'LINKED',
                            style: AppTypography.labelSm.copyWith(
                              color: Colors.white,
                              fontSize: 9.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'AVAILABLE BALANCE',
                      style: AppTypography.labelSm.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '1,450.00',
                          style: AppTypography.displayLg.copyWith(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'ETB',
                          style: AppTypography.headlineSm.copyWith(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Quick Action Buttons (Top Up, Transfer, Scan)
                    Row(
                      children: [
                        Expanded(
                          child: _buildWalletAction(
                            icon: Icons.add_rounded,
                            label: 'Top Up',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildWalletAction(
                            icon: Icons.send_rounded,
                            label: 'Transfer',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildWalletAction(
                            icon: Icons.qr_code_scanner_rounded,
                            label: 'Pay QR',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // Payment Methods Header
              Text(
                'Payment Choices',
                style: AppTypography.headlineSm.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                'Select default payment method for rides and food',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 14),

              // Method Options
              _buildMethodTile(
                id: 'telebirr',
                title: 'Telebirr Account',
                subtitle: '+251 91 123 4567 • Instant Auto-Debit',
                icon: Icons.account_balance_wallet_rounded,
                iconColor: AppColors.telebirr,
              ),
              const SizedBox(height: 10),
              _buildMethodTile(
                id: 'cbe',
                title: 'CBE Birr',
                subtitle: 'Commercial Bank of Ethiopia • Verified',
                icon: Icons.account_balance_rounded,
                iconColor: AppColors.cbeBirr,
              ),
              const SizedBox(height: 10),
              _buildMethodTile(
                id: 'cash',
                title: 'Cash on Delivery / Pickup',
                subtitle: 'Pay driver directly in physical ETB currency',
                icon: Icons.payments_rounded,
                iconColor: AppColors.tertiary,
              ),

              const SizedBox(height: 16),

              // Add Payment Method Button
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add new Ethiopian debit card or digital wallet'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
                label: const Text('Add Payment Method'),
              ),

              const SizedBox(height: 28),

              // Recent Transactions Header
              Text(
                'Recent Transactions',
                style: AppTypography.headlineSm.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 12),

              _buildTransactionItem(
                title: 'Ride to Piassa, Churchill Ave',
                date: 'Today, 04:15 PM',
                amount: '-185.00 ETB',
                method: 'Telebirr',
                isDebit: true,
              ),
              const SizedBox(height: 8),
              _buildTransactionItem(
                title: 'Kategna Restaurant Delivery',
                date: 'Yesterday, 07:30 PM',
                amount: '-420.00 ETB',
                method: 'Telebirr',
                isDebit: true,
              ),
              const SizedBox(height: 8),
              _buildTransactionItem(
                title: 'Telebirr Wallet Top-Up',
                date: 'Oct 6, 09:12 AM',
                amount: '+2,000.00 ETB',
                method: 'CBE Bank Transfer',
                isDebit: false,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletAction({
    required IconData icon,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label requested through Telebirr')),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.labelSm.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodTile({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    final isSelected = _selectedMethod == id;
    return InkWell(
      onTap: () => setState(() => _selectedMethod = id),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.04)
              : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.outlineVariant.withOpacity(0.4),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMdMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 22,
              )
            else
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.outlineVariant),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String date,
    required String amount,
    required String method,
    required bool isDebit,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDebit
                      ? AppColors.error.withOpacity(0.08)
                      : AppColors.tertiary.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDebit
                      ? Icons.arrow_outward_rounded
                      : Icons.arrow_downward_rounded,
                  color: isDebit ? AppColors.error : AppColors.tertiary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMdMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$date • $method',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: AppTypography.bodyMdMedium.copyWith(
              color: isDebit ? AppColors.onSurface : AppColors.tertiary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
