import 'package:dio/dio.dart';
import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/business/login/login_cubit.dart';
import 'package:e_commerce/business/registration/registration_cubit.dart';
import 'package:e_commerce/presentation/screens/home_layout_screen/home_layout_screen.dart';
import 'package:e_commerce/presentation/screens/login_screen/login_screen.dart';
import 'package:e_commerce/presentation/screens/see_all_productes/see_all_productes.dart';
import 'package:e_commerce/presentation/screens/signUp_screen/signup_screen.dart';
import 'package:e_commerce/presentation/screens/splash_screen/splash_screen.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegistrationCubit(),
            child: SignUpScreen(),
          ),
        );
      case homeLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeLayoutCubit()..getAllData(),
            child: HomeLayoutScreen(),
          ),
        );
      case seeAllProductsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: HomeLayoutCubit()..getProductItems(),
            child:const SeeAllProducts(),
          )
        );
      // case homeScreen:
      //   final phoneNumber = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => HomeScreen(),
      //   );
    }
    return null;
  }
}
