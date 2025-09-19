import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            const AppBackgroundImage(
              image: 'assets/images/welcome_background.png',
            ),
            _WelcomeContentSection(),
          ],
        ),
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
      child: Container(
        width: double.infinity,
        height: 550,
        padding:
            const EdgeInsets.only(top: 140, bottom: 0, left: 24, right: 24),
        decoration: _buildGradientBackground(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(width: 210, height: 98),
            const AppText(
              text: 'Xush kelibsiz!',
              color: AppColors.secondaryColor,
              size: 47,
              font: FontWeight.bold,
              height: 1.1,
            ),
            const SizedBox(height: 24),
            const AppText(
              text:
                  'Kundalik ehtiyojlaringiz uchun asrning eng yaxshi chegirmalarga asoslangan elektron tijarat ilovasi!',
              color: AppColors.secondaryColor,
              font: FontWeight.w500,
              size: 17,
              height: 1.6,
            ),
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
          AppColors.darkColor.withOpacity(0.7),
          AppColors.accentColor.withOpacity(0.7),
        ],
        stops: const [0.0, 0.3, 1.0],
      ),
    );
  }
}
