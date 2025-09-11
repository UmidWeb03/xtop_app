import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class PassButton extends StatefulWidget {
  final String img;
  final String topText;
  final String bottomText;
  final bool isSelected;
  final VoidCallback? onTap;

  const PassButton({
    super.key,
    required this.img,
    required this.topText,
    required this.bottomText,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<PassButton> createState() => _PassButtonState();
}

class _PassButtonState extends State<PassButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 128,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.isSelected
                ? AppColors.primaryColor
                : Colors.grey.withOpacity(0.3),
            width: widget.isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.isSelected
                  ? AppColors.primaryColor.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: widget.isSelected ? 6 : 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Image.asset(widget.img),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: widget.topText,
                    color: AppColors.primaryInputColor,
                    size: 15,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    text: widget.bottomText,
                    color: Colors.black,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
