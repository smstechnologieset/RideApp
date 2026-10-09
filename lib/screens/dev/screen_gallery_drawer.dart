import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../onboarding/splash_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../onboarding/phone_login_screen.dart';
import '../onboarding/otp_verification_screen.dart';
import '../onboarding/profile_setup_screen.dart';
import '../onboarding/location_permission_screen.dart';
import '../ride/destination_search_screen.dart';
import '../ride/map_pin_picker_screen.dart';
import '../ride/ride_booking_screen.dart';
import '../ride/searching_driver_screen.dart';
import '../ride/driver_assigned_screen.dart';
import '../ride/active_enroute_screen.dart';
import '../ride/trip_completed_screen.dart';
import '../ride/rate_driver_screen.dart';
import '../ride/trip_receipt_screen.dart';
import '../delivery/package_delivery_screen.dart';
import '../food/food_delivery_screen.dart';
import '../driver/driver_hud_screen.dart';
import '../history/ride_history_screen.dart';
import '../payment/payment_methods_screen.dart';

class ScreenGalleryDrawer extends StatelessWidget {
  const ScreenGalleryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.primary,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.layers_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ZemenGo Screens',
                        style: AppTypography.headlineSm.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '25 Stitch Screens Catalog',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Screen Items List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildSectionHeader('ONBOARDING & AUTH'),
                  _buildScreenTile(
                    context,
                    title: '1. Splash Screen',
                    icon: Icons.launch_rounded,
                    screen: const SplashScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '2. Onboarding Carousel',
                    icon: Icons.view_carousel_rounded,
                    screen: const OnboardingScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '3. Phone Login (+251)',
                    icon: Icons.phone_android_rounded,
                    screen: const PhoneLoginScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '4. OTP Verification',
                    icon: Icons.pin_rounded,
                    screen: const OtpVerificationScreen(phoneNumber: '+251 91 123 4567'),
                  ),
                  _buildScreenTile(
                    context,
                    title: '5. Profile Setup',
                    icon: Icons.person_rounded,
                    screen: const ProfileSetupScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '6. Location Permission',
                    icon: Icons.location_on_rounded,
                    screen: const LocationPermissionScreen(),
                  ),

                  _buildSectionHeader('SUPER APP HOME & SERVICES'),
                  _buildScreenTile(
                    context,
                    title: '7. Package Delivery Express',
                    icon: Icons.local_shipping_rounded,
                    screen: const PackageDeliveryScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '8. Food Delivery & Restaurants',
                    icon: Icons.restaurant_rounded,
                    screen: const FoodDeliveryScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '9. Driver Partner Live HUD',
                    icon: Icons.speed_rounded,
                    screen: const DriverHudScreen(),
                  ),

                  _buildSectionHeader('RIDE BOOKING JOURNEY'),
                  _buildScreenTile(
                    context,
                    title: '10. Destination Search',
                    icon: Icons.search_rounded,
                    screen: const DestinationSearchScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '11. Map Pin Picker',
                    icon: Icons.pin_drop_rounded,
                    screen: const MapPinPickerScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '12. Ride Options & Fare',
                    icon: Icons.directions_car_rounded,
                    screen: const RideBookingScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '13. Searching for Driver',
                    icon: Icons.radar_rounded,
                    screen: const SearchingDriverScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '14. Driver Assigned & Live HUD',
                    icon: Icons.person_pin_circle_rounded,
                    screen: const DriverAssignedScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '15. Active En-Route Trip',
                    icon: Icons.navigation_rounded,
                    screen: const ActiveEnRouteScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '16. Trip Completed',
                    icon: Icons.check_circle_rounded,
                    screen: const TripCompletedScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '17. Rate Driver & Tip',
                    icon: Icons.star_rate_rounded,
                    screen: const RateDriverScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '18. Trip Receipt & Telebirr',
                    icon: Icons.receipt_long_rounded,
                    screen: const TripReceiptScreen(),
                  ),

                  _buildSectionHeader('USER ACTIVITY & WALLET'),
                  _buildScreenTile(
                    context,
                    title: '19. Ride History & Trips',
                    icon: Icons.history_rounded,
                    screen: const RideHistoryScreen(),
                  ),
                  _buildScreenTile(
                    context,
                    title: '20. Payment Methods & Telebirr',
                    icon: Icons.account_balance_wallet_rounded,
                    screen: const PaymentMethodsScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 6),
      child: Text(
        title,
        style: AppTypography.labelSm.copyWith(
          color: AppColors.primary,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildScreenTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget screen,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: AppColors.onSurfaceVariant, size: 20),
      title: Text(
        title,
        style: AppTypography.bodyMdMedium.copyWith(
          color: AppColors.onSurface,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 18,
        color: AppColors.outlineVariant,
      ),
      onTap: () {
        Navigator.of(context).pop(); // close drawer
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => screen),
        );
      },
    );
  }
}
