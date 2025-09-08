import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/welcome_screen.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/first_onboarding_screen.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/second_onboarding_screen.dart';
import 'package:xtop_app/presentation/atoms/buttons/app_button.dart';

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
      context.go(AppRoutes.home);
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      screens.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: currentIndex == index ? 32 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? (currentIndex == 0
                                  ? AppColors.secondaryColor
                                  : AppColors
                                      .primaryColor) // faol indikator rangi
                              : (currentIndex == 0
                                  ? AppColors.secondaryColor.withOpacity(0.5)
                                  : AppColors.primaryColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onPressed: nextScreen,
                    text: isLastScreen ? "Boshlash" : "Keyingisi",
                    width: double.infinity,
                    height: 56,
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
