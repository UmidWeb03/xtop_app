import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/buttons/icon_button.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
// import 'package:xtop_app/presentation/pages/auth/sign_in/sign_in_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  final bool _selectedIndex = false;

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
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/password.png',
                width: 276,
                height: 250,
              ),
              const SizedBox(height: 33),
              const AppText(
                text:
                    'Hisobingizni tiklash uchun qaysi aloqa ma’lumotlaridan foydalanishni tanlang',
                color: Colors.black,
                size: 15,
              ),
              const SizedBox(height: 24),
              IconButtons(
                img: 'assets/images/sms.png',
                topText: 'SMS orqali',
                bottomText: '+998 77 *** ** 99',
                isSelected: false,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              IconButtons(
                img: 'assets/images/mail.png',
                topText: 'Email orqali',
                bottomText: 'example@mail.com',
                isSelected: false,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Davom etish',
                onPressed: () {},
                backgroundColor: _selectedIndex == true
                    ? AppColors.primaryColor
                    : Colors.grey.shade300,
                textColor: _selectedIndex == true
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
