import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/metro_data.dart';
import '../../domain/entities/metro_line_id.dart';


class AllStationsScreen extends StatelessWidget {
  const AllStationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All stations')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _LineSection(
            line: MetroLineId.line1,
            groups: {'Stations': MetroData.line1Stations},
          ),
          const SizedBox(height: 20),
          _LineSection(
            line: MetroLineId.line2,
            groups: {'Stations': MetroData.line2Stations},
          ),
          const SizedBox(height: 20),
          _LineSection(
            line: MetroLineId.line3,
            groups: {
              'Common stations': MetroData.line3TrunkStations,
              'Rod El-Farag branch (after Kit Kat)':
              MetroData.line3BranchRodElFaragStations,
              'Cairo University branch (after Kit Kat)':
              MetroData.line3BranchCairoUniversityStations,
            },
          ),
        ],
      ),
    );
  }
}

class _LineSection extends StatelessWidget {
  final MetroLineId line;
  final Map<String, List<String>> groups;

  const _LineSection({required this.line, required this.groups});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.colorForLine(line);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(line.name, style: AppTextStyles.brandTitle.copyWith(fontSize: 15)),
            ],
          ),
          for (final entry in groups.entries) ...[
            const SizedBox(height: 12),
            if (groups.length > 1) Text(entry.key, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: entry.value
                  .map((station) => Chip(
                label: Text(station, style: AppTextStyles.stationSub.copyWith(color: AppColors.textPrimary)),
                backgroundColor: AppColors.surfaceAlt,
                side: const BorderSide(color: AppColors.stroke),
              ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
