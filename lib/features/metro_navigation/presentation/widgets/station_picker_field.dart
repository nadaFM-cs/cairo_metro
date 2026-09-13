import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StationPickerField extends StatefulWidget {
  final VoidCallback onTap;
  final String label;
  final String hint;
  final List<String> allStations;
  final String? selectedStation;
  final ValueChanged<String> onSelected;

  const StationPickerField({
    super.key,
    required this.label,
    required this.hint,
    required this.allStations,
    required this.onSelected,
    this.selectedStation, required this.onTap,
  });

  @override
  State<StationPickerField> createState() => _StationPickerFieldState();
}

class _StationPickerFieldState extends State<StationPickerField> {
  late final TextEditingController _controller =
  TextEditingController(text: widget.selectedStation ?? '');

  @override
  void didUpdateWidget(covariant StationPickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedStation != oldWidget.selectedStation &&
        widget.selectedStation != _controller.text) {
      _controller.text = widget.selectedStation ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.sectionLabel),
        const SizedBox(height: 6),
        DropdownMenu<String>(
          controller: _controller,
          expandedInsets: EdgeInsets.zero,
          enableFilter: true,
          requestFocusOnTap: true,
          hintText: widget.hint,
          menuHeight: 250,
          leadingIcon: InkWell(
            onTap: widget.onTap,
            child: const Icon(Icons.location_on_outlined,
                color: AppColors.gold, size: 20),
          ),
          textStyle: AppTextStyles.stationName,
          menuStyle: MenuStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.surfaceAlt),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            elevation: const WidgetStatePropertyAll(2),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.stroke),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.surfaceAlt,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.2),
            ),
          ),
          dropdownMenuEntries: widget.allStations
              .map((station) => DropdownMenuEntry<String>(
            value: station,
            label: station,
          ))
              .toList(),
          onSelected: (value) {
            if (value != null) widget.onSelected(value);
          },
        ),
      ],
    );
  }
}