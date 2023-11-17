part of 'bottom_nav_bar_cubit.dart';

@immutable
abstract class BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavigationBarChanged extends BottomNavBarState{
  int index;

  BottomNavigationBarChanged(this.index);
}