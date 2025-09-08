import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/core/services/screen_navigate_service.dart';

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
            alignment: Alignment.center,
            children: [
              const AppBackgroundImage(
                image: 'assets/images/app_background.png',
              ),
              const AppLogo(
                width: double.infinity,
                height: 117,
                padding: EdgeInsets.only(bottom: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
