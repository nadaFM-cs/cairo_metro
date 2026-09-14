import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> openStationMap(String stationName) async {
  final query = '$stationName Metro Station, Cairo, Egypt';
  final mapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',);
  try {
    if (kIsWeb) {
      await launchUrl(mapUrl, webOnlyWindowName: '_blank');
    } else {
      if (await canLaunchUrl(mapUrl)) {
        await launchUrl(mapUrl, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Could not open maps');
      }
    }
  } catch (e) {
    Get.snackbar('Error', 'Could not find station location');
  }
}
