import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String label;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? border;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    required this.label,
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
      style: ElevatedButton.styleFrom(
        side: border ?? BorderSide.none,
        minimumSize: Size(width ?? 380, height ?? 58),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: textColor ?? AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.secondaryColor),
              ),
            )
          : Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontWeight ?? FontWeight.bold,
              ),
            ),
    );
  }
}
