import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
