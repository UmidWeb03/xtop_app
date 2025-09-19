import 'package:flutter/material.dart';

class PagesPointerPoint extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Color color;

  const PagesPointerPoint({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) {
          final active = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: active ? 32 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: active ? color : color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
