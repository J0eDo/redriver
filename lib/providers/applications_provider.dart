import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redriver/dto/application.dart';

final applicationsProvider = FutureProvider<List<Application>>((ref) async {
  final url = Uri.parse('https://app.relog.kz/api/applications');

  final response = await http.post(
    url,
    headers: {
      'Accept': 'application/json, text/plain, */*',
      'Accept-Encoding': 'gzip, deflate, br, zstd',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
      'Content-Length': '115',
      'Content-Type': 'application/json',
      'Origin': 'https://app.relog.kz',
      'User-Agent':
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
      'Cookie':
          '_ym_uid=1728301627429766363; _ym_d=1732473360; _ym_isad=2; _gid=GA1.2.140947550.1732473361; '
              'amp_822625=LOD7nOYWl1zOHcM7-aP3Br...1idfpejlf.1idfpejlf.0.0.0; '
              '_ga_R381NB7C29=GS1.1.1732475573.2.0.1732475573.60.0.0; '
              '_ga=GA1.2.2032872793.1732473361',
      'Sec-CH-UA':
          '"Google Chrome";v="129", "Not=A?Brand";v="8", "Chromium";v="129"',
      'Sec-CH-UA-Mobile': '?0',
      'Sec-CH-UA-Platform': '"Linux"',
      'Sec-Fetch-Dest': 'empty',
      'Sec-Fetch-Mode': 'cors',
      'Sec-Fetch-Site': 'same-origin',
    },
    body: jsonEncode({
      "userId": "GHdLa7JrzxbaukbiC",
      "routes": ["kom2rmTaYRHpvAeMw"],
      "activeRouteId": "kom2rmTaYRHpvAeMw",
      "searchString": "",
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    return (responseBody['data'] as List).map((json) {
      try {
        final application = Application.fromJson(json);
        return application;
      } catch (e) {
        print('Error during deserialization: $e');
        print('JSON: $json');
      }

      return Application.fromJson(json);
    }).toList();
  } else {
    throw Exception('Failed to fetch applications: ${response.statusCode}');
  }
});
