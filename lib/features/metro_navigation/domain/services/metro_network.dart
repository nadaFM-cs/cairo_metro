import 'dart:collection';

import '../../data/metro_data.dart';
import '../entities/metro_edge.dart';
import '../entities/metro_line_id.dart';
import '../entities/metro_route.dart';



class MetroNetwork {
  final List<MetroRoute> routes;
  final Map<String, List<MetroEdge>> _adjacency = {};
  final Map<String, String> _normalizedIndex = {};
  final Set<String> _allstations = {};

  MetroNetwork(this.routes) {
    _buildGraph();
  }

  factory MetroNetwork.official() => MetroNetwork(MetroData.buildAllRoutes());

  void _buildGraph() {
    for (var route in routes) {
      for (final station in route.orderedStations) {
        _registerStation(station);
      }
      for (int i = 0; i < route.orderedStations.length - 1; i++) {
        final a = route.orderedStations[i];
        final b = route.orderedStations[i + 1];
        _addEdge(a, b, route);
        _addEdge(b, a, route);
      }
    }
  }
  void _registerStation(String station) {
    if (_allstations.add(station)) {
      _normalizedIndex[_normalizeKey(station)] = station;
    }
  }
  void _addEdge(String from, String to, MetroRoute route) {
    _adjacency.putIfAbsent(from, () => []).add(
        MetroEdge(to: to, from: from, route: route)
    );
  }
  static String _normalizeKey(String input) {
    return input
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r"[\s\-\.'’]"), '');
  }
  bool hasStation(String rawInput) {
    final resolvedName = resolveStationName(rawInput);
    if (resolvedName != null) {
      return true;
    } else {
      return false;
    }
  }
  String? resolveStationName(String rawInput) {
    final String normalizedKey = _normalizeKey(rawInput);
    final String? stationName = _normalizedIndex[normalizedKey];
    return stationName;
  }

  List<MetroEdge>? findShortestPath(String start, String end) {
    if (start == end) return const [];

    final visited = <String>{start};
    final queue = Queue<String>()
      ..add(start);
    final cameFrom = <String, MetroEdge>{};

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      final incomingLine = cameFrom[current]?.route.lineId;
      for (final edge in _orderedEdges(current, incomingLine)) {
        if (visited.contains(edge.to)) continue;
        visited.add(edge.to);
        cameFrom[edge.to] = edge;
        if (edge.to == end) {
          return _reconstructPath(cameFrom, end);
        }
        queue.add(edge.to);
      }
    }
    return null;
  }

  List<MetroEdge> _orderedEdges(String station, MetroLineId? preferredLine) {
    final edges = _adjacency[station] ?? const <MetroEdge>[];
    if (preferredLine == null) return edges;

    final sameLine = <MetroEdge>[];
    final otherLine = <MetroEdge>[];
    for (final edge in edges) {
      if (edge.route.lineId == preferredLine) {
        sameLine.add(edge);
      } else {
        otherLine.add(edge);
      }
    }
    return [...sameLine, ...otherLine];
  }

  List<MetroEdge> _reconstructPath(Map<String, MetroEdge> cameFrom, String end) {
    final edge = cameFrom[end];
    if (edge == null) return const [];
    return [..._reconstructPath(cameFrom, edge.from), edge];
  }
}