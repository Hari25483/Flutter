import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  String apiKey = "9a35db82a1d6216204de70f210a9fa27";
  String openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<dynamic> getCityWeather(String cityName) async {
    String url = "$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var Weatherdata = await networkHelper.getData();
    return Weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.get_current_Location();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric");
    var Weatherdata = await networkHelper.getData();

    return Weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
