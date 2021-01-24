import 'package:countries_app/ui/tabs/favorites/bloc/favorites_bloc.dart';
import 'package:countries_app/ui/tabs/favorites/favorites_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCountriesList extends StatefulWidget {
  @override
  _FavoriteCountriesState createState() => _FavoriteCountriesState();
}

class _FavoriteCountriesState extends State<FavoriteCountriesList> {
  FavoritesBloc _countriesBloc;

  @override
  void initState() {
    super.initState();
    _countriesBloc = context.read<FavoritesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoriteState>(
      builder: (context, state) {
        switch (state.status) {
          case FavoriteStatus.failure:
            return const Center(
                child: Text(
                    'Failed to fetch favorites'));
          case FavoriteStatus.success:
            if (state.countries.isEmpty) {
              return const Center(child: Text('You do not have any favorites, Please add some from all countries tab'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return FavoriteListItem(
                    countryData: state.countries[index]);
              },
              itemCount: state.countries.length,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _countriesBloc.close();
    super.dispose();
  }
}
