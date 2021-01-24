import 'package:json_annotation/json_annotation.dart';
import 'country.dart';

part 'countries_response.g.dart';

@JsonSerializable()
class CountryResponse {
  final List<Map<String, Country>> data;

  CountryResponse(this.data);

  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}