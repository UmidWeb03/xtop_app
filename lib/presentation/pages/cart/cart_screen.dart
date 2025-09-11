import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              // _CartHeaderSection(),
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
      'Savatcha',
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
      'assets/images/empty.png',
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
    return PrimaryButton(
      onPressed: () => context.push(AppRoutes.auth),
      label: 'Davom etish',
    );
  }
}
