import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_test/screen/main/history_screen.dart';
import 'package:map_test/screen/main/search_by_location_screen.dart';
import 'package:map_test/screen/main/search_by_postal_code_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Coordinates'),
                  Tab(text: 'Postal Code'),
                  Tab(text: 'History'),
                ],
              ),
              title: const Text('Weather App')),
          body: const Padding(
            padding: EdgeInsets.all(20),
            child: TabBarView(
              children: [
                SearchByLocationWidget(),
                SearchByPostalCodeWidget(),
                HistoryScreen(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
