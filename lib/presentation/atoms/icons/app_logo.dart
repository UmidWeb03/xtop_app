import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? padding;
  const AppLogo({
    super.key,
    required this.width,
    required this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Image.asset(
        'assets/images/app_logo.png',
        width: width,
        height: height,
      ),
    );
  }
}
