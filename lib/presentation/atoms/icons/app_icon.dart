import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class AppIcons extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  const AppIcons({
    required this.iconPath,
    this.onTap,
    this.margin,
    this.decoration,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: decoration == null
            ? decoration
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.searchColor,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
        margin: margin,
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
