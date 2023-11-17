import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/screens/auth/login.dart';
import 'package:quirkcart/presentation/view/screens/auth/signup.dart';
import 'package:quirkcart/presentation/view/screens/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:quirkcart/presentation/view/screens/cart/check_out.dart';
import 'package:quirkcart/presentation/view/screens/cart/succes_order.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class AppRouter {
 Route? generateRoute(RouteSettings settings){
   switch(settings.name){
     case RouteNames.login:
       return MaterialPageRoute(builder:(context)=>Login());
     case RouteNames.bottomNavBar:
       return MaterialPageRoute(builder:(context)=>BottomNavBar());
     case RouteNames.signup :
       return MaterialPageRoute(builder:(context)=>Signup());
     case RouteNames.checkOut :
       return MaterialPageRoute(builder:(context)=>CheckOut());
     case RouteNames.successOrder :
       return MaterialPageRoute(builder:(context)=>SuccesOrder());
     default:
       return MaterialPageRoute(builder:(context)=>Login());
   }
 }
}
