import 'dart:ui';
import '../../features/metro_navigation/domain/entities/metro_line_id.dart';

class AppColors {
  AppColors._();
  static const Color background = Color(0xFF14171C);
  static const Color surface = Color(0xFF1B1F27);
  static const Color surfaceAlt = Color(0xFF22262F);
  static const Color stroke = Color(0xFF2A2F3A);

  static const Color textPrimary = Color(0xFFEDEDED);
  static const Color textDim = Color(0xFF8A90A0);
  static const Color gold = Color(0xFFD9B872);
  static const Map<String, Color> lineColors = {
    'line1': Color(0xFFD8483F),
    'line2': Color(0xFF3C7FC2),
    'line3': Color(0xFF3F9D5C),
  };
  static Color colorForLine(MetroLineId lineId) => lineColors[lineId.id] ?? gold;
}