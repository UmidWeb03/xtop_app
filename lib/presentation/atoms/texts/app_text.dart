import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final double size;
  final FontWeight? font;
  final double? height;
  final TextAlign? align;
  final EdgeInsets? padding;
  const AppText({
    super.key,
    required this.text,
    this.style,
    required this.color,
    required this.size,
    this.font,
    this.height,
    this.align,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: style ??
            TextStyle(
              color: color,
              fontSize: size,
              fontWeight: font,
              height: height,
            ),
        textAlign: align,
      ),
    );
  }
}
