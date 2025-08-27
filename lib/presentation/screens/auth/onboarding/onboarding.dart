import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/welcome_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/first_onboarding_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/second_onboarding_screen.dart';
import 'package:xtop_app/presentation/widgets/app_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;

  static const screens = [
    WelcomeScreen(),
    FirstOnboardingScreen(),
    SecondOnboardingScreen(),
  ];

  void nextScreen() {
    if (currentIndex < screens.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pushNamed(context, AppRoutes.appScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLastScreen = currentIndex == screens.length - 1;
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 15,
            child: SafeArea(
              child: AppButton(
                onPressed: nextScreen,
                text: isLastScreen ? "Go to Home" : "Next",
                width: double.infinity,
                height: 56,
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
