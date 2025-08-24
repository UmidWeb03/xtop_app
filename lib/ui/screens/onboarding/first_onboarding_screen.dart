import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/ui/screens/onboarding/widgets/slider_card.dart';
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
            _onboarding_background(),
            _onboarding_text_tittle(context: context),
          ],
        ),
      ),
    );
  }

  Widget _onboarding_background() {
    return Image.asset(
      'assets/images/first_onboarding.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _onboarding_text_tittle({required BuildContext context}) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            _onboarding_tittle(),
            const SizedBox(height: 40),
            _onboarding_scroller_slider(),
            const SizedBox(height: 40),
            _onboarding_button(context: context),
          ],
        ),
      ),
    );
  }

  Widget _onboarding_tittle() {
    return const Text(
      "Chegirmadagi har qanday mahsulot sizga yaqin.",
      style: TextStyle(
        fontSize: 40,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _onboarding_scroller_slider() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SliderCard(width: 8, height: 8, color: AppColors.primaryColor),
          SliderCard(width: 38, height: 8, color: AppColors.accentColor),
          SliderCard(width: 8, height: 8, color: AppColors.primaryColor),
        ],
      ),
    );
  }

  Widget _onboarding_button({required BuildContext context}) {
    return AppButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutes.secondOnboarding);
      },
      text: 'Davom etish',
      width: double.infinity,
      height: 58,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
