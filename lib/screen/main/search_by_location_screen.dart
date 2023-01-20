import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/model/save_data_model.dart';
import 'package:map_test/repository/location_repository.dart';
import 'package:map_test/screen/detail_screen.dart';
import 'package:map_test/utils/saved_data.dart';
import 'package:map_test/widget/search_button.dart';
import 'package:map_test/widget/text_field.dart';

class SearchByLocationWidget extends StatefulWidget {
  const SearchByLocationWidget({super.key});

  @override
  createState() => _SearchByPostalCodeWidget();
}

class _SearchByPostalCodeWidget extends State<StatefulWidget> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  Future<void> onClick() async {
    await LocationRepository.getWeatherByLocation(
            latitudeController.text, longitudeController.text)
        .then((value) {
      SavedData.addSaveData(
        SaveDataModel(
            lat: value.data[0].lat.toString(),
            lon: value.data[0].lon.toString(),
            timeZone: value.data[0].timezone),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(value)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          EditText(
            message: 'Latitude (Degrees)',
            controller: latitudeController,
          ),
          EditText(
            message: 'Longitude (Degrees)',
            controller: longitudeController,
          ),
          const SizedBox(height: 30),
          SearchButton(function: () => onClick),
        ],
      ),
    ));
  }
}
