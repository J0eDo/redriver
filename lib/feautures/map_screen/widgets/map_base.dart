import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redriver/feautures/map_screen/utils.dart';

abstract class MapBase extends ConsumerStatefulWidget {
  const MapBase({super.key});
}

abstract class MapBaseState extends ConsumerState<MapBase> {
  late GoogleMapController mapController;
  LatLng? currentPosition;
  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    Geolocator.getPositionStream().listen((Position position) async {
      LatLng newPosition = LatLng(position.latitude, position.longitude);
      final icon =
          await bitmapDescriptorFromSvgAsset('/icons/navigation-arrow.svg');
      setState(() {
        currentPosition = newPosition;
        markers.clear();
        markers.add(
          Marker(
            icon: icon,
            markerId: const MarkerId('current_location'),
            position: newPosition,
            infoWindow: const InfoWindow(title: 'Вы здесь'),
          ),
        );
      });

      mapController.animateCamera(
        CameraUpdate.newLatLng(newPosition),
      );
    });
  }

  Future<void> _initializeLocation() async {
    bool hasPermission = await requestLocationPermission();
    if (!hasPermission) {
      return;
    }

    Position position = await getCurrentPosition();
    final icon =
        await bitmapDescriptorFromSvgAsset('/icons/navigation-arrow.svg');
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
      markers.add(
        Marker(
            markerId: const MarkerId('current_location'),
            position: currentPosition!,
            infoWindow: const InfoWindow(title: 'Вы здесь'),
            icon: icon),
      );
    });
  }

  @override
  Widget build(BuildContext context);
}
