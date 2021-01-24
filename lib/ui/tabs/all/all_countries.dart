import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/data/network/rest_client.dart';
import 'package:countries_app/ui/tabs/all/all_countries_list.dart';
import 'package:countries_app/ui/tabs/all/bloc/all_countries_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) =>
            AllCountriesBloc(Provider.of<AppDatabase>(context), new RestClient(new Dio()))
              ..add(CountriesFetched()),
        child: AllCountriesList(),
      ),
    );
  }
}
