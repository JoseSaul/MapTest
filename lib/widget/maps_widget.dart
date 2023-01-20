import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatelessWidget {
  const MapsWidget({Key? key, required this.lat, required this.lon})
      : super(key: key);

  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, lon), zoom: 15),
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        mapType: MapType.normal,
      ),
    );
  }
}
