import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redriver/dto/application.dart';
import 'package:redriver/dummy/applications_dummy.dart';

final applicationsProvider = FutureProvider<List<Application>>((ref) async {
  return applicationsDummy.map((json) {
    return Application.fromJson(json);
  }).toList();
});
