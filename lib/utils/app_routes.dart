import 'package:flutter/material.dart';
import 'package:planets_app/screen/detail/view/detail_screen.dart';
import 'package:planets_app/screen/home/view/home_screen.dart';
import 'package:planets_app/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'detail': (context) => const DetailScreen(),
};
