import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/widgets/slider_dot.dart';

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
