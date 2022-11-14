import 'dart:convert';

import 'package:http/http.dart';

class WeatherDataFromAPI {
  Future<WeatherData> getData(String location) async {
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2350998113c6a9834a0b71767b6d385d&units=metric'),
    );
    Map data = jsonDecode(response.body);
    return mapMapToWeatherData(data);
  }
}

class WeatherData {
  var weatherMain;
  var weatherDescription;
  var temperature;
  var temperatureMin;
  var temperatureMax;
  var cityName;
  var icon;
  var countryName;

  WeatherData(
      this.weatherMain,
      this.weatherDescription,
      this.temperature,
      this.cityName,
      this.temperatureMax,
      this.temperatureMin,
      this.icon,
      this.countryName);
}

WeatherData mapMapToWeatherData(Map data) {
  return WeatherData(
    data['weather'][0]['main'],
    data['weather'][0]['description'],
    data['main']['temp'],
    data['name'],
    data['main']['temp_max'],
    data['main']['temp_min'],
    data['weather'][0]['icon'],
    data['sys']['country'],
  );
}
