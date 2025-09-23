import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: const SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppBackgroundImage(image: 'assets/images/app_background.png'),
              AppLogo(
                width: 200,
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
