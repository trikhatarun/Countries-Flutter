import 'package:countries_app/data/db/app_database.dart';
import 'package:flutter/material.dart';

class CountriesListItem extends StatelessWidget {
  const CountriesListItem({Key key, @required this.countryData}) : super(key: key);

  final CountryData countryData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${countryData.code}', style: textTheme.caption),
      title: Text(countryData.countryName),
      isThreeLine: true,
      subtitle: Text(countryData.region),
      trailing: Image.asset(() {
        if(countryData.isFavorite) {
          return 'assets/images/heart_filled.png';
        } else {
          return 'assets/images/heart_outlined.png';
        }
      }(), width: 24, height: 24),
      dense: true,
    );
  }
}
