import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';
import 'package:xtop_app/presentation/atoms/input/number_input.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/atoms/texts/line_text.dart';
import 'package:xtop_app/presentation/organisms/bottom/bottom_text_button.dart';
import 'package:xtop_app/presentation/organisms/timer/timer_section.dart';
import 'package:xtop_app/presentation/pages/auth/sign_up/sign_up_screen.dart';
import 'package:xtop_app/presentation/pages/home/home_screen.dart';

class PhoneLoginCodeScreen extends StatelessWidget {
  const PhoneLoginCodeScreen({super.key});

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
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLogo(
                  img: 'assets/images/logo_secondary.png',
                  width: 168,
                  height: 63,
                ),
                const SizedBox(height: 39),
                const AppText(
                  text: 'Kirish',
                  color: AppColors.darkColor,
                  size: 30,
                  font: FontWeight.bold,
                ),
                const SizedBox(height: 39),
                const Row(
                  children: [
                    Flexible(
                      child: AppText(
                        text: 'Biz kodni ushbu raqamga jo\'natdik: ',
                        color: AppColors.greyColor,
                        size: 13,
                      ),
                    ),
                    AppText(
                      text: ' +998 99 155 15 25',
                      color: AppColors.darkColor,
                      size: 13,
                      font: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 39),
                const NumberInput(
                  // Controller olib tashlandi (stateless)
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 39),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: 'Kodni qabul qilmadingizimi?',
                    color: AppColors.greyColor,
                    size: 15,
                  ),
                ),
                const SizedBox(height: 18),
                const TimerWidget(
                  initialDuration: Duration(seconds: 30),
                  label: 'Kod qayta yuborildi',
                  restartText: 'Qayta yuborish',
                ),
                const SizedBox(height: 39),
                PrimaryButton(
                  label: 'Tasdiqlash',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 39),
                const LineText(label: 'Yoki bilan davom etish'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AppIcons(
                      iconPath: 'assets/images/google_icon.png',
                      decoration: BoxDecoration(),
                      width: 87,
                      height: 60,
                    ),
                    SizedBox(width: 20),
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
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                    text: 'Ortga qaytish'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
