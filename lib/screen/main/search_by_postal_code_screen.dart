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
          DropdownButton<String>(
            value: _selectedItem,
            items: getItems(),
            onChanged: onSelected,
          ),
          const SizedBox(height: 30),
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
