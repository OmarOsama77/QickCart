import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:quirkcart/presentation/view/screens/auth/login.dart';
import 'package:quirkcart/utils/routes/app_router.dart';


void main() {
  runApp(MyApp(AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp(this.appRouter);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=>BottomNavBarCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

