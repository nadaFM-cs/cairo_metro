import 'metro_route.dart';

class MetroEdge {
  final String to;
  final String from;
  final MetroRoute route;
  const MetroEdge({
    required this.to,
    required this.from,
    required this.route,
  });
}