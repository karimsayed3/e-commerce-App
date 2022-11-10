import 'package:e_commerce/app_router.dart';
import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/remote/bloc_observer.dart';
import 'package:e_commerce/remote/cashe_helper/cashe_helper.dart';
import 'package:e_commerce/remote/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_layout_screen/home_layout_screen.dart';

String? initialRoute;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init() ;
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,



      // home: BlocProvider(
      //   create: (context) => HomeLayoutCubit()..getAllData(),
      //   child: HomeLayoutScreen(),
      // ),
    );
  }
}
