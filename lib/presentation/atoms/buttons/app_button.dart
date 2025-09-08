import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? border;
  final FontWeight? fontWeight;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 0, height ?? 0),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: textColor ?? AppColors.secondaryColor,
        side: border,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}
