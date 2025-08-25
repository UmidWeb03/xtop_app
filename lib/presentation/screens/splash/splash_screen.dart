import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_constants.dart';
import 'package:xtop_app/services/screen_navigate_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _navigationService = SplashScreenNavigateService();

  @override
  void initState() {
    super.initState();

    _navigationService.checkNavigateSplash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              const _SplashBackgroundSection(),
              const _SplashLogoSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashBackgroundSection extends StatelessWidget {
  const _SplashBackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_background.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _SplashLogoSection extends StatelessWidget {
  const _SplashLogoSection();

  @override
  Widget build(BuildContext context) {
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
