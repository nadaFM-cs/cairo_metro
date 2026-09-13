import 'metro_line_id.dart';

class TripLeg {
  final MetroLineId lineId;
  final String direction;
  final List<String> stations;
  const TripLeg({
    required this.lineId,
    required this.direction,
    required this.stations,
  });
  String get fromStation => stations.first;
  String get toStation => stations.last;
}