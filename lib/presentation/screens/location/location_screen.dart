import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/screens/app.dart';
import 'package:xtop_app/presentation/widgets/app_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryColor,
        title: const _AppBarTextSection(),
        actions: [
          const _AppBarIconSection(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CartBodySection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarTextSection extends StatelessWidget {
  const _AppBarTextSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Manzil',
      style: TextStyle(
        color: AppColors.greyscaleDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _AppBarIconSection extends StatelessWidget {
  const _AppBarIconSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Image.asset(
        'assets/icons/search_dark.png',
        width: 20,
        height: 20,
        fit: BoxFit.cover,
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Image.asset(
    'assets/icons/search_dark.png',
    width: 20,
    height: 20,
    fit: BoxFit.cover,
  );
}

class _CartBodySection extends StatelessWidget {
  const _CartBodySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BodyImageSection(),
          const SizedBox(height: 42),
          _BodyTextSection(),
          const SizedBox(height: 32),
          _BodyButtonSection(),
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
      'assets/images/location.png',
      width: 270,
      height: 238,
      fit: BoxFit.cover,
    );
  }
}

class _BodyTextSection extends StatelessWidget {
  const _BodyTextSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Ilovadan to’liq foydalanish uchun ro’yxatdan o’ting yoki hisobingizga kiring",
      style: TextStyle(
        fontSize: 16,
        height: 1.6,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _BodyButtonSection extends StatelessWidget {
  const _BodyButtonSection();

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
    appScreensKey.currentState?.goToAuthScreen();
  }
}
