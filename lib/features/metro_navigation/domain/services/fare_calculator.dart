class _FareTier{
  final int minStations;
  final int maxStations;
  final double price;
  const _FareTier(this.minStations, this.maxStations, this.price);
  bool matches(int stationCount) =>
      stationCount >= minStations && stationCount <= maxStations;
}
class FareCalculator {
  FareCalculator._();
  static const List<_FareTier> _tiers = [
    _FareTier(1, 9, 10),
    _FareTier(10, 16, 12),
    _FareTier(17, 23, 15),
    _FareTier(24, 39, 20),
  ];
  static double calculate(int stationCount) {
    for (final tier in _tiers) {
      if (tier.matches(stationCount)) {
        return tier.price;
      }
    }
    return _tiers.last.price;
  }
}