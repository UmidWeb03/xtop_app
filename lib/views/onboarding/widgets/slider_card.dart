import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const SliderCard({super.key, required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
