import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  const AppIcons({
    required this.iconPath,
    this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
