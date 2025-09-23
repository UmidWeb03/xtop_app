import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/input/app_check.dart';
import 'package:xtop_app/presentation/atoms/input/app_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/bottom/bottom_text_button.dart';
import 'package:xtop_app/presentation/atoms/texts/line_text.dart';
import 'package:xtop_app/presentation/pages/auth/sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.only(left: 24, right: 24),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogo(
                img: 'assets/images/logo_secondary.png',
                width: double.infinity,
                height: 63,
              ),
              const SizedBox(height: 39),
              const AppText(
                text: 'Hisobga kirish',
                color: AppColors.darkColor,
                size: 30,
                font: FontWeight.bold,
              ),
              const SizedBox(height: 39),
              AppInput(
                label: 'Email',
                icon: 'assets/icons/email.png',
              ),
              const SizedBox(height: 24),
              AppInput(
                label: 'Parol',
                icon: 'assets/icons/lock.png',
                suffixIcon: 'assets/icons/change.png',
              ),
              const SizedBox(height: 24),
              AppCheck(
                label: 'Meni eslab qol',
                activeColor: AppColors.primaryColor,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Kirish',
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                ),
                child: const AppText(
                  text: 'Parolni unutdingizmi?',
                  color: AppColors.darkColor,
                  size: 17,
                  font: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 39),
              const LineText(label: 'Yoki bilan kirish'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons(
                    iconPath: 'assets/images/google_icon.png',
                    decoration: BoxDecoration(),
                    width: 87,
                    height: 60,
                  ),
                  const SizedBox(width: 20),
                  AppIcons(
                    iconPath: 'assets/images/apple_icon.png',
                    decoration: BoxDecoration(),
                    width: 87,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 39),
              BottomTextButton(
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                  text: 'Ro\'yxatdan o\'tish'),
            ],
          ),
        ),
      ),
    );
  }
}
