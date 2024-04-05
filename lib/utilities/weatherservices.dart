import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherProvider extends ChangeNotifier {
  late Position _currentPosition; 
  WeatherData data = WeatherData(
    temperaturemin: "loading",
    city: "loading",
    weatherType: "loading",
    wind: "loading",
   
    humidity: "loading",
    feelslike: "loading",
     temperature: "loading",
      temperatuemax: "loading", sealevel: "loading", cityname: "",
  );

 
  Position get currentPosition => _currentPosition;

  Future<void> getCurrentLocation(String cityname) async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    await getWeatherData( cityname);
  }

  Future<void> getWeatherData(
    String cityname
  ) async {
    String url="";
    print(cityname);
    if(cityname=="")
    {
      url="https://api.openweathermap.org/data/2.5/weather?lat=${_currentPosition.latitude}&lon=${_currentPosition.longitude}&appid=cd6516b46fed84bc7975eeef43d2604d";
    }
    else{
      print("inside");
      url ="https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=cd6516b46fed84bc7975eeef43d2604d";
    }
    final response = await http.get(Uri.parse(
        url));
     print(response.body);
    if (response.statusCode == 200) {
      final weatherData = json.decode(response.body);
   
      data = WeatherData(
        city: weatherData['name'],
        weatherType: weatherData['weather'][0]['main'],
        temperaturemin: (weatherData['main']["temp_min"] - 273.15),
        humidity: weatherData['main']['humidity'],
         wind: weatherData['wind']['speed'],
          temperature:(weatherData['main']["temp"] - 273.15),
           temperatuemax: (weatherData['main']["temp_max"] - 273.15),
          
            feelslike: weatherData['main']["feels_like"] - 273.15,
             sealevel: weatherData['main']["sea_level"],
              cityname: "", 
      );
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class WeatherData {
  final dynamic temperature;
  final dynamic temperaturemin;
  final dynamic city;
  final dynamic weatherType;
  final dynamic wind;
  final dynamic humidity;
  final dynamic temperatuemax;
  final dynamic feelslike;
   final dynamic sealevel;
   final dynamic cityname;

  WeatherData( {
    required this.temperature,
    required this.temperaturemin,
    required this.city,
    required this.weatherType,
    required this.wind,
  required this.sealevel,
    required this.humidity,
    required this.temperatuemax,
    required this.feelslike,
    required this.cityname,
  });
}
