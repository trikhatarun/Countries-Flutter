import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/ui/tabs/all/bloc/all_countries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesListItem extends StatefulWidget {

  CountryData countryData;

  CountriesListItem({Key key, this.countryData}) : super(key: key);

  @override
  _CountriesListItemState createState() => _CountriesListItemState();
}

class _CountriesListItemState extends State<CountriesListItem> {

  AllCountriesBloc _countriesBloc;

  @override
  void initState() {
    super.initState();
    _countriesBloc = BlocProvider.of<AllCountriesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
        leading: Text('${widget.countryData.code}', style: textTheme.caption),
        title: Text(widget.countryData.countryName),
        isThreeLine: true,
        subtitle: Text(widget.countryData.region),
        trailing: Image.asset(() {
          if(widget.countryData.isFavorite) {
            return 'assets/images/heart_filled.png';
          } else {
            return 'assets/images/heart_outlined.png';
          }
        }(), width: 24, height: 24),
        dense: true,
        onTap: () => setState(() {
          _countriesBloc.add(CountryAddedToFavorite(widget.countryData));
          widget.countryData = widget.countryData.copyWith(isFavorite: !widget.countryData.isFavorite);
        })
    );
  }
}
