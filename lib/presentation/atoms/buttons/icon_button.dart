import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String? icon;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const IconButtons({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
            ),
            child: Image.asset(
              icon ?? 'assets/images/google_icon.png',
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
