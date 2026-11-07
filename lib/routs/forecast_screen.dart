import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routs/widgets/item_forecast_day.dart';

import '../services/providers/forecast_provider.dart';


class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(
        builder: (context, provider, child) {
          return provider.loading? Center(child: CircularProgressIndicator()):
          ListView(
            children: [
              for (var day in provider.forecastDays)
                ItemForecastDay(forecastDay: day)
            ],
          );
        }
    );
  }
}