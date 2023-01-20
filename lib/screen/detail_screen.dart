import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/model/result.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.result, {super.key});

  Result result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text(result.data[0].cityName),
        ),
      ),
    );
  }
}