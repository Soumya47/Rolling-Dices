import 'package:flutter/material.dart';
import 'package:rolling_Dice/homescreen.dart';
import 'package:rolling_Dice/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/images/dice_splash.gif',
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.blue,
        ));
  }
}
