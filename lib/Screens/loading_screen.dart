import 'package:flutter/material.dart';
import 'package:flutter_weather_project/Screens/location_screen.dart';
import 'package:flutter_weather_project/Services/locatioin.dart';
import 'package:flutter_weather_project/Services/networking.dart';
import 'package:flutter_weather_project/Services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

//import 'package:geolocator/geolocator.dart';

// const apiKey = 'f89155a2e3003a6b53f1c01ab0777280';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;

  void getLocationData() async {
    //method
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // //print(position);

    // lat = position.latitude;
    // lon = position.longitude;

    // NetworkHelper networkHelper = NetworkHelper(
    //     'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');

    // var weather = await networkHelper.getData();
    //print(weather);

    var weatherdata = await WeatherModel().getLoactionWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata,
      );
    }));
    // try {
    //   Position position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high);
    //   print(position);
    // } catch (e) {
    //   print(e);
    // }
    //print('jjjj');
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // void getData() async {
  //   //var url = Uri.http('https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=f89155a2e3003a6b53f1c01ab0777280');

  //   print('lat $lat , lmg $lon');

  //   Response response = await get(Uri.parse(
  //       'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'));

  //   if (response.statusCode == 200) {
  //     String data = response.body;

  //     print("Weather Data: $data");

  //     var decodeData = jsonDecode(data);

  //     var cityName = decodeData['name'];
  //     print("Cityname: $cityName");

  //     // var longetute = decodeData['coord']['lon'];
  //     // print("Longetute: $longetute");

  //     var tempareture = decodeData['main']['temp'];
  //     print("Tempareture: $tempareture");

  //     var weatherDescription = decodeData['weather'][0]['icon'];
  //     print("WeatherIcon: $weatherDescription");
  //   } else {
  //     var error = response.statusCode;
  //     print("Error Code : $error");
  //   }

  //   // print(response.body);
  //   // print(response.statusCode);
  // }

  @override
  Widget build(BuildContext context) {
    //getData();
    return SafeArea(
      child: Scaffold(
        body: Center(

            // child: ElevatedButton(
            //   onPressed: () {
            //     getLocation();
            //   },
            //   child: Text('Get Location'),
            // ),
            ),
      ),
    );
  }
}
