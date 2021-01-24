part of 'all_countries_bloc.dart';

abstract class AllCountriesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CountriesFetched extends AllCountriesEvent {}