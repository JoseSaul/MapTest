import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/utils/saved_data.dart';
import 'package:map_test/widget/history_element_button.dart';

import '../../model/save_data_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  createState() => _HistoryScreen();
}

class _HistoryScreen extends State<StatefulWidget> {
  List<SaveDataModel> list = [];

  @override
  void initState() {
    super.initState();
    SavedData.getSavedData().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list == []) {
      return const Center(
          child: Text('Your search history will be displayed here'));
    } else {
      List<Widget> buttons = [];
      for (var element in list) {
        buttons.add(HistoryElementButton(
          element.timeZone,
          element.lat,
          element.lon,
        ));
      }

      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: buttons,
              ),
            ),
          ),
        ],
      );
    }
  }
}
