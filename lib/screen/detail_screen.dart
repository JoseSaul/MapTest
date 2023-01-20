import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_test/model/result.dart';
import 'package:map_test/widget/text_view.dart';

import '../model/data.dart';
import '../widget/maps_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.result, {super.key});

  final Result result;

  @override
  Widget build(BuildContext context) {
    Data? data = result.data[0];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Column(
          children: [
            Container(
              height: 280,
              color: Colors.lightBlueAccent.shade100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextView('Time Zone: ',data.timezone),
                    TextView('City: ','${data.cityName}, ${data.countryCode}'),
                    TextView('Latitude: ','${data.lat}º'),
                    TextView('Longitude: ','${data.lon}º'),
                    TextView('Sunrise time: ',data.sunrise),
                    TextView('Sunset time: ',data.sunset),
                    TextView('Temperature: ','${data.temp}º'),
                    TextView('Humidity : ','${data.rh}%'),
                    TextView('Clouds : ','${data.clouds}%'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Expanded(child: MapsWidget(lat: data.lat, lon: data.lon)),
          ],
        ));
  }
}
//MapsWidget(lat: data.lat ?? 0, lon: data.lon ?? 0),
