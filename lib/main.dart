import 'package:agre_lens_app/modules/splash/splash_screen.dart';
import 'package:agre_lens_app/shared/bloc_observer.dart';
import 'package:agre_lens_app/shared/cubit/cubit.dart';
import 'package:agre_lens_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(
    BlocProvider(
      create: (context) => AppCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => AppCubit(), 
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
=======
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFEF7FF)
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
>>>>>>> 0667b57e3d013ee77b3ccbb51954e46bc7ad650e
    );
  }
}
