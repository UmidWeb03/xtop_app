import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? padding;
  final String? img;
  const AppLogo({
    super.key,
    required this.width,
    required this.height,
    this.padding,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Image.asset(
        img == null ? 'assets/images/app_logo.png' : img!,
        width: width,
        height: height,
      ),
    );
  }
}
