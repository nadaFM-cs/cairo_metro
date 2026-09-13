import 'trip_leg.dart';

class TripResult {
  final String startStation;
  final String endStation;
  final List<String> route;
  final List<TripLeg> legs;
  final double fareEgp;
  final Duration estimatedDuration;
  const TripResult({
    required this.startStation,
    required this.endStation,
    required this.route,
    required this.legs,
    required this.fareEgp,
    required this.estimatedDuration,
  });
  int get stationCount => route.length;
  int get interchangeCount => legs.length - 1;
  List<String> get interChangeStations{
    if(legs.length <= 1) return const [];

    final List<String> result = [];
    for(int i = 0; i < legs.length - 1; i++){
      result.add(legs[i].toStation);
    }
    return result;
  }
}