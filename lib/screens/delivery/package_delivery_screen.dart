import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/gebeta_map_widget.dart';

class PackageDeliveryScreen extends StatefulWidget {
  const PackageDeliveryScreen({super.key});

  @override
  State<PackageDeliveryScreen> createState() => _PackageDeliveryScreenState();
}

class _PackageDeliveryScreenState extends State<PackageDeliveryScreen> {
  String _dispatchMode = 'moto'; // 'moto' or 'cargo'
  String _packageCategory = 'Docs';
  String _paymentMethod = 'telebirr';
  bool _isRequesting = false;
  bool _isAssigned = false;

  int get _fareAmount => _dispatchMode == 'moto' ? 165 : 450;

  void _triggerDispatch() {
    setState(() => _isRequesting = true);
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) {
        setState(() {
          _isRequesting = false;
          _isAssigned = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Package Delivery Express',
          style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Value Prop Card / Ambient Announcement
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.electric_bolt_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'SUPERFAST DISPATCH',
                                  style: AppTypography.labelSm.copyWith(
                                    color: Colors.white,
                                    fontSize: 9.5,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.tertiaryFixed,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Send parcels, documents, or keys anywhere in Addis within 45 mins.',
                            style: AppTypography.bodyMdMedium.copyWith(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Live Route Static Mini-Map Viewport with Gebeta
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: const GebetaMapWidget(
                    height: 130,
                    showRoute: true,
                    showDriverPin: true,
                    pickupLabel: 'Bole Bulbula',
                    destinationLabel: 'Piassa Churchill',
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Service Type Selector Tabs (Moto vs Cargo)
              Text(
                'SELECT DISPATCH MODE',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Moto Tab
                  Expanded(
                    child: InkWell(
                      onTap: () => setState(() => _dispatchMode = 'moto'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: _dispatchMode == 'moto'
                              ? AppColors.primary
                              : AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _dispatchMode == 'moto'
                                ? AppColors.primary
                                : AppColors.outlineVariant.withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.two_wheeler_rounded,
                                  color: _dispatchMode == 'moto'
                                      ? Colors.white
                                      : AppColors.onSurfaceVariant,
                                  size: 26,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _dispatchMode == 'moto'
                                        ? AppColors.tertiary
                                        : AppColors.surfaceContainerHigh,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'FASTEST',
                                    style: AppTypography.labelSm.copyWith(
                                      color: _dispatchMode == 'moto'
                                          ? Colors.white
                                          : AppColors.onSurfaceVariant,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Moto Courier',
                              style: AppTypography.headlineSm.copyWith(
                                fontSize: 16,
                                color: _dispatchMode == 'moto'
                                    ? Colors.white
                                    : AppColors.onSurface,
                              ),
                            ),
                            Text(
                              'Up to 5kg • Keys, docs',
                              style: AppTypography.labelSm.copyWith(
                                color: _dispatchMode == 'moto'
                                    ? Colors.white.withOpacity(0.85)
                                    : AppColors.onSurfaceVariant,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Cargo Van Tab
                  Expanded(
                    child: InkWell(
                      onTap: () => setState(() => _dispatchMode = 'cargo'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: _dispatchMode == 'cargo'
                              ? AppColors.primary
                              : AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _dispatchMode == 'cargo'
                                ? AppColors.primary
                                : AppColors.outlineVariant.withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.local_shipping_rounded,
                                  color: _dispatchMode == 'cargo'
                                      ? Colors.white
                                      : AppColors.onSurfaceVariant,
                                  size: 26,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _dispatchMode == 'cargo'
                                        ? AppColors.tertiary
                                        : AppColors.surfaceContainerHigh,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'HEAVY',
                                    style: AppTypography.labelSm.copyWith(
                                      color: _dispatchMode == 'cargo'
                                          ? Colors.white
                                          : AppColors.onSurfaceVariant,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Cargo Van',
                              style: AppTypography.headlineSm.copyWith(
                                fontSize: 16,
                                color: _dispatchMode == 'cargo'
                                    ? Colors.white
                                    : AppColors.onSurface,
                              ),
                            ),
                            Text(
                              'Up to 300kg • Crates',
                              style: AppTypography.labelSm.copyWith(
                                color: _dispatchMode == 'cargo'
                                    ? Colors.white.withOpacity(0.85)
                                    : AppColors.onSurfaceVariant,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Location Waypoint Form
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.35),
                  ),
                ),
                child: Column(
                  children: [
                    // Pickup
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.tertiary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PICKUP POINT',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.tertiary,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Bole Bulbula, St. George Bldg',
                                style: AppTypography.bodyMdMedium.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Gate 2 • Addis Ababa',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: AppColors.outlineVariant, height: 1),
                    ),
                    // Dropoff
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DROP-OFF DESTINATION',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Piassa, Churchill Avenue, Office 402',
                                style: AppTypography.bodyMdMedium.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '4th Floor • Near Post Office',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Recipient Details Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_pin_circle_rounded,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Recipient Details',
                              style: AppTypography.headlineSm.copyWith(
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
                            color: AppColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Contact on Arrival',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryFixed,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'AK',
                              style: AppTypography.bodyMdMedium.copyWith(
                                color: AppColors.onSecondaryFixed,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Almaz Kebede',
                                style: AppTypography.bodyMdMedium.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '+251 91 123 4567',
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.call_rounded),
                          color: AppColors.primary,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Package Category Chips
              Text(
                'PACKAGE CATEGORY',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildCategoryChip('Docs', 'Documents & Paperwork', Icons.description_rounded),
                  _buildCategoryChip('Fragile', 'Fragile', Icons.egg_rounded),
                  _buildCategoryChip('Electronics', 'Electronics', Icons.devices_rounded),
                  _buildCategoryChip('Clothes', 'Clothes', Icons.dry_cleaning_rounded),
                  _buildCategoryChip('Food', 'Food items', Icons.restaurant_rounded),
                ],
              ),

              const SizedBox(height: 20),

              // Fare Estimate & Payment Summary
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.35),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fare Estimate',
                          style: AppTypography.headlineSm.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          '$_fareAmount ETB',
                          style: AppTypography.headlineLg.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildBentoInfo('Distance', '8.2 km'),
                        _buildBentoInfo('Est. Arrival', '28 min'),
                        _buildBentoInfo('Insurance', 'Included'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Payment choice
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() => _paymentMethod = 'telebirr'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _paymentMethod == 'telebirr'
                                    ? AppColors.secondaryFixed
                                    : AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Telebirr',
                                  style: AppTypography.labelMd.copyWith(
                                    color: AppColors.onSecondaryFixed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() => _paymentMethod = 'cash'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _paymentMethod == 'cash'
                                    ? AppColors.primaryFixed
                                    : AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Cash on Pick',
                                  style: AppTypography.labelMd.copyWith(
                                    color: AppColors.onPrimaryFixed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Dispatch Button
              ElevatedButton(
                onPressed: _isRequesting ? null : _triggerDispatch,
                style: _isAssigned
                    ? ElevatedButton.styleFrom(
                        backgroundColor: AppColors.tertiary,
                      )
                    : null,
                child: _isRequesting
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Searching Nearby Rider in Bole...'),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isAssigned
                                ? Icons.check_circle_rounded
                                : Icons.rocket_launch_rounded,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isAssigned
                                ? 'Rider Assigned! (4 mins away)'
                                : 'Request Express Courier ($_fareAmount ETB)',
                          ),
                        ],
                      ),
              ),

              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Protected by ZemenGo Cargo Shield • Addis Ababa',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.outline,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String id, String label, IconData icon) {
    final isSelected = _packageCategory == id;
    return InkWell(
      onTap: () => setState(() => _packageCategory = id),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.labelMd.copyWith(
                color: isSelected ? Colors.white : AppColors.onSurface,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBentoInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTypography.bodyMdMedium.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
