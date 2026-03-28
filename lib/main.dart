import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
  {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) 
      {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WeatherPage(),
        );
      }
  }

class WeatherPage extends StatefulWidget 
  {
    const WeatherPage({super.key});

    @override
    State<WeatherPage> createState() => _WeatherPageState();
  }

class _WeatherPageState extends State<WeatherPage> 
{
    int _selectedIndex = 0;

    final List<Map<String, dynamic>> weatherForecast = 
    [
      {"time": "10:00", "icon": Icons.wb_sunny, "temp": "26°C"},
      {"time": "11:00", "icon": Icons.wb_sunny, "temp": "27°C"},
      {"time": "13:00", "icon": Icons.cloud, "temp": "25°C"},
      {"time": "13:00", "icon": Icons.cloud, "temp": "24°C"},
      {"time": "10:00", "icon": Icons.wb_sunny, "temp": "25°C"},
      {"time": "14:00", "icon": Icons.grain, "temp": "24°C"},
      {"time": "14:00", "icon": Icons.cloud, "temp": "23°C"},
      {"time": "15:00", "icon": Icons.grain, "temp": "22°C"},
    ];

  void _onNavItemTapped(int index) 
    {
      setState(() 
      {
        _selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) 
  {
    var column = Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const 
        [
          Text
            (
              "25°C",
              style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Cloudy with a chance of sunshine"),
            Text("London, UK"),
        ],
    );
    return Scaffold
    (
      backgroundColor: const Color(0xFFE6EBF1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 65),

              const Text
                (
                  "Weather Dashboard",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

              const SizedBox(height: 20),

              // main card
              Container
              (
                width: 520,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration
                (
                  color: const Color(0xFFDCE2E8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row
                      (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon
                            (
                              Icons.wb_cloudy,
                              size: 140,
                              color: Colors.orange,
                            ),
                          column,
                        ],
                      ),

                    const SizedBox(height: 10),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
