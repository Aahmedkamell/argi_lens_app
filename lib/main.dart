import 'package:agre_lens_app/modules/splash/splash_screen.dart';
import 'package:agre_lens_app/shared/bloc_observer.dart';
import 'package:agre_lens_app/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/app_layout.dart';
import 'modules/Boardina/boardina1_screen.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

