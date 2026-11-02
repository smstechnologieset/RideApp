import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class DemoNotice extends StatelessWidget {
  const DemoNotice({
    super.key,
    this.text = 'Demo ride · Cash · Live Gebeta maps',
  });
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.primaryFixed,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 17,
          color: AppColors.primary,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.onPrimaryFixed,
              height: 1.4,
            ),
          ),
        ),
      ],
    ),
  );
}
