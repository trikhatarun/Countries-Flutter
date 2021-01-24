part of 'favorites_bloc.dart';

enum FavoriteStatus { initial, success, failure }

class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.countries = const <CountryData>[],
  });

  final FavoriteStatus status;
  final List<CountryData> countries;

  FavoriteState copyWith({
    FavoriteStatus status,
    List<CountryData> countries,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
    );
  }

  @override
  List<Object> get props => [status, countries];
}
