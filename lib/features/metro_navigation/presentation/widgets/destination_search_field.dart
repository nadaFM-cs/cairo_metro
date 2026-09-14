import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DestinationSearchField extends StatelessWidget {
  final VoidCallback onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  const DestinationSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Where are you going?', style: AppTextStyles.stationName),
        const SizedBox(height: 2),
        const Text(
          "We'll find for you the nearest station",
          style: AppTextStyles.stationSub,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: AppTextStyles.body,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: 'e.g. Cairo University, Abbas El Akkad...',
            prefixIcon: IconButton(
              tooltip: 'Search',
              onPressed: onTap,
              icon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.gold, size: 20
              ),
            ),
          ),
        ),
      ],
    );
  }
}