import 'package:flutter/material.dart';
import 'package:map_test/repository/country_list.dart';
import 'package:map_test/widget/text_field.dart';

import '../../model/save_data_model.dart';
import '../../repository/location_repository.dart';
import '../../utils/saved_data.dart';
import '../../widget/search_button.dart';
import '../detail_screen.dart';

class SearchByPostalCodeWidget extends StatefulWidget {
  const SearchByPostalCodeWidget({super.key});

  @override
  createState() => _SearchByPostalCodeWidget();
}

class _SearchByPostalCodeWidget extends State<StatefulWidget> {
  TextEditingController postalController = TextEditingController();
  String _selectedItem = 'ES';

  void onSelected(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _selectedItem = selectedValue;
      });
    }
  }

  Future<void> onClick() async {
    await LocationRepository.getWeatherByPostalCode(
        postalController.text, _selectedItem)
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
    List<DropdownMenuItem<String>> list = [];
    Map<String, String> items = CountryList().items;
    items.forEach((key, value) {
      list.add(DropdownMenuItem<String>(value: key, child: Text(value)));
    });

    return Center(
        child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          EditText(
            message: 'Enter a postal code',
            controller: postalController,
          ),
          const SizedBox(height: 15),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                //background color of dropdown button//border of dropdown button
                borderRadius: BorderRadius.all(
                    Radius.circular(8)), //border raiuds of dropdown button
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButton<String>(
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_circle_down_sharp),
                  ),
                  iconEnabledColor: Colors.white,
                  style: const TextStyle(
                      //te
                      color: Colors.white, //Font color
                      fontSize: 20 //font size on dropdown button
                      ),
                  dropdownColor: Colors.lightBlue,
                  underline: Container(),
                  isExpanded: true,
                  value: _selectedItem,
                  items: list,
                  onChanged: onSelected,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SearchButton(function: () => onClick),
        ],
      ),
    ));
  }
}
