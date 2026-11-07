import 'package:flutter/material.dart';
import '../models/current_model.dart';
import '../models/current_weather_response.dart';
import '../models/location_model.dart';
import '../repositories/weather_repo.dart';


class HomeProvider with ChangeNotifier {
  WeatherRepo repo;
  LocationModel? location;
  CurrentModel? current;
  bool loading = false;

  HomeProvider(this.repo) {
    getCurrentWeather('Chakdara');
  }

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