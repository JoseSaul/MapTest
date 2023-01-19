import 'package:flutter/material.dart';
import 'package:map_test/widget/main/search_by_postal_code_widget.dart';

void main() {
  runApp(const MyApp());
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
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather App')),
        body: const SearchByPostalCodeWidget(),
      ),
    );
  }
}
