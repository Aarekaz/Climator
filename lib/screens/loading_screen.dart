import 'dart:convert';

import 'package:climator/screens/location_screen.dart';
import 'package:climator/services/location.dart';
import 'package:climator/services/networking.dart';
import 'package:climator/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  void getLocation() async {
    var decodeData = await WeatherModel().getLocation();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(decodeData)));
  }

  @override
  void deactivate() {
    super.deactivate();
    print("The screen is closed");
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.blue,
        ),
      ),
    );
  }
}
