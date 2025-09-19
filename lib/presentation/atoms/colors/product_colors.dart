import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class ProductColorSection extends StatelessWidget {
  final Color? color;
  const ProductColorSection({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.searchColor, width: 1),
      ),
    );
  }
}
