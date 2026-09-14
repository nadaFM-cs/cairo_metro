import 'package:geocoding/geocoding.dart';

class DestinationSearchService {
  final Geocoding _geocoding = Geocoding();

  Future<Location?> searchDestination(String query) async {
    final locations = await _geocoding.locationFromAddress(query);

    if (locations.isEmpty) {
      return null;
    }

    return locations.first;
  }
}