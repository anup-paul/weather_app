import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longetude;

  Future<void> getCurrentLocaton() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      //print(position);
    } catch (e) {
      print(e);
    }
  }
}
