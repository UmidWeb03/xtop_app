import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_constants.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/widgets/App_button.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/widgets/slider_dot.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            const _WelcomeBackgroundSection(),
            _WelcomeContentSection(),
          ],
        ),
      ),
    );
  }
}

class _WelcomeBackgroundSection extends StatelessWidget {
  const _WelcomeBackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/welcome_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _WelcomeContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      // top: 0,
      child: Container(
        width: double.infinity,
        height: 550,
        padding:
            const EdgeInsets.only(top: 140, bottom: 0, left: 24, right: 24),
        decoration: _buildGradientBackground(),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _WelcomeLogoSection(),
            _WelcomeTitleSection(),
            SizedBox(height: 24),
            _WelcomeDescriptionSection(),
            SizedBox(height: 24),
            _WelcomeScrollerSection(),
            SizedBox(height: 24),
            _WelcomeButtonSection(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          AppColors.greyscaleDarkColor.withOpacity(0.7),
          AppColors.accentColor.withOpacity(0.7),
        ],
        stops: const [0.0, 0.3, 1.0],
      ),
    );
  }
}

class _WelcomeLogoSection extends StatelessWidget {
  const _WelcomeLogoSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_logo.png',
      width: 210,
      height: 98,
      fit: BoxFit.cover,
    );
  }
}

class _WelcomeTitleSection extends StatelessWidget {
  const _WelcomeTitleSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Xush kelibsiz!',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 47,
        fontWeight: FontWeight.bold,
        height: 1.1,
        letterSpacing: -0.5,
      ),
    );
  }
}

class _WelcomeDescriptionSection extends StatelessWidget {
  const _WelcomeDescriptionSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kundalik ehtiyojlaringiz uchun asrning eng yaxshi chegirmalarga asoslangan elektron tijarat ilovasi!',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 17,
        height: 1.6,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _WelcomeScrollerSection extends StatelessWidget {
  const _WelcomeScrollerSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SliderDot(isActive: true, color: AppColors.secondaryColor),
        SliderDot(isActive: false, color: AppColors.secondaryColor),
        SliderDot(isActive: false, color: AppColors.secondaryColor),
      ],
    );
  }
}

class _WelcomeButtonSection extends StatelessWidget {
  const _WelcomeButtonSection();

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
    AppRoutes.navigateTo(context,  AppRoutes.firstOnboardingScreen);
  }
}
