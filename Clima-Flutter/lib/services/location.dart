import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longtitude;

  Future<void> get_current_Location() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //nothing
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
