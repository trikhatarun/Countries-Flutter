part of 'favorites_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CountriesFetched extends FavoriteEvent {}