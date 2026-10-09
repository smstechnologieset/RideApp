import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/map_view_canvas.dart';

class DriverHudScreen extends StatefulWidget {
  const DriverHudScreen({super.key});

  @override
  State<DriverHudScreen> createState() => _DriverHudScreenState();
}

class _DriverHudScreenState extends State<DriverHudScreen> {
  bool _isOnline = true;
  bool _showIncomingRequest = false;

  void _triggerIncomingRequest() {
    setState(() => _showIncomingRequest = true);
  }

  void _acceptRequest() {
    setState(() => _showIncomingRequest = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ride Accepted! Navigating to Bole Medhanealem Mall...'),
      ),
    );
  }

  void _declineRequest() {
    setState(() => _showIncomingRequest = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Live Heatmap Map
          Positioned.fill(
            child: MapViewCanvas(
              height: MediaQuery.of(context).size.height,
              showRoute: false,
              showDriverPin: true,
              showRadar: _isOnline,
            ),
          ),

          // Top Driver Status Bar & Online/Offline Switch
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.onSurface.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: _isOnline
                                    ? AppColors.tertiaryFixed
                                    : AppColors.error,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: _isOnline
                                        ? AppColors.tertiaryFixed.withOpacity(0.6)
                                        : AppColors.error.withOpacity(0.6),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _isOnline ? 'YOU ARE ONLINE' : 'YOU ARE OFFLINE',
                                  style: AppTypography.labelSm.copyWith(
                                    color: _isOnline
                                        ? AppColors.tertiaryFixed
                                        : Colors.white70,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                Text(
                                  _isOnline
                                      ? 'High demand in Bole & Piassa'
                                      : 'Tap switch to receive rides',
                                  style: AppTypography.bodyMdMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Toggle Switch
                        Switch(
                          value: _isOnline,
                          activeColor: AppColors.tertiaryFixed,
                          activeTrackColor: AppColors.tertiary,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.black26,
                          onChanged: (val) {
                            setState(() {
                              _isOnline = val;
                              if (!val) _showIncomingRequest = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  if (_isOnline && !_showIncomingRequest) ...[
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _triggerIncomingRequest,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Test: Simulate Incoming Ride Request',
                          style: AppTypography.labelSm.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Bottom Earnings & Daily Stats Bento
          if (!_showIncomingRequest)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 24,
                      offset: const Offset(0, -6),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Today's Earnings
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TODAY'S EARNINGS",
                                style: AppTypography.labelSm.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '1,850 ETB',
                                style: AppTypography.displayLgMobile.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 26,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryFixed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_rounded,
                                  size: 16,
                                  color: AppColors.secondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Telebirr Payout',
                                  style: AppTypography.labelSm.copyWith(
                                    color: AppColors.onSecondaryFixed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      const Divider(color: AppColors.outlineVariant, height: 1),
                      const SizedBox(height: 16),

                      // Stats Grid
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('Trips', '8', Icons.directions_car_rounded),
                          Container(
                            width: 1,
                            height: 32,
                            color: AppColors.outlineVariant,
                          ),
                          _buildStatItem('Acceptance', '96%', Icons.thumb_up_rounded),
                          Container(
                            width: 1,
                            height: 32,
                            color: AppColors.outlineVariant,
                          ),
                          _buildStatItem('Online', '5.4 hrs', Icons.access_time_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Incoming Ride Request Card Modal
          if (_showIncomingRequest)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, -8),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Alert Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.tertiary.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bolt_rounded,
                                  color: AppColors.tertiary,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'NEW RIDE REQUEST (15s)',
                                  style: AppTypography.labelSm.copyWith(
                                    color: AppColors.tertiary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '+185 ETB',
                            style: AppTypography.headlineLg.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Route Details
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: AppColors.tertiary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Bole Medhanealem Mall (1.2 km away)',
                                    style: AppTypography.bodyMdMedium.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.square,
                                  size: 10,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Kazanchis, UNECA Headquarters (4.8 km)',
                                    style: AppTypography.bodyMdMedium.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Accept / Decline Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _declineRequest,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.error,
                                side: const BorderSide(color: AppColors.error),
                              ),
                              child: const Text('Decline'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: _acceptRequest,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.tertiary,
                              ),
                              child: const Text('Accept Ride (185 ETB)'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: AppColors.onSurfaceVariant),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTypography.labelSm.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTypography.headlineSm.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
