import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/models/ride_models.dart';
import '../home/main_shell_screen.dart';

class RateDriverScreen extends StatefulWidget {
  final DriverInfo driver;
  final RideOption rideOption;

  const RateDriverScreen({
    super.key,
    this.driver = DriverInfo.defaultDriver,
    this.rideOption = const RideOption(
      id: 'standard',
      title: 'Zemen Standard',
      subtitle: 'Toyota Vitz',
      price: 185,
      etaMinutes: 4,
      icon: Icons.directions_car_filled_rounded,
      capacity: '4 seats',
    ),
  });

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  int _rating = 5;
  int _selectedTip = 50; // 0, 20, 50, 100
  final Set<String> _selectedCompliments = {'Clean Car', 'Polite Driver'};

  final List<String> _compliments = const [
    'Clean Car',
    'Polite Driver',
    'Great Music',
    'Smooth Driving',
    'Fast Route',
    'Friendly Chat',
  ];

  void _submitRating() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you! Rating submitted with ${_selectedTip > 0 ? "$_selectedTip ETB tip via Telebirr" : "no tip"}.'),
      ),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShellScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Rate Your Trip',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              // Driver Avatar & Name
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.driver.initials,
                    style: AppTypography.headlineLg.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'How was your ride with ${widget.driver.name}?',
                textAlign: TextAlign.center,
                style: AppTypography.headlineMd.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.driver.carModel} • ${widget.driver.licensePlate}',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 24),

              // 5-Star Rating Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNum = index + 1;
                  final isFilled = starNum <= _rating;

                  return IconButton(
                    iconSize: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    icon: Icon(
                      isFilled ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: isFilled ? Colors.amber : AppColors.outlineVariant,
                    ),
                    onPressed: () => setState(() => _rating = starNum),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // Compliments Chips
              Text(
                'WHAT WENT WELL?',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: _compliments.map((badge) {
                  final isSelected = _selectedCompliments.contains(badge);
                  return FilterChip(
                    label: Text(badge),
                    selected: isSelected,
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          _selectedCompliments.add(badge);
                        } else {
                          _selectedCompliments.remove(badge);
                        }
                      });
                    },
                    selectedColor: AppColors.primary.withOpacity(0.12),
                    checkmarkColor: AppColors.primary,
                    labelStyle: AppTypography.labelMd.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.onSurfaceVariant,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                    backgroundColor: AppColors.surfaceContainerLow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              // Tip Driver in ETB
              Text(
                'ADD A TIP FOR DAWIT (ETB)',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTipChip(0, 'No Tip'),
                  const SizedBox(width: 8),
                  _buildTipChip(20, '+20 ETB'),
                  const SizedBox(width: 8),
                  _buildTipChip(50, '+50 ETB'),
                  const SizedBox(width: 8),
                  _buildTipChip(100, '+100 ETB'),
                ],
              ),

              const SizedBox(height: 36),

              // Submit CTA
              ElevatedButton(
                onPressed: _submitRating,
                child: const Text('Submit Rating & Tip'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipChip(int amount, String label) {
    final isSelected = _selectedTip == amount;
    return InkWell(
      onTap: () => setState(() => _selectedTip = amount),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: isSelected ? Colors.white : AppColors.onSurface,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
