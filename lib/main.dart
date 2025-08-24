import 'package:flutter/material.dart';
import 'package:xtop_app/ui/screens/home/home_screen.dart';
// import 'package:xtop_app/core/app_routes.dart';

void main() {
  runApp(const X_App());
}

// ignore: camel_case_types
class X_App extends StatelessWidget {
  const X_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.splash,
      // routes: AppRoutes.routes,
      home: const HomeScreen(),
    );
  }
}
