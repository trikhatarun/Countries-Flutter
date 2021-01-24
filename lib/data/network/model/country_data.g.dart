// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryData _$CountryDataFromJson(Map<String, dynamic> json) {
  return CountryData(
    json['country'] as String,
    json['region'] as String,
  );
}

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'region': instance.region,
    };
