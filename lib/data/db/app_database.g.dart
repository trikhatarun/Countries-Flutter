// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CountryData extends DataClass implements Insertable<CountryData> {
  final String code;
  final String countryName;
  final String region;
  final bool isFavorite;
  CountryData(
      {@required this.code,
      @required this.countryName,
      @required this.region,
      @required this.isFavorite});
  factory CountryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CountryData(
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      countryName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}country_name']),
      region:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}region']),
      isFavorite: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String>(countryName);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || isFavorite != null) {
      map['is_favorite'] = Variable<bool>(isFavorite);
    }
    return map;
  }

  CountryCompanion toCompanion(bool nullToAbsent) {
    return CountryCompanion(
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      region:
          region == null && nullToAbsent ? const Value.absent() : Value(region),
      isFavorite: isFavorite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorite),
    );
  }

  factory CountryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountryData(
      code: serializer.fromJson<String>(json['code']),
      countryName: serializer.fromJson<String>(json['countryName']),
      region: serializer.fromJson<String>(json['region']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'countryName': serializer.toJson<String>(countryName),
      'region': serializer.toJson<String>(region),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  CountryData copyWith(
          {String code, String countryName, String region, bool isFavorite}) =>
      CountryData(
        code: code ?? this.code,
        countryName: countryName ?? this.countryName,
        region: region ?? this.region,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('CountryData(')
          ..write('code: $code, ')
          ..write('countryName: $countryName, ')
          ..write('region: $region, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      code.hashCode,
      $mrjc(
          countryName.hashCode, $mrjc(region.hashCode, isFavorite.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CountryData &&
          other.code == this.code &&
          other.countryName == this.countryName &&
          other.region == this.region &&
          other.isFavorite == this.isFavorite);
}

class CountryCompanion extends UpdateCompanion<CountryData> {
  final Value<String> code;
  final Value<String> countryName;
  final Value<String> region;
  final Value<bool> isFavorite;
  const CountryCompanion({
    this.code = const Value.absent(),
    this.countryName = const Value.absent(),
    this.region = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  CountryCompanion.insert({
    @required String code,
    @required String countryName,
    @required String region,
    this.isFavorite = const Value.absent(),
  })  : code = Value(code),
        countryName = Value(countryName),
        region = Value(region);
  static Insertable<CountryData> custom({
    Expression<String> code,
    Expression<String> countryName,
    Expression<String> region,
    Expression<bool> isFavorite,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (countryName != null) 'country_name': countryName,
      if (region != null) 'region': region,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  CountryCompanion copyWith(
      {Value<String> code,
      Value<String> countryName,
      Value<String> region,
      Value<bool> isFavorite}) {
    return CountryCompanion(
      code: code ?? this.code,
      countryName: countryName ?? this.countryName,
      region: region ?? this.region,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryCompanion(')
          ..write('code: $code, ')
          ..write('countryName: $countryName, ')
          ..write('region: $region, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $CountryTable extends Country with TableInfo<$CountryTable, CountryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CountryTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 1, maxTextLength: 2);
  }

  final VerificationMeta _countryNameMeta =
      const VerificationMeta('countryName');
  GeneratedTextColumn _countryName;
  @override
  GeneratedTextColumn get countryName =>
      _countryName ??= _constructCountryName();
  GeneratedTextColumn _constructCountryName() {
    return GeneratedTextColumn(
      'country_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _regionMeta = const VerificationMeta('region');
  GeneratedTextColumn _region;
  @override
  GeneratedTextColumn get region => _region ??= _constructRegion();
  GeneratedTextColumn _constructRegion() {
    return GeneratedTextColumn(
      'region',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  GeneratedBoolColumn _isFavorite;
  @override
  GeneratedBoolColumn get isFavorite => _isFavorite ??= _constructIsFavorite();
  GeneratedBoolColumn _constructIsFavorite() {
    return GeneratedBoolColumn('is_favorite', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [code, countryName, region, isFavorite];
  @override
  $CountryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'country';
  @override
  final String actualTableName = 'country';
  @override
  VerificationContext validateIntegrity(Insertable<CountryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('country_name')) {
      context.handle(
          _countryNameMeta,
          countryName.isAcceptableOrUnknown(
              data['country_name'], _countryNameMeta));
    } else if (isInserting) {
      context.missing(_countryNameMeta);
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region'], _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite'], _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CountryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CountryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CountryTable createAlias(String alias) {
    return $CountryTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CountryTable _country;
  $CountryTable get country => _country ??= $CountryTable(this);
  CountryDao _countryDao;
  CountryDao get countryDao => _countryDao ??= CountryDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [country];
}
