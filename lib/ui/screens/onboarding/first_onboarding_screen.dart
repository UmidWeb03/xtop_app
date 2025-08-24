import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/ui/screens/onboarding/widgets/slider_dot.dart';
import 'package:xtop_app/ui/widgets/App_button.dart';

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
            const _OnboardingBackgroundSection(),
            const _OnboardingContentSection(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingBackgroundSection extends StatelessWidget {
  const _OnboardingBackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/first_onboarding.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _OnboardingContentSection extends StatelessWidget {
  const _OnboardingContentSection();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 370,
        padding: const EdgeInsets.only(top: 64, bottom: 0, left: 24, right: 24),
        alignment: Alignment.center,
        color: AppColors.secondaryColor,
        child: Column(
          children: [
            const _OnboardingTitleSection(),
            const SizedBox(height: 40),
            const _OnboardingScrollerSlider(),
            const SizedBox(height: 27),
            const _OnboardingButtonSection(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingTitleSection extends StatelessWidget {
  const _OnboardingTitleSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Chegirmadagi har qanday mahsulot sizga yaqin.",
      style: TextStyle(
        fontSize: 40,
        height: 1.1,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _OnboardingScrollerSlider extends StatelessWidget {
  const _OnboardingScrollerSlider();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SliderDot(isActive: false, color: AppColors.primaryColor),
        SliderDot(isActive: true, color: AppColors.primaryColor),
        SliderDot(isActive: false, color: AppColors.primaryColor),
      ],
    );
  }
}

class _OnboardingButtonSection extends StatelessWidget {
  const _OnboardingButtonSection();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => _continuePressed(context),
      text: 'Davom etish',
      width: double.infinity,
      height: 56,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.secondaryColor,
    );
  }

  void _continuePressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.secondOnboardingScreen);
  }
}
