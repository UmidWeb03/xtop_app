import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class BottomTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  final String? text;
  const BottomTextButton({
    super.key,
    this.onTap,
    this.label,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: text == null ? "Agar hisobingiz bo'lmasa" : text!,
          color: AppColors.greyColor,
          size: 14,
          font: FontWeight.normal,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Text(
            label == null ? "Ro'yxatdan o'tish" : label!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.darkColor,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
