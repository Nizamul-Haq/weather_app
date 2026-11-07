import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routs/main_screen.dart';
import 'package:weather_app/routs/splash_screen.dart';
import 'package:weather_app/services/providers/forecast_provider.dart';
import 'package:weather_app/services/providers/home_provider.dart';
import 'package:weather_app/services/providers/main_provider.dart';
import 'package:weather_app/services/providers/search_provider.dart';
import 'package:weather_app/services/providers/weather_provider.dart';
import 'package:weather_app/services/repositories/weather_repo.dart';
import 'package:weather_app/services/weather_api/weather_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainProvider()),
          Provider(create: (context) => WeatherApi()),
          Provider(create: (context) => WeatherRepo(context.read<WeatherApi>())),
          ChangeNotifierProvider(create: (context) =>
              HomeProvider(context.read<WeatherRepo>())),
          ChangeNotifierProvider(create: (context) =>
              ForecastProvider(context.read<WeatherRepo>())),
          ChangeNotifierProvider(create: (context) =>
              SearchProvider(context.read<WeatherRepo>())),
          ChangeNotifierProvider(create: (context) =>
              WeatherProvider(context.read<WeatherRepo>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        )
    );
  }
}