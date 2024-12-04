import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapScreenInterface {
  final CameraPosition kameraPositionInit;
  const MapScreenInterface({required this.kameraPositionInit});

  Widget build(BuildContext context);
}
