import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class BottomTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  const BottomTextButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: "Hisobingiz mavjud emasmi?",
          color: AppColors.greyscaleColor,
          size: 14,
          font: FontWeight.normal,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          // () async {
          //   // Login muvaffaqiyatli bo'lganda
          //   await AppLocalStorage.setLoginStatus(false);

          //   if (context.mounted) {
          //     context.go(AppRoutes.home);
          //   }
          // },
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
