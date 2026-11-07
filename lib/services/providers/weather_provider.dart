import 'package:flutter/material.dart';
import '../models/current_model.dart';
import '../models/current_weather_response.dart';
import '../models/location_model.dart';
import '../repositories/weather_repo.dart';

class WeatherProvider with ChangeNotifier {
  WeatherRepo repo;
  bool loading = false;
  LocationModel? location;
  CurrentModel? current;

  WeatherProvider(this.repo);

  getCurrentWeather(String city) async {
    loading = true;
    notifyListeners();
    CurrentWeatherResponse? res = await repo.getCurrentWeather(city);
    print(res);
    if (res != null) {
      location = res.location;
      current = res.current;
    }
    loading = false;
    notifyListeners();
  }
}