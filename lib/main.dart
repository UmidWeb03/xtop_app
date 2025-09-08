import 'package:flutter/material.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
// import 'package:xtop_app/core/routes/app_routes.dart';
// import 'package:xtop_app/presentation/app.dart';

void main() {
  runApp(const XTop_App());
}

// ignore: camel_case_types
class XTop_App extends StatelessWidget {
  const XTop_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      // home: const SecondOnboardingScreen(),
    );
  }
}
