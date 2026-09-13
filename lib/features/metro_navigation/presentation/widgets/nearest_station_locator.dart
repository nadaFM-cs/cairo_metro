import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';


class NearestStationLocator extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const NearestStationLocator({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: isLoading ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.stroke),
          ),
          child: Row(
            children: [
              isLoading
                  ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.gold,
                ),
              )
                  : const Icon(Icons.my_location_rounded,
                  color: AppColors.gold, size: 20),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  'Tap to find the nearest station to your location',
                  style: AppTextStyles.sectionLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}