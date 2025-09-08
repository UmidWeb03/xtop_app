import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/atoms/buttons/icon_button.dart';
import 'package:xtop_app/presentation/atoms/buttons/app_button.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

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
        // const AppImage(
        //   image: 'assets/images/auth.png',
        //   width: 280,
        //   height: 238,
        // ),
        Image.asset(
          'assets/images/auth.png',
          width: 280,
          height: 238,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 50),
        const AppText(
          text: "Bizga qo'shiling👋🏻",
          color: AppColors.greyscaleDarkColor,
          size: 38,
          font: FontWeight.bold,
        ),
        const SizedBox(height: 50),
        IconButtons(
          onPressed: () => context.go(AppRoutes.home),
          icon: 'assets/images/google_icon.png',
          text: 'Google bilan davom etish',
          width: double.infinity,
          height: 56,
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.greyscaleDarkColor,
        ),
        const SizedBox(height: 16),
        IconButtons(
          onPressed: () => context.go(AppRoutes.category),
          icon: 'assets/images/apple_icon.png',
          text: 'apple bilan davom etish',
          width: double.infinity,
          height: 56,
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.greyscaleDarkColor,
        ),
        const SizedBox(height: 24),
        _DividerLineSection(),
        const SizedBox(height: 24),
        AppButton(
          onPressed: () => context.go(AppRoutes.cart),
          text: 'Telefon raqam orqli krish',
          width: double.infinity,
          height: 56,
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.secondaryColor,
        ),
        const SizedBox(height: 50),
        _BottomSection(),
      ],
    );
  }
}

class _DividerLineSection extends StatelessWidget {
  const _DividerLineSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.searchColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            'yoki',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.greyscaleColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.searchColor,
          ),
        ),
      ],
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: "Hisobingiz mavjud emasmi?",
          color: AppColors.greyscaleColor,
          size: 14,
          font: FontWeight.normal,
        ),
        GestureDetector(
          onTap: () => context.go(AppRoutes.location),
          child: Text(
            "Ro'yxatdan o'tish",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.greyscaleDarkColor,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
