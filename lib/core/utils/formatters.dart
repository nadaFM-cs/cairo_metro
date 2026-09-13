class Formatters {
  Formatters._();

  static String duration(Duration value) {
    final hours = value.inHours;
    final minutes = value.inMinutes.remainder(60);
    final seconds = value.inSeconds.remainder(60);
    final parts = <String>[];
    if (hours > 0) {
      parts.add('$hours');
    } else{
      parts.add('0');
    }
    if (hours > 0 || minutes > 0) {
      parts.add('$minutes');
    }
    parts.add('$seconds');

    return parts.join(' : ');
  }
  static String priceEgp(double value) {
    final isWhole = value == value.roundToDouble();
    final text = isWhole ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
    return '$text pound';
  }
}
