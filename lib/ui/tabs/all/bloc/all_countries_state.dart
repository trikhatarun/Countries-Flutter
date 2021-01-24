part of 'all_countries_bloc.dart';

enum AllCountriesStatus { initial, success, failure }

class AllCountriesState extends Equatable {
  const AllCountriesState({
    this.status = AllCountriesStatus.initial,
    this.countries = const <CountryData>[],
    this.hasReachedMax = false,
  });

  final AllCountriesStatus status;
  final List<CountryData> countries;
  final bool hasReachedMax;

  AllCountriesState copyWith({
    AllCountriesStatus status,
    List<CountryData> countries,
    bool hasReachedMax,
  }) {
    return AllCountriesState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, countries, hasReachedMax];
}


