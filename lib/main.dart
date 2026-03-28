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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 16),
                child: Center(
                  child: Column(
                    children: [
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
                            
                            // grid 
                            Container
                            (
                              padding: const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 20),
                              decoration: BoxDecoration
                                (
                                  color: const Color(0xFFD0D7DF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              child: GridView.count
                              (
                                crossAxisCount: 4,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                children: weatherForecast
                                    .map
                                    (
                                      (forecast) => buildBox
                                        (
                                          forecast["time"],
                                          forecast["icon"],
                                          forecast["temp"],
                                        ),
                                    )
                                    .toList(),
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

              // navigation
              Container
              (
                padding: const EdgeInsets.symmetric
                  (
                    vertical: 24,
                    horizontal: 20,
                  ),
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NavItem
                      (
                        Icons.home,
                        "Home",
                        _selectedIndex == 0,
                        onTap: () => _onNavItemTapped(0),
                      ),

                    const SizedBox(width: 60),

                    NavItem
                      (
                        Icons.search,
                        "Search",
                        _selectedIndex == 1,
                        onTap: () => _onNavItemTapped(1),
                      
                      ),

                    const SizedBox(width: 60),

                    NavItem
                      (
                        Icons.person,
                        "Profile",
                        _selectedIndex == 2,
                        onTap: () => _onNavItemTapped(2),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

// nav item widget
class NavItem extends StatelessWidget 
{
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const NavItem
  (
    this.icon,
    this.label,
    this.active, 
    {
    required this.onTap,
    super.key,
    }
  );
  

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap: onTap,
      child: Column
      (
        children: 
        [
          CircleAvatar
            (
              radius: 20,
              backgroundColor: active ? Colors.blue : Colors.grey,
              child: Icon(icon, color: Colors.white),
            ),
          const SizedBox(height: 10),
          Text
            (
              label,
              style: TextStyle(color: active ? Colors.blue : Colors.grey),
            ),
        ],
      ),
    );
  }
}

// 
Widget buildBox(String time, IconData icon, String temp) 
{
  return Container
  (
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
    decoration: BoxDecoration
      (
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    child: Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
      [
        Text(time, style: const TextStyle(fontSize: 12)),
        Icon(icon, color: Colors.orange, size: 24),
        Text
          (
            temp,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    ),
  );
}
