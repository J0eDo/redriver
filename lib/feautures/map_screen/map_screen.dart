import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:redriver/feautures/map_screen/widgets/map_applications_list.dart';
import 'package:redriver/feautures/map_screen/widgets/map_screen_android.dart';
import 'package:redriver/feautures/map_screen/widgets/map_screen_web.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          if (kIsWeb)
            const MapScreenWeb()
          else if (Platform.isAndroid)
            const MapScreenAndroid()
          else
            Text(Platform.localeName),
          const MapApplicationsList()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
