import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String label;
  final String icon;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    required this.label,
    required this.icon,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 380, height ?? 58),
        side: BorderSide(
          color: AppColors.primaryColor.withOpacity(0.1),
        ),
        backgroundColor: backgroundColor ?? AppColors.secondaryColor,
        foregroundColor: textColor ?? AppColors.greyscaleDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.secondaryColor),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ),
                  child: Image.asset(
                    icon,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: fontWeight ?? FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }
}
