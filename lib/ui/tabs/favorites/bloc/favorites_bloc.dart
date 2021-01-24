import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:countries_app/data/db/app_database.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoritesBloc(this.db) : super(const FavoriteState());

  final AppDatabase db;

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if(event is FavoriteEvent) {
      yield await _mapCountriesFetchedToState(state);
    }
  }

  Future<FavoriteState> _mapCountriesFetchedToState(state) async {
    final countries = await db.countryDao.getAllFavorites();
    return state.copyWith(
      status: FavoriteStatus.success,
      countries: countries,
    );
  }
}
