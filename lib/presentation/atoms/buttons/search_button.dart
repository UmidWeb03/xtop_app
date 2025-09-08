import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';

class SearchButton extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  const SearchButton({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: 'Mahsulot qidirish...',
          hintStyle: TextStyle(
            color: AppColors.greyscaleColor,
            fontSize: 15,
          ),
          prefixIcon: AppIcons(
            iconPath: 'assets/icons/search.png',
            margin: const EdgeInsets.only(
              left: 20,
              right: 12,
            ),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcons(
                iconPath: 'assets/icons/voice.png',
                onTap: () {},
                margin: const EdgeInsets.only(right: 12),
              ),
              AppIcons(
                iconPath: 'assets/icons/filter.png',
                onTap: () {},
                margin: const EdgeInsets.only(right: 20),
              ),
            ],
          ),
          filled: true,
          fillColor: AppColors.searchColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // bir xil radius
            borderSide: BorderSide(
              color: AppColors.greyscaleColor, // bir xil rang
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
