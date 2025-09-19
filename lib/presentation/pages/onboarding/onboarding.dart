import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/services/navigation_service.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/point/pages_pointer_point.dart';
import 'package:xtop_app/presentation/pages/onboarding/first_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/second_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/third_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  static const List<Widget> screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _controller.page?.round();
    if (page != null && page != currentIndex) {
      setState(() => currentIndex = page);
    }
  }

  Future<void> _finish() async {
    try {
      await NavigationService.handleOnboardingComplete(context);
      // if (mounted) context.go(AppRoutes.home);
    } catch (e) {
      debugPrint('Onboarding finish error: $e');
    }
  }

  Future<void> _next() async {
    if (currentIndex < screens.length - 1) {
      await _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await _finish();
    }
  }

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
            controller: _controller,
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
                  onPressed: _next,
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
