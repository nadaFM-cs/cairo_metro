import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_ui/core/theme/app_colors.dart';
import 'package:metro_ui/core/theme/app_text_styles.dart';
import 'package:metro_ui/core/utils/formatters.dart';
import 'package:metro_ui/features/metro_navigation/domain/entities/trip_result.dart';

class TripStatsRow extends StatelessWidget {
  final TripResult result;

  const TripStatsRow({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
              icon: Icons.confirmation_number_outlined,
              value: Formatters.priceEgp(result.fareEgp),
              label: 'Fare'
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.schedule_rounded,
            value: Formatters.duration(result.estimatedDuration),
            label: 'Duration',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.tram_outlined,
            value: '${result.stationCount}',
            label: 'Stations',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.stroke)
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.gold, size: 18,),
          const SizedBox(height: 6,),
          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.statValue,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2,),
          Text(label, style: AppTextStyles.sectionLabel,)
        ],
      ),
    );
  }
}
