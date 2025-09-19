import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/input/app_check.dart';
import 'package:xtop_app/presentation/atoms/input/app_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
        title: const AppText(
          text: 'Parolingizni untdingizmi',
          color: Colors.black,
          size: 20,
          font: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/reset.png',
                    width: 276,
                    height: 250,
                  ),
                  const SizedBox(height: 71),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const AppText(
                      text: 'Yangi parol yaratish',
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppInput(
                    label: 'Parol',
                    icon: 'assets/icons/lock.png',
                    suffixIcon: 'assets/icons/change.png',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  AppInput(
                    label: 'Parol',
                    icon: 'assets/icons/lock.png',
                    suffixIcon: 'assets/icons/change.png',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  AppCheck(
                    label: 'Meni eslab qol',
                    activeColor: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 71),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 32,
            right: 32,
            child: PrimaryButton(
              onPressed: () {},
              label: "Davom etish",
            ),
          ),
        ],
      ),
    );
  }
}
