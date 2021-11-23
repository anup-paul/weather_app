import 'package:flutter/material.dart';
import 'package:flutter_weather_project/Screens/city_screen.dart';
import 'package:flutter_weather_project/Services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  String? cityName;
  int? tempareture;
  Widget? weatherIcon;
  String? weatherDescription;

  @override
  void initState() {
    super.initState();
    print("Print from location Screen ${widget.locationWeather}");
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = "";
        tempareture = 0;
        weatherIcon = null;
        weatherDescription = "Unable to get weather";
        return;
      }

      cityName = weatherData['name'];
      double temp = weatherData['main']['temp'] - 273;
      tempareture = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      print("Tempareture: $tempareture");
      weatherDescription = weather.getMessage(tempareture!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weather_image.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      //style: ButtonStyle(backgroundColor: Colors.transparent),
                      onPressed: () async {
                        var weatherData = await weather.getLoactionWeather();
                        updateUI(weatherData);
                        print(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        tempareture.toString(),
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      weatherIcon!,
                      // Container(
                      //   child: weatherIcon,
                      // )
                      // Icon(
                      //   Icons.wb_sunny,
                      //   size: 80,
                      //   color: Colors.orange,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      '${weatherDescription!.toString()} in $cityName',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
