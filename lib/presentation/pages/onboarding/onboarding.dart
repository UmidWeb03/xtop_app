import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/point/pages_pointer_point.dart';
import 'package:xtop_app/presentation/pages/onboarding/first_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/second_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/third_screen.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  int currentIndex = 0;

  static const List<Widget> screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isLast = currentIndex == screens.length - 1;
    final color =
        currentIndex == 0 ? AppColors.secondaryColor : AppColors.primaryColor;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: screens.length,
            itemBuilder: (context, index) => screens[index],
          ),
          Positioned(
            bottom: 40,
            left: 32,
            right: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PagesPointerPoint(
                  currentIndex: currentIndex,
                  itemCount: screens.length,
                  color: color,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  onPressed: () {},
                  label: isLast ? "Boshlash" : "Keyingisi",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
