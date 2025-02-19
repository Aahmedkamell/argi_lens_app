import 'dart:async';
import 'package:agre_lens_app/layout/app_layout.dart';
import 'package:flutter/material.dart';
import '../Boardina/boardina1_screen.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Boardina1Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.easeOut;
            var tween = Tween<double>(begin: 0.0, end: 1.0).chain(
              CurveTween(curve: curve),
            );
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 300),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 150,
        ),
      ),
    );
  }
}
