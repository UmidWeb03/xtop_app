import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/input/phone_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/atoms/texts/line_text.dart';
import 'package:xtop_app/presentation/organisms/bottom/bottom_text_button.dart';
import 'package:xtop_app/presentation/pages/auth/sign_in/forgot_password/verify_email_code/verify_code_email_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_up/sign_up_screen.dart';

class PhoneNumberLoginScreen extends StatelessWidget {
  const PhoneNumberLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogo(
                img: 'assets/images/logo_secondary.png',
                width: 168,
                height: 63,
              ),
              const SizedBox(height: 76),
              const AppText(
                text: 'Kirish',
                color: AppColors.darkColor,
                size: 28,
                font: FontWeight.bold,
              ),
              const SizedBox(height: 76),
              PhoneInput(
                hintText: '+998 000 00 00',
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Kodini yuborish',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => VerifyEmailCodeScreen()),
                ),
              ),
              const SizedBox(height: 76),
              const LineText(label: 'Yoki bilan davom etish'),
              const SizedBox(height: 24),
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
              const SizedBox(height: 76),
              BottomTextButton(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                ),
                label: 'Orqaga qaytish',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
