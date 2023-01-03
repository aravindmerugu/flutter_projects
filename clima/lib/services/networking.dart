import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {

  Networkhelper({
    this.lat,
    this.lon,
    this.cityName
  });
  final String? lat;
  final String? lon;
  final String? cityName;
  Future getData() async {
    http.Response response = await http.get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': lat,
          'lon': lon,
          'appid': '3170a394388f24e5673779d8f4677285',
          'units': 'metric',
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getCityData() async {
    http.Response response = await http.get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': cityName,
          'appid': '3170a394388f24e5673779d8f4677285',
          'units': 'metric',
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

}