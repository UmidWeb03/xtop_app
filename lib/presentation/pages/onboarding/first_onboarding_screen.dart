import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const AppBackgroundImage(
                image: 'assets/images/first_onboarding.png'),
            _OnboardingContentSection(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 370,
        padding: const EdgeInsets.only(top: 64),
        color: AppColors.secondaryColor,
        child: Column(
          children: [
            const AppText(
              text: "Chegirmadagi har qanday mahsulot sizga yaqin.",
              color: AppColors.primaryColor,
              size: 40,
              font: FontWeight.bold,
              height: 1.1,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
