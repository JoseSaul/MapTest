import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/widget/text_field.dart';

import '../../repository/location_repository.dart';
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

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getItems() {
      List<DropdownMenuItem<String>> list = [];
      items.forEach((key, value) {
        list.add(DropdownMenuItem<String>(value: key, child: Text(value)));
      });

      return list;
    }

    Future<void> onClick() async {
      await LocationRepository.getWeatherByPostalCode(
          postalController.text, _selectedItem)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(value)),
        );
      });
    }

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
                    color:Colors.lightBlue, //background color of dropdown button//border of dropdown button
                    borderRadius: BorderRadius.all(Radius.circular(8)), //border raiuds of dropdown button
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton<String>(
                      icon: const Padding(
                        padding: EdgeInsets.only(left:20),
                        child: Icon(Icons.arrow_circle_down_sharp),
                      ),
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(  //te
                          color: Colors.white, //Font color
                          fontSize: 20 //font size on dropdown button
                      ),
                      dropdownColor: Colors.lightBlue,
                      underline: Container(),
                      isExpanded: true,
                      value: _selectedItem,
                      items: getItems(),
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

Map<String, String> items = {
  "AF": "Afghanistan",
  "AL": "Albania",
  "DZ": "Algeria",
  "AD": "Andorra",
  "AQ": "Antarctica",
  "AR": "Argentina",
  "AM": "Armenia",
  "AU": "Australia",
  "AT": "Austria",
  "BO": "Bolivia ",
  "BR": "Brazil",
  "BG": "Bulgaria",
  "CV": "Cabo Verde",
  "KH": "Cambodia",
  "CA": "Canada",
  "CN": "China",
  "CO": "Colombia",
  "CR": "Costa Rica",
  "EG": "Egypt",
  "ET": "Ethiopia",
  "FI": "Finland",
  "FR": "France",
  "GE": "Georgia",
  "DE": "Germany",
  "GR": "Greece",
  "HK": "Hong Kong",
  "IS": "Iceland",
  "ID": "Indonesia",
  "IT": "Italy",
  "JP": "Japan",
  "NZ": "New Zealand",
  "SI": "Slovenia",
  "ZA": "South Africa",
  "ES": "Spain",
  "TR": "Turkey",
  "UA": "Ukraine",
};
