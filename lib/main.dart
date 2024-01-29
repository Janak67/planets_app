import 'package:flutter/material.dart';
import 'package:planets_app/screen/detail/provider/detail_provider.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:planets_app/utils/app_routes.dart';
import 'package:planets_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(),
        ),
      ],
      child: Consumer<DetailProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.isLight ? lightTheme : darkTheme,
            routes: screen_routes,
          );
        },
      ),
    ),
  );
}
