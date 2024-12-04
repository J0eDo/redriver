import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:redriver/feautures/map_screen/widgets/map_screen_android.dart';
import 'package:redriver/feautures/map_screen/widgets/map_screen_web.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  GoogleMapController? mapController;
  final Set<Polyline> _polylines = {};
  List<LatLng> _routeCoords = [];
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 14,
  );

  final String _apiKey = "AIzaSyBzoVTDYE5kF3nNv2nAL3cKS2kkX-24ZKI";
  @override
  void initState() {
    super.initState();

    _getRoute();
  }

  Future<void> _getRoute() async {
    const origin = LatLng(43.238949, 76.889709);
    const destination = LatLng(43.2566889, 76.9288721);

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['routes'].isNotEmpty) {
        final points = data['routes'][0]['overview_polyline']['points'];

        _addPolyline(points);
      }
    } else {
      print('Error fetching directions: ${response.statusCode}');
    }
  }

  void _addPolyline(String encodedPolyline) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(encodedPolyline);

    if (result.isNotEmpty) {
      _routeCoords = result
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      if (mounted) {
        setState(() {
          _polylines.add(Polyline(
            polylineId: const PolylineId('route'),
            points: _routeCoords,
            color: Colors.blue,
            width: 5,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (kIsWeb) {
      return MapScreenWeb(kameraPositionInit: initialPosition);
    } else if (Platform.isAndroid) {
      return MapScreenAndroid(kameraPositionInit: initialPosition);
    } else {
      return Text(Platform.localeName);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
