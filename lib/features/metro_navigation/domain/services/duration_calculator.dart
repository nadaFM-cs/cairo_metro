import '../entities/metro_edge.dart';
import '../entities/metro_line_id.dart';

class DurationCalculator {
  DurationCalculator._();
  static const int interchangePenaltySeconds = 300;

  static Duration calculate(List<MetroEdge> edges){
    var totalSeconds = 0;
    MetroLineId? previousLineId;
    for(final edge in edges){
      totalSeconds += edge.route.lineId.averageSecondsBetweenStations;
      final isRealChange =
          previousLineId != null && previousLineId != edge.route.lineId;
      if(isRealChange){
        totalSeconds += interchangePenaltySeconds;
      }
      previousLineId = edge.route.lineId;
    }
    return Duration(seconds: totalSeconds);
  }
}