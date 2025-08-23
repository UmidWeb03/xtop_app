import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/views/onboarding/widgets/slider_card.dart';
import 'package:xtop_app/widgets/App_button.dart';

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
            _welcome_background(),
            _welcome_text_tittle(context),
          ],
        ),
      ),
    );
  }

  Widget _welcome_background() {
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

  Widget _welcome_text_tittle(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.accentColor.withOpacity(0.7),
              AppColors.accentColor.withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcome_logo(),
            _welcome_tittle(),
            const SizedBox(height: 24),
            _welcome_description_text(),
            const SizedBox(height: 40),
            _welcome_scroller_slider(),
            const SizedBox(height: 40),
            _app_button(context: context)
          ],
        ),
      ),
    );
  }

  Widget _welcome_logo() {
    return Positioned(
      top: 80,
      left: 20,
      child: Image.asset(
        'assets/images/x_logo.png',
        width: 210,
        height: 98,
      ),
    );
  }

  Widget _welcome_tittle() {
    return const Text(
      'Xush kelibsiz!',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 46,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
    );
  }

  Widget _welcome_description_text() {
    return const Text(
      'Kundalik ehtiyojlaringiz uchun asrning eng yaxshi chegirmalarga asoslangan elektron tijarat ilovasi!',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 17,
        height: 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _welcome_scroller_slider() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SliderCard(width: 38, height: 8, color: AppColors.secondaryColor),
            SliderCard(width: 8, height: 8, color: AppColors.secondaryColor),
            SliderCard(width: 8, height: 8, color: AppColors.secondaryColor),
          ],
        ),
      ),
    );
  }

  Widget _app_button({required BuildContext context}) {
    return AppButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.firstOnboarding);
        },
        text: 'Keyingi');
  }
}
