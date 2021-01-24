import 'package:countries_app/data/model/countries_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.first.org/data/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("countries")
  Future<CountryResponse> getCountries();
}