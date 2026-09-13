import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> openStationMap(String stationName) async {
  try {
    final locations = await locationFromAddress('$stationName Metro Station, Cairo, Egypt',);
    if (locations.isEmpty) {
      Get.snackbar('Error', 'Station location not found');
      return;
    }
    final location = locations.first;
    final uri = Uri.parse('geo:${location.latitude},${location.longitude}' );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Could not open map');
    }
  } 
  catch (e) {
    Get.snackbar('Error', 'Could not find station location');
  }
}
