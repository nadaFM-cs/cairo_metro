import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_ui/core/theme/app_colors.dart';
import 'package:metro_ui/core/theme/app_text_styles.dart';
import 'package:metro_ui/features/metro_navigation/domain/entities/trip_result.dart';

class DirectionBanner extends StatelessWidget {
  final TripResult result;

  const DirectionBanner({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final lastLeg = result.legs.last;
    final transferText = result.interchangeCount > 0 ? ' · ${result.interchangeCount} transfer(s)' : '';


    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.stroke)
      ),
      child: Row(
        children: [
          const Icon(Icons.navigation_outlined, color: AppColors.gold, size: 18,),
          const SizedBox(width: 8),
          Expanded(
              child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.body,
                    children: [
                      const TextSpan(
                          text: 'Direction towards '
                      ),
                      TextSpan(
                        text: lastLeg.direction,
                        style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.gold)
                      ),
                      TextSpan(
                        text: transferText,
                        style: AppTextStyles.stationSub
                      )
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}
