import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/data/network/rest_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'all_countries_event.dart';

part 'all_countries_state.dart';

//find a way to substitute this data from api
const _dataLimit = 251;
const _pageLimit = 20;

class AllCountriesBloc extends Bloc<AllCountriesEvent, AllCountriesState> {
  AllCountriesBloc({@required this.restClient})
      : super(const AllCountriesState());

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
        final posts = await _fetchCountries();
        return state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: _hasReachedMax(posts.length),
        );
      }
      final posts = await _fetchPosts(state.posts.length);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
        status: PostStatus.success,
        posts: List.of(state.posts)
          ..addAll(posts),
        hasReachedMax: _hasReachedMax(posts.length),
      );
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }

  Future<List<CountryData>> _fetchCountries([int startIndex = 0]) async {
    await restClient.getCountries(_pageLimit, startIndex).then((value) => {
      return _convertToCountryData(value)
    }).catchError((Object obj) {
      // non-200 error goes here.
      print(obj);
    });
  }
}

bool _hasReachedMax(int countriesCount) =>
    countriesCount < _dataLimit ? false : true;}
