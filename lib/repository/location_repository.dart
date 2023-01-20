import 'package:map_test/net/api_client.dart';
import 'package:dio/dio.dart';

import '../model/result.dart';

class LocationRepository {
  static Future<Result> getWeatherByLocation(String lat, String lon) async {
    return await ApiClient(Dio()).getCurrentWeather(lat, lon);
  }

  static Future<Result> getWeatherByPostalCode(
      String postalCode, String country) async {
    return await ApiClient(Dio())
        .getCurrentWeatherByPostalCode(postalCode, country);
  }
}
