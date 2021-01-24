import 'package:moor_flutter/moor_flutter.dart';

class Country extends Table {
  TextColumn get code => text().withLength(min: 1, max: 2)();
  TextColumn get countryName => text()();
  TextColumn get region => text()();
  BoolColumn get isFavorite => boolean().withDefault(Constant(false))();
}