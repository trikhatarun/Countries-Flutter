import 'package:countries_app/utils/tuple.dart';

import 'db/app_database.dart';
import 'network/rest_client.dart';

const _pageLimit = 20;

class CountryRepository {
  final RestClient restClient;
  final AppDatabase db;

  CountryRepository(this.restClient, this.db);

  Future<Tuple<int, List<CountryData>>> fetchCountryPage(int offset) async {
    final countriesData = await restClient.getCountries(_pageLimit, offset).then((value) => null);
  }
}