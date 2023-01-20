import 'package:json_annotation/json_annotation.dart';
import 'package:map_test/model/weather.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {

  @JsonKey(name: 'lat')
  double lat;
  @JsonKey(name: 'lon')
  double lon;
  @JsonKey(name: 'sunrise')
  String sunrise;
  @JsonKey(name: 'sunset')
  String sunset;
  @JsonKey(name: 'timezone')
  String timezone;
  @JsonKey(name: 'city_name')
  String cityName;
  @JsonKey(name: 'country_code')
  String countryCode;
  @JsonKey(name: 'temp')
  double temp;
  @JsonKey(name: 'rh')
  double rh;
  @JsonKey(name: 'clouds')
  int clouds;
  @JsonKey(name: 'weather')
  Weather weather;

  Data({
    required this.lat,
    required this.lon,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
    required this.cityName,
    required this.countryCode,
    required this.temp,
    required this.rh,
    required this.clouds,
    required this.weather,
  });

  factory Data.fromJson(Map <String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}