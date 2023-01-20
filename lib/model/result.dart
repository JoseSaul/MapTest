import 'package:json_annotation/json_annotation.dart';
import 'package:map_test/model/data.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {

  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'data')
  List<Data> data;

  Result({
    required this.count,
    required this.data,
  });

  factory Result.fromJson(Map <String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}