import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AppButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 58),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
