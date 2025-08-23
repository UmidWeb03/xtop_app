import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';
// import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      _navigationService.checkNavigationSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            _backgroundWidget(),
            _logoWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Image.asset(
      'assets/images/x_background.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _logoWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Image.asset(
          'assets/images/x_logo.png',
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
