import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longtitude;
  void initState() {
    super.initState();
    print("Init state called.");
  }

  void getLocation() async {
    Location location = new Location();
    await location.get_current_Location();
    longtitude = location.longtitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=9a35db82a1d6216204de70f210a9fa27&units=metric");

    var Weatherdata = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: Weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocation();

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
