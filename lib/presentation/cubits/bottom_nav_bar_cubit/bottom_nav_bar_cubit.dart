import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int index=0;
  void navigation(int index){
    this.index = index;
    emit(BottomNavigationBarChanged(index));
  }
}
