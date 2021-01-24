import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/ui/tabs/favorites/bloc/favorites_bloc.dart';
import 'package:countries_app/ui/tabs/favorites/favorite_countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCountries extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) =>
        FavoritesBloc(AppDatabase())
          ..add(CountriesFetched()),
        child: FavoriteCountriesList(),
      ),
    );
  }
}