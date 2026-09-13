class MetroLineId {
  final String id;
  final String name;
  final int averageSecondsBetweenStations;
  const MetroLineId._({
    required this.id,
    required this.name,
    required this.averageSecondsBetweenStations
  });
  static const MetroLineId line1 = MetroLineId._(
    id: 'line1',
    name: 'Line 1 (Red)',
    averageSecondsBetweenStations: 120,
  );
  static const MetroLineId line2 = MetroLineId._(
    id: 'line2',
    name: 'Line 2 (Blue)',
    averageSecondsBetweenStations: 120,
  );
  static const MetroLineId line3 = MetroLineId._(
    id: 'line3',
    name: 'Line 3 (Green)',
    averageSecondsBetweenStations: 120,
  );
}