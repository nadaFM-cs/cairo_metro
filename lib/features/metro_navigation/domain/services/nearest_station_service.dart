import 'package:geolocator/geolocator.dart';

import '../../data/metro_station_data.dart';
import '../entities/models/metro_station.dart';

class NearestStationService {
  MetroStation findNearestStation({
    required double latitude,
    required double longitude,
  }) {
    MetroStation nearestStation = MetroStationData.stations.first;

    double shortestDistance = Geolocator.distanceBetween(
      latitude,
      longitude,
      nearestStation.latitude,
      nearestStation.longitude,
    );

    for (final station in MetroStationData.stations.skip(1)) {
      final distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        station.latitude,
        station.longitude,
      );

      if (distance < shortestDistance) {
        shortestDistance = distance;
        nearestStation = station;
      }
    }

    return nearestStation;
  }
}