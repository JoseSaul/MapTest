import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/result.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.weatherbit.io/v2.0")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static const String key = '0002decaf68c4f458d447f0cc796fc1b';

  @GET('/current?key=$key')
  Future<Result> getCurrentWeather(
      @Query('lat') String lat, @Query('lon') String lon);

  @GET('/current?key=$key')
  Future<Result> getCurrentWeatherByPostalCode(
      @Query('postal_code') String postalCode,
      @Query('country') String country);

}
