import 'metro_line_id.dart';

class MetroRoute {
  final String id;
  final MetroLineId lineId;
  final List<String> orderedStations;
  MetroRoute({
    required this.id,
    required this.lineId,
    required List<String> orderedStations,
  }) : orderedStations = List.unmodifiable(orderedStations);

  String get forwardTerminus => orderedStations.last;
  String get backwardTerminus => orderedStations.first;
  int indexOfStation(String station){
    return orderedStations.indexOf(station);
  }
  String directionTowards({required String from, required String to}){
    int fromIndex = indexOfStation(from);
    int toIndex = indexOfStation(to);
    return toIndex > fromIndex ? forwardTerminus : backwardTerminus;
  }
}