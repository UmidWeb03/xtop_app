import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_constants.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/screens/auth/widgets/auth_button.dart';

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
          _BodyTextSection(),
          const SizedBox(height: 51.75),
          _BodButtonSection(icon: 'assets/images/google.png'),
          const SizedBox(height: 16),
          _BodButtonSection(icon: 'assets/images/auth_apple.png'),
          const SizedBox(height: 24),
        ],
      ),
    );
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
  const _BodyTextSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bizga qo'shiling👋🏻",
      style: TextStyle(
        color: AppColors.greyscaleDarkColor,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _BodButtonSection extends StatelessWidget {
  final String icon;
  const _BodButtonSection({required this.icon});

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      onPressed: () => _continuePressed(context),
      lable: icon,
      width: double.infinity,
      height: 56,
      backgroundColor: AppColors.secondaryColor,
      textColor: AppColors.greyscaleDarkColor,
    );
  }

  void _continuePressed(BuildContext context) {
    AppRoutes.navigateTo(context, AppRoutes.authScreen);
  }
}
