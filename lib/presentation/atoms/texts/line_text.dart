import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class LineText extends StatelessWidget {
  final String label;
  const LineText({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.searchColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.greyscaleColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.searchColor,
          ),
        ),
      ],
    );
  }
}
