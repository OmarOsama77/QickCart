import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/data/network/api_service.dart';
import 'package:quirkcart/data/repositry/products_repository_impl/products_repository_impl.dart';
import 'package:quirkcart/data/repositry/use_repository_impl/user_repo_impl.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/login_use_case.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/signup_use_case.dart';
import 'package:quirkcart/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:quirkcart/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:quirkcart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/utils/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp(this.appRouter);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=>BottomNavBarCubit()),
        BlocProvider(create: (_)=>AuthCubit(LoginUseCase(UserRepositoryImpl(ApiService())),SignupUseCase(UserRepositoryImpl(ApiService())))),
        BlocProvider(create:(_)=>ProductsCubit(ProductsRepositoryImpl(ApiService()))),
        BlocProvider(create:(_)=>UserCubit(UserRepositoryImpl(ApiService()))),
        BlocProvider(create: (_)=>FavouriteCubit(ProductsRepositoryImpl(ApiService()))),
        BlocProvider(create: (_)=>CartCubit(ProductsRepositoryImpl(ApiService()))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

