class SaveDataModel {
  final String lat, lon, timeZone;

  SaveDataModel({required this.lat, required this.lon, required this.timeZone});

  factory SaveDataModel.fromJson(Map<String, dynamic> parsedJson) {
    return SaveDataModel(
      lat: parsedJson['lat'],
      lon: parsedJson['lon'],
      timeZone: parsedJson['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"lat": lat, "lon": lon, "timezone": timeZone};
  }
}
