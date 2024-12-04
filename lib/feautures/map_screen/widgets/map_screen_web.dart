import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redriver/feautures/map_screen/map_screen_interface.dart';

class MapScreenWeb extends StatelessWidget implements MapScreenInterface {
  @override
  final CameraPosition kameraPositionInit;

  const MapScreenWeb({
    super.key,
    required this.kameraPositionInit,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: kameraPositionInit,
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
