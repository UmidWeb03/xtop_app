import 'package:flutter/material.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
// import 'package:xtop_app/presentation/screens/auth/onboarding/onboarding.dart';

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
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
      // home: const Onboarding(),
    );
  }
}
