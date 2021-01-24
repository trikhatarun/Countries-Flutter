import 'package:countries_app/data/db/app_database.dart';
import 'package:flutter/material.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({Key key, @required this.countryData}) : super(key: key);

  final CountryData countryData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${countryData.code}', style: textTheme.caption),
      title: Text(countryData.countryName),
      isThreeLine: true,
      subtitle: Text(countryData.region),
      dense: true,
    );
  }
}