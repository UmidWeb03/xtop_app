import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class ProductBrandSection extends StatelessWidget {
  const ProductBrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        children: [
          Container(
            width: 61,
            height: 63,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              'assets/icons/category/nike.png',
              width: 32,
              height: 26,
            ),
          ),
          const SizedBox(height: 11),
          const Text(
            'Nike',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.darkColor,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '204 tovarlar',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
