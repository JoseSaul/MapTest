import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/widget/text_field.dart';

class SearchByPostalCodeWidget extends StatefulWidget {
  const SearchByPostalCodeWidget({super.key});

  @override
  createState() => _SearchByPostalCodeWidget();
}

class _SearchByPostalCodeWidget extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const EditText(message: 'Enter a postal code'),
          //Change this to selector
          const EditText(message: 'Enter a Country'),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {}, child: const Text('Search')),
        ],
      ),
    ));
  }
}
