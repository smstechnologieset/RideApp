import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'app_artwork.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(4, 24, 4, 10),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.outline,
      ),
    ),
  );
}

class GroupedSection extends StatelessWidget {
  const GroupedSection({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(18),
    child: Material(
      color: Colors.white,
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0)
              const Padding(
                padding: EdgeInsets.only(left: 52),
                child: Divider(),
              ),
            children[i],
          ],
        ],
      ),
    ),
  );
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
    this.danger = false,
  });
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool danger;
  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    leading: icon == null
        ? null
        : Icon(
            icon,
            size: 22,
            color: danger ? AppColors.error : AppColors.onSurface,
          ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: danger ? AppColors.error : null,
      ),
    ),
    subtitle: subtitle == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.outline,
                height: 1.4,
              ),
            ),
          ),
    trailing:
        trailing ??
        (onTap == null
            ? null
            : const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.outline,
              )),
  );
}

class DemoChip extends StatelessWidget {
  const DemoChip({super.key});
  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () => showDialog<void>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Presentation mode'),
        content: const Text(
          'The Android map, place search and directions use live Gebeta Maps. Drivers, ride progress, OTP and cash payment are simulated. No driver is dispatched and no money is collected. Food and package services are previews.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Got it'),
          ),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.tertiaryContainer,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Demo',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.info_outline_rounded,
            size: 13,
            color: AppColors.outline,
          ),
        ],
      ),
    ),
  );
}

class RouteSummary extends StatelessWidget {
  const RouteSummary({
    super.key,
    required this.pickup,
    required this.destination,
    this.onEdit,
  });
  final String pickup, destination;
  final VoidCallback? onEdit;
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Icon(
              Icons.trip_origin_rounded,
              size: 14,
              color: AppColors.tertiaryContainer,
            ),
            SizedBox(height: 3),
            SizedBox(height: 16, child: VerticalDivider(width: 14)),
            SizedBox(height: 3),
            Icon(Icons.location_on_rounded, size: 16, color: AppColors.primary),
          ],
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pickup,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              destination,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
      if (onEdit != null)
        TextButton(onPressed: onEdit, child: const Text('Edit')),
    ],
  );
}

/// Photographic vehicle cutouts shared by class, driver and history cards.
class VehicleArt extends StatelessWidget {
  const VehicleArt({
    super.key,
    this.rideId = 'standard',
    this.width = 108,
    this.height = 56,
  });
  final String rideId;
  final double width, height;
  @override
  Widget build(BuildContext context) => AppPhoto(
    AppArtwork.vehicle(rideId),
    width: width,
    height: height,
    fit: BoxFit.contain,
    cacheWidth: 512,
  );
}

Future<T?> showPolishedSheet<T>(
  BuildContext context, {
  required String title,
  required Widget child,
}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  showDragHandle: true,
  builder: (sheet) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(sheet).bottom),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(sheet).height * .82,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -.5,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () => Navigator.pop(sheet),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    ),
  ),
);
