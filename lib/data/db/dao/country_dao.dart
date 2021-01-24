import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/data/db/model/country.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'country_dao.g.dart';

@UseDao(tables: [Country])
class CountryDao extends DatabaseAccessor<AppDatabase> with _$CountryDaoMixin {
  final AppDatabase db;

  CountryDao(this.db): super(db);

  Stream<List<CountryData>> watchAllFavorites() => select(country).watch();
  Future insertFavorite(CountryData favorite) => into(country).insert(favorite);
  Future removeFavorite(CountryData favorite) => delete(country).delete(favorite);
}