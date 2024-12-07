import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redriver/feautures/map_screen/widgets/map_base.dart';
import 'package:redriver/providers/applications_provider.dart';

class MapScreenWeb extends MapBase {
  const MapScreenWeb({super.key});

  @override
  MapScreenAndroidState createState() => MapScreenAndroidState();
}

class MapScreenAndroidState extends MapBaseState {
  @override
  Widget build(BuildContext context) {
    final applicationsAsyncValue = ref.watch(applicationsProvider);
    Set<Marker> markersApps = {};

    if (applicationsAsyncValue.value == null || currentPosition == null) {
      return const Center(child: CircularProgressIndicator());
    }

    markersApps = applicationsAsyncValue.value!
        .map((element) => Marker(
              onTap: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApplicationDetails(),
                  ),
                ); */
              },
              markerId: MarkerId(element.id),
              position: LatLng(
                  element.addressTo.coords.lat, element.addressTo.coords.long),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
            ))
        .toSet();
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      markers: markersApps.union(markers),
      initialCameraPosition: CameraPosition(target: currentPosition!, zoom: 15),
      onMapCreated: onMapCreated,
    );
  }
}
