import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;

  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      selectedItemColor: AppColors.greyscaleDarkColor,
      unselectedItemColor: AppColors.greyscaleColor,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: AppColors.secondaryColor,
      items: items,
    );
  }
}