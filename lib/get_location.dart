import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class Location {
  String ?city;
  double ?longitude;
  double ?latitude;
  Future<void> getCurrentLocation() async {
    try {
       await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
       latitude = position.latitude;
       longitude = position.longitude;
      List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
      city=placemark[0].locality;
    }
    catch (e) {
      print(e);
    }
  }
}