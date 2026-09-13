import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_ui/core/theme/app_colors.dart';
import 'package:metro_ui/features/metro_navigation/domain/entities/metro_line_id.dart';

import '../../../../core/theme/app_text_styles.dart';

class MetroAppHeader extends StatelessWidget {
  final List<MetroLineId> lines;

  const MetroAppHeader({super.key, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.stroke)
                ),
                child: const Icon(Icons.tram_outlined, color: AppColors.gold, size: 20,),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cairo Metro', style: AppTextStyles.brandTitle,),
                Text('Plan your Trip across all lines', style: AppTextStyles.brandSubtitle,)
              ],
            )
          ],
        ),
        const SizedBox(height: 12,),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          children:
          lines
              .map(
                (line) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.colorForLine(line),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6,),
                    Text(line.name, style: AppTextStyles.brandSubtitle,),
                  ],
                ),
            ).toList(),
        )
      ],
    );
  }
}
