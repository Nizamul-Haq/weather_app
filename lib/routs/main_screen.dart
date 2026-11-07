import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routs/search_screen.dart';
import '../services/providers/main_provider.dart';
import 'forecast_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> widgets = [
    HomeScreen(),
    SearchScreen(),
    ForecastScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Scaffold(
      appBar: AppBar(

      ),
      body: widgets[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          provider.changeIndex(index);
        },
        currentIndex: provider.currentIndex,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), label: 'Forecast'),
        ],
      ),
    );
  }
}