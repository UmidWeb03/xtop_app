import 'package:flutter/material.dart';

class AppBackgroundImage extends StatelessWidget {
  final String image;
  final double? height;
  const AppBackgroundImage({super.key, required this.image, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: height ?? double.infinity,
      fit: BoxFit.cover,
    );
  }
}
