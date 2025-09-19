import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/atoms/buttons/secondary_button.dart'
    as custom;
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/bottom/bottom_text_button.dart';
import 'package:xtop_app/presentation/atoms/texts/line_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SafeArea(
          child: _AuthBodySection(),
        ),
      ),
    );
  }
}

class _AuthBodySection extends StatelessWidget {
  const _AuthBodySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/auth.png',
          width: 280,
          height: 238,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 50),
        const AppText(
          text: "Bizga qo'shiling👋🏻",
          color: AppColors.darkColor,
          size: 38,
          font: FontWeight.bold,
        ),
        const SizedBox(height: 50),
        custom.SecondaryButton(
          onPressed: () => context.push(AppRoutes.signIn),
          icon: 'assets/images/google_icon.png',
          label: 'Google bilan davom etish',
        ),
        const SizedBox(height: 16),
        custom.SecondaryButton(
          onPressed: () => context.push(AppRoutes.signIn),
          icon: 'assets/images/apple_icon.png',
          label: 'Apple bilan davom etish',
        ),
        const SizedBox(height: 24),
        LineText(label: 'yoki'),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Telefon raqam orqli krish',
          onPressed: () => context.push(AppRoutes.phoneLogin),
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.secondaryColor,
        ),
        const SizedBox(height: 50),
        BottomTextButton(
          onTap: () => context.push(AppRoutes.signUp),
        ),
      ],
    );
  }
}
