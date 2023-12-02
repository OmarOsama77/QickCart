import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quirkcart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    final cubit3 = BlocProvider.of<FavouriteCubit>(context);
    final cubit4 = BlocProvider.of<CartCubit>(context);
    return Scaffold(
        body: FutureBuilder(
            future:Future.wait([
              cubit2.getAllUsers().then((value) => cubit4.getUserCart(cubit2.userData!.uId!)).then((value) => cubit3.getFavourite(cubit2.userData!.uId!).then((value) => cubit3.getProductById())),
              cubit.getAllPosts().then((value) => cubit.setFavProducts(cubit3.fav)).then((value) => cubit.getHomeProducs()),
            ]),
            builder: (context, snapshoot) {
              if (snapshoot.connectionState == ConnectionState.done) {
                Future.delayed(Duration.zero, () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.bottomNavBar);
                });
              }
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.white70),
                child: Lottie.asset("assets/animation/splash_screen.json"),
              );
            }));
  }
}
