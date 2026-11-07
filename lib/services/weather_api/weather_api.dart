import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/current_weather_response.dart';
import '../models/forecast_day_model.dart';
import '../models/search_model.dart';

class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<CurrentWeatherResponse?> getCurrentWeather(String city) async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/current.json?key=2564abb489474eab9c2134137260611&q=$city&aqi=no'));
      final data = jsonDecode(res.body);
      CurrentWeatherResponse response = CurrentWeatherResponse.fromJson(data);
      return response;
    }catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<ForecastDayModel>> getForecast(String city, int days) async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/forecast.json?key=2564abb489474eab9c2134137260611&q=$city&days=$days&aqi=no&alerts=no'));
      final data = jsonDecode(res.body);
      List dataList = data['forecast']['forecastday'];
      List<ForecastDayModel> forecastDays = dataList.map((e) =>
          ForecastDayModel.fromJson(e)).toList();
      return forecastDays;
    }catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SearchModel>> searchRegion(String city) async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/search.json?key=2564abb489474eab9c2134137260611&q=$city'));
      List data = jsonDecode(res.body);
      List<SearchModel> items = data.map((e) => SearchModel.fromJson(e)).toList();
      return items;
    }catch (e) {
      print(e);
    }
    return [];
  }
}