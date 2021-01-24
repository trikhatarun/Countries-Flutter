import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/data/network/model/countries_response.dart';
import 'package:countries_app/data/network/rest_client.dart';
import 'package:equatable/equatable.dart';

part 'all_countries_event.dart';

part 'all_countries_state.dart';

const _pageLimit = 20;

class AllCountriesBloc extends Bloc<AllCountriesEvent, AllCountriesState> {
  int _dataLimit = 20;

  AllCountriesBloc(this.db, this.restClient) : super(const AllCountriesState());

  final RestClient restClient;
  final AppDatabase db;

  @override
  Stream<AllCountriesState> mapEventToState(AllCountriesEvent event) async* {
    if (event is CountriesFetched) {
      yield await _mapCountriesFetchedToState(state);
    }
  }

  Future<AllCountriesState> _mapCountriesFetchedToState(
      AllCountriesState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == AllCountriesStatus.initial) {
        final countries = await _fetchCountries();
        return state.copyWith(
          status: AllCountriesStatus.success,
          countries: countries,
          hasReachedMax: _hasReachedMax(state.countries.length),
        );
      }
      final countries = await _fetchCountries(state.countries.length);
      return countries.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: AllCountriesStatus.success,
              countries: List.of(state.countries)..addAll(countries),
              hasReachedMax: _hasReachedMax(state.countries.length + countries.length),
            );
    } on Exception {
      return state.copyWith(status: AllCountriesStatus.failure);
    }
  }

  Future<List<CountryData>> _fetchCountries([int offset = 0]) async {
    final response = await restClient.getCountries(_pageLimit, offset);
    _dataLimit = response.total;
    return _convertToCountryData(response);
  }

  List<CountryData> _convertToCountryData(CountryResponse response) {
    List<CountryData> countryList = List();

    response.data.forEach((key, value) {
      countryList.add(new CountryData(
          code: key,
          countryName: value.country,
          region: value.region,
          isFavorite: false));
    });

    return countryList;
  }

  bool _hasReachedMax(int countriesCount) =>
      countriesCount < _dataLimit ? false : true;
}
