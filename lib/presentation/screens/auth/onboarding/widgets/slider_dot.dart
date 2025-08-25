import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  final bool isActive;
  final Color color;

  const SliderDot({required this.isActive, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isActive ? 32 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
