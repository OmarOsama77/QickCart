part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavAdded extends FavouriteState{}

class FavRemoved extends FavouriteState{}
