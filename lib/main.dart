import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/pages/home/home_screen.dart';
// import 'package:xtop_app/presentation/pages/products/products.dart';

void main() {
  runApp(const XTop_App());
}

// ignore: camel_case_types
class XTop_App extends StatelessWidget {
  const XTop_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routerConfig: appRouter,
      home: const HomeScreen(),
    );
  }
}
