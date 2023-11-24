part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavAdeed extends FavouriteState{}

class FavRemove extends FavouriteState{}

class FavFetched extends FavouriteState{}