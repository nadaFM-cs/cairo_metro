import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_ui/core/theme/app_colors.dart';
import 'package:metro_ui/core/theme/app_text_styles.dart';
import 'package:metro_ui/features/metro_navigation/domain/entities/trip_result.dart';

import '../../domain/entities/trip_leg.dart';

class RouteTimeline extends StatelessWidget {
  final TripResult result;
  
  const RouteTimeline({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Route details', style: AppTextStyles.sectionLabel),
          const SizedBox(height: 12),
          for (int i = 0; i < result.legs.length; i++)
            _LegSection(
              leg: result.legs[i],
              isFirstLeg: i == 0,
              isLastLeg: i == result.legs.length - 1,
            ),
        ],
      ),
    );
  }
}


class _LegSection extends StatelessWidget {
  final TripLeg leg;
  final bool isFirstLeg;
  final bool isLastLeg;

  const _LegSection({super.key, required this.leg, required this.isFirstLeg, required this.isLastLeg});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.colorForLine(leg.lineId);

    return Column(
      children: [
        if (!isFirstLeg)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Icon(Icons.sync_alt_rounded, size: 14, color: AppColors.textDim),
                const SizedBox(width: 6),
                Text('Change to ${leg.lineId.name}', style: AppTextStyles.stationSub),
              ],
            ),
          ),
        for (int i = 0; i < leg.stations.length; i++)
          _StopRow(
            name: leg.stations[i],
            color: color,
            isEndpoint: (isFirstLeg && i == 0) || (isLastLeg && i == leg.stations.length - 1),
            isLastInLeg: i == leg.stations.length - 1,
          ),
      ],
    );
  }
}


class _StopRow extends StatelessWidget {
  final String name;
  final Color color;
  final bool isEndpoint;
  final bool isLastInLeg;

  const _StopRow({super.key, required this.name, required this.color, required this.isEndpoint, required this.isLastInLeg});

  @override
  Widget build(BuildContext context) {
    final dotSize = isEndpoint ? 12.0 : 9.0;
    final lineTop = 4.0 + dotSize;

    return Stack(
      children: [
        if(!isLastInLeg)
          Positioned(
            left: 9,
            top: lineTop,
            bottom: 0,
            child: Container(width: 2, color: color,)
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: dotSize,
                    height: dotSize,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: isEndpoint ? AppColors.background : color,
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 2)
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Text(
                    name,
                    style: isEndpoint ? AppTextStyles.stationName : AppTextStyles.stationName.copyWith(fontWeight: FontWeight.w400),
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
