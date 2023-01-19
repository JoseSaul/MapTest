import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {

  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'icon')
  String icon;
  @JsonKey(name: 'description')
  String description;

  Weather({
    required this.code,
    required this.icon,
    required this.description,
  });

  factory Weather.fromJson(Map <String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}