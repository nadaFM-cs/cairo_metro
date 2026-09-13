import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Roboto Condensed';

  static const TextStyle brandTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.2
  );

  static const TextStyle brandSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    color: AppColors.textDim,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    color: AppColors.textDim,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle stationName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle stationSub = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    color: AppColors.textDim,
  );

  static const TextStyle statValue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle statLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.5,
    color: AppColors.textDim,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.5,
    color: AppColors.textPrimary,
  );
}
