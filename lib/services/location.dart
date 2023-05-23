import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 200;
  double longitude = 200;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print('getCurrentLocation' + e.toString());
    }
  }
}
