import '../../data/metro_data.dart';

class StationDirectory {
  StationDirectory._();

  static List<String> get all{
    final seen = <String>{};
    final result = <String>[];
    for(final station in [
      ...MetroData.line1Stations,
      ...MetroData.line2Stations,
      ...MetroData.line3TrunkStations,
      ...MetroData.line3BranchRodElFaragStations,
      ...MetroData.line3BranchCairoUniversityStations,
    ]){
      if(seen.add(station)){
        result.add(station);
      }
    }
    result.sort();
    return List.unmodifiable(result);
  }
}