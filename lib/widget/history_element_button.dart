import 'package:flutter/material.dart';

import '../repository/location_repository.dart';
import '../screen/detail_screen.dart';

class HistoryElementButton extends StatelessWidget {
  const HistoryElementButton(this.timezone, this.lat, this.lon, {Key? key})
      : super(key: key);

  //final Function(String, String) function;
  final String timezone, lat, lon;

  Future<void> onClick(BuildContext context) async {
    await LocationRepository.getWeatherByLocation(lat, lon).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(value)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(context),
      child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(width: 1, color: Colors.black12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(timezone),
              Text(lat),
              Text(lon),
            ],
          )),
    );
  }
}
