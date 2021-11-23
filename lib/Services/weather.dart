import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_project/Services/networking.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = 'f89155a2e3003a6b53f1c01ab0777280';
const openMapWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLoactionWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //print(position);

    // lat = position.latitude;
    // lon = position.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openMapWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return Container(
        child: Icon(
          Icons.cloud_circle,
          size: 50,
        ),
      );
    } else if (condition < 400) {
      return Container(
        child: Icon(
          Icons.umbrella,
          size: 50,
        ),
      );
    } else if (condition == 800) {
      return Container(
        child: Icon(
          Icons.wb_sunny_outlined,
          size: 50,
        ),
      );
    } else {
      return Container(
        child: Icon(Icons.add_road),
      );
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "Its time to eat iceCream";
    } else if (temp > 20) {
      return "Times for wearing a shorts and t-shirt";
    } else if (temp < 10) {
      return "You will need a hand glafs";
    } else {
      return "Bring a jacket in case";
    }
  }
}
