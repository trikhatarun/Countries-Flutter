import 'package:countries_app/data/db/dao/country_dao.dart';
import 'package:countries_app/data/db/model/country.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Country], daos: [CountryDao])
class AppDatabase extends _$AppDatabase {

  AppDatabase(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: false));

  @override
  int get schemaVersion => 1;
}