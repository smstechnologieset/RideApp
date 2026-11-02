import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle displayLg = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.08,
    height: 44 / 36,
    color: AppColors.onSurface,
  );

  static TextStyle displayLgMobile = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.56,
    height: 34 / 28,
    color: AppColors.onSurface,
  );

  static TextStyle headlineLg = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
    height: 32 / 24,
    color: AppColors.onSurface,
  );

  static TextStyle headlineMd = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 28 / 20,
    color: AppColors.onSurface,
  );

  static TextStyle headlineSm = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    color: AppColors.onSurface,
  );

  static TextStyle bodyLgMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle bodyLg = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle bodyMdMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    color: AppColors.onSurface,
  );

  static TextStyle bodyMd = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelMd = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
    height: 16 / 12,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelSm = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.44,
    height: 14 / 11,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle currencyDisplay = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.22,
    height: 28 / 22,
    color: AppColors.primary,
  );
}
