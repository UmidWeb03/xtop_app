import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String label;
  final String? icon;
  final String? icons;
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
    this.icon,
    this.icons,
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
        foregroundColor: textColor ?? AppColors.darkColor,
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
                    icons ?? 'assets/icons/done.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ),
                  child: Image.asset(
                    icon ?? 'assets/icons/bag_light.png',
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
