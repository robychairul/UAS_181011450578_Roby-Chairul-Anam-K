import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uas_181011450578_roby/weather_model.dart';

//https://api.openweathermap.org/data/2.5/weather?q=_NAMA_KOTA_&appid=b5bedb63d4f648d38784f1b284518479 
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//appid = b5bedb63d4f648d38784f1b284518479

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      final queryParameter = {
        'q': cityName,
        'appid': 'b5bedb63d4f648d38784f1b284518479',
        'units': 'metric'
      };
      final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final response = await http.get(uri);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
