// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return CountryResponse(
    json['total'] as int,
    (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : CountryData.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };
