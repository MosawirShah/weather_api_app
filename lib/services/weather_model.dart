import 'package:weather_app2/services/location.dart';
import 'package:weather_app2/services/networking.dart';

const apiKey = '5f7c435ad58034456116891cfef110eb';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
//City name based weather
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");

    var weatherData = networkHelper.getData();
    return weatherData;
  }

//Location Based weather
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    var myLocation = await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
