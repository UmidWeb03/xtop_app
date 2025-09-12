import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';

class AppInput extends StatelessWidget {
  final String label;
  final String icon;
  final String? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const AppInput({
    Key? key,
    required this.label,
    required this.icon,
    this.suffixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: AppColors.greyscaleColor,
          fontSize: 15,
        ),
        prefixIcon: AppIcons(
          iconPath: icon,
          margin: const EdgeInsets.only(
            left: 20,
            right: 12,
          ),
        ),
        suffixIcon: suffixIcon == null
            ? null
            : AppIcons(
                iconPath: suffixIcon!,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 12,
                ),
              ),
        filled: true,
        fillColor: AppColors.searchColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // bir xil radius
          borderSide: BorderSide(
            color: AppColors.primaryColor, // bir xil rang
            width: 1,
          ),
        ),
      ),
    );
  }
}
