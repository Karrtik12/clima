import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude = 200, latitude = 200;

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
        centerTitle: true,
      ),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () async {
      //       LocationPermission permission =
      //           await Geolocator.requestPermission();
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}
