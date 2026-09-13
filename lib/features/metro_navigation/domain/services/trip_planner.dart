import '../entities/metro_edge.dart';
import '../entities/metro_line_id.dart';
import '../entities/trip_leg.dart';
import '../entities/trip_result.dart';
import 'duration_calculator.dart';
import 'fare_calculator.dart';
import 'metro_network.dart';

class TripPlanner {
  final MetroNetwork network;
  TripPlanner({required this.network});

  TripResult? plan(String rawStart, String rawEnd) {
    final start = network.resolveStationName(rawStart);
    final end = network.resolveStationName(rawEnd);

    if (start == null || end == null || start == end) return null;

    final edges = network.findShortestPath(start, end);
    if (edges == null || edges.isEmpty) return null;

    return _buildResult(start, end, edges);
  }
  TripResult _buildResult(String start, String end, List<MetroEdge> edges) {
    final route = <String>[start];
    for (final edge in edges) {
      route.add(edge.to);
    }
    final legs = _splitIntoLegs(edges);
    final fare = FareCalculator.calculate(route.length);
    final duration = DurationCalculator.calculate(edges);

    return TripResult(
      startStation: start,
      endStation: end,
      route: route,
      legs: legs,
      fareEgp: fare,
      estimatedDuration: duration,
    );
  }
  List<TripLeg> _splitIntoLegs(List<MetroEdge> edges) {
    final legs = <TripLeg>[];
    var currentStations = <String>[edges.first.from];
    var currentLineId = edges.first.route.lineId;
    var lastEdge = edges.first;

    for (final edge in edges) {
      if (edge.route.lineId != currentLineId) {
        legs.add(_finishLeg(currentLineId, lastEdge, currentStations));
        currentStations = <String>[edge.from];
        currentLineId = edge.route.lineId;
      }
      currentStations.add(edge.to);
      lastEdge = edge;
    }
    legs.add(_finishLeg(currentLineId, lastEdge, currentStations));
    return legs;
  }
  TripLeg _finishLeg(
      MetroLineId lineId,
      MetroEdge lastEdge,
      List<String> stations,
      ) {
    final direction = lastEdge.route.directionTowards(
      from: lastEdge.from,
      to: lastEdge.to,
    );
    return TripLeg(
      lineId: lineId,
      direction: direction,
      stations: List.unmodifiable(stations),
    );
  }
}