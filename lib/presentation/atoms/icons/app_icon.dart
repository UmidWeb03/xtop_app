import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class AppIcons extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;
  final EdgeInsets? padding;
  const AppIcons({
    required this.iconPath,
    this.onTap,
    this.margin,
    this.decoration,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.padding,
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
        // padding: padding == null ? const EdgeInsets.all(12) : padding,
        child: Image.asset(
          iconPath,
          width: iconWidth ?? 20,
          height: iconHeight ?? 20,
        ),
      ),
    );
  }
}
