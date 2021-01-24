import 'package:json_annotation/json_annotation.dart';

part 'country_data.g.dart';

@JsonSerializable()
class CountryData {
  final String country;
  final String region;

  CountryData(this.country, this.region);

  factory CountryData.fromJson(Map<String, dynamic> json) => _$CountryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}