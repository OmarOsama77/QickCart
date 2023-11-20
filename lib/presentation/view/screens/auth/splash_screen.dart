import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    return Scaffold(
        body: FutureBuilder(
            future:Future.wait([
              cubit2.getAllUsers(),
              cubit.getAllPosts(),
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
