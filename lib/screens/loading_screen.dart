import 'dart:convert';

import 'package:climator/screens/location_screen.dart';
import 'package:climator/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = new Location();
    await location.getLocation();
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

  void getData() async {
    Response response = await get(
        "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22");
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var temperature = decodeData['main']['temp'];
      var condition = decodeData['weather'][0]['id'];
      var cityName = decodeData['name'];
      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getData();
            //Get the current location
          },
          child: Text('Get Your Location NOW'),
        ),
      ),
    );
  }
}
