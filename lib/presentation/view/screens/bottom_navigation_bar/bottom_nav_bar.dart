import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:quirkcart/presentation/view/screens/auth/login.dart';
import 'package:quirkcart/presentation/view/screens/cart/cart.dart';
import 'package:quirkcart/presentation/view/screens/explore/explore.dart';
import 'package:quirkcart/presentation/view/screens/home/home.dart';
import 'package:quirkcart/presentation/view/screens/settings/settings.dart';
import 'package:quirkcart/presentation/view/screens/wish_list/wish_list.dart';

class BottomNavBar extends StatelessWidget {
  Widget currentScreen(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Explore();
      case 2:
        return Cart();
      case 3:
        return WishList();
      case 4:
        return Settings();
    }
    return Center();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavBarCubit>(context);
    return Scaffold(body:
        BlocBuilder<BottomNavBarCubit, BottomNavBarState>(builder: (_, state) {
      if (state is BottomNavigationBarChanged) {
        return currentScreen(state.index);
      }
      return currentScreen(0);
    }), bottomNavigationBar:
        BlocBuilder<BottomNavBarCubit, BottomNavBarState>(builder: (_, state) {
      return BottomNavigationBar(
          onTap: (value) {
            cubit.navigation(value);
          },
          currentIndex: cubit.index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color(0xFFDB3022),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: Color(0xFFDB3022),
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color(0xFFDB3022),
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xFFDB3022),
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box_rounded,
                  color: Color(0xFFDB3022),
                ),
                label: 'Account'),

          ]);
    }));
  }
}
