import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_constants.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/screens/auth/widgets/auth_button.dart';
import 'package:xtop_app/presentation/widgets/app_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AuthBodySection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthBodySection extends StatelessWidget {
  const _AuthBodySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 840,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BodyImageSection(),
          const SizedBox(height: 51.75),
          _BodyTextSection(
            text: "Bizga qo'shiling👋🏻",
            size: 39,
            fontWeight: FontWeight.bold,
            color: AppColors.greyscaleDarkColor,
          ),
          const SizedBox(height: 51.75),
          _BodyButtonSection(
            navigate: () => _googleContinuePressed(context),
            icon: 'assets/images/google_icon.png',
            lable: 'Google bilan davom etish',
            textColor: AppColors.greyscaleDarkColor,
            backgroundColor: AppColors.secondaryColor,
          ),
          const SizedBox(height: 16),
          _BodyButtonSection(
            navigate: () => _appleContinuePressed(context),
            icon: 'assets/images/apple_icon.png',
            lable: 'Apple bilan Davom etish',
            textColor: AppColors.greyscaleDarkColor,
            backgroundColor: AppColors.secondaryColor,
          ),
          const SizedBox(height: 24),
          _BodyDividerLineSection(),
          const SizedBox(height: 24),
          _ButtonSection(
            navigate: () => _phoneNumberContinuePressed(context),
            lable: 'Telefon raqam orqli krish',
          ),
          const SizedBox(height: 51.75),
          _BodyBottomNavigateSection(),
        ],
      ),
    );
  }

  void _googleContinuePressed(BuildContext context) {
    AppRoutes.navigateTo(context, AppRoutes.appScreen);
  }

  void _appleContinuePressed(BuildContext context) {
    AppRoutes.navigateTo(context, AppRoutes.appScreen);
  }

  void _phoneNumberContinuePressed(BuildContext context) {
    AppRoutes.navigateTo(context, AppRoutes.appScreen);
  }
}

class _BodyImageSection extends StatelessWidget {
  const _BodyImageSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/auth.png',
      width: 280,
      height: 238,
      fit: BoxFit.cover,
    );
  }
}

class _BodyTextSection extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  const _BodyTextSection({
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        // letterSpacing: 0.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _BodyButtonSection extends StatelessWidget {
  final String icon;
  final String lable;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback navigate;
  const _BodyButtonSection(
      {required this.icon,
      required this.lable,
      required this.textColor,
      required this.backgroundColor,
      required this.navigate});

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      onPressed: navigate,
      text: lable,
      img: icon,
      textColor: textColor,
      backgroundColor: backgroundColor,
      width: double.infinity,
      height: 56,
    );
  }
}

class _BodyDividerLineSection extends StatelessWidget {
  const _BodyDividerLineSection();

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
              fontWeight: FontWeight.bold,
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

class _ButtonSection extends StatelessWidget {
  final VoidCallback navigate;
  final String lable;
  const _ButtonSection({required this.navigate, required this.lable});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: navigate,
      text: lable,
      width: double.infinity,
      height: 56,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.secondaryColor,
    );
  }
}

class _BodyBottomNavigateSection extends StatelessWidget {
  const _BodyBottomNavigateSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BodyTextSection(
          text: "Hisobingiz mavjud emasmi?",
          size: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.greyscaleColor,
        ),
        const SizedBox(width: 8),
        _TextButtonSection(),
      ],
    );
  }
}

class _TextButtonSection extends StatelessWidget {
  const _TextButtonSection();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _signInContinuePressed(context),
      child: Text(
        "Ro'yxatdan o'tish",
        style: TextStyle(
          fontSize: 14,
          color: AppColors.greyscaleDarkColor,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white, // orqa fon rangi
        foregroundColor: Colors.white,
      ),
    );
  }

  void _signInContinuePressed(BuildContext context) {
    AppRoutes.navigateTo(context, AppRoutes.signInScreen);
  }
}
