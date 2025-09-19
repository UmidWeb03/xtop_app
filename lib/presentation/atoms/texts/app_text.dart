import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? textSpan;
  final TextStyle? style;
  final TextStyle? styleSpan;
  final Color? color;
  final Color? colorSpan;
  final double size;
  final FontWeight? font;
  final FontWeight? fontSpan;
  final double? height;
  final TextAlign? align;
  final EdgeInsets? padding;
  const AppText({
    super.key,
    required this.text,
    this.textSpan,
    this.style,
    this.styleSpan,
    this.color,
    this.colorSpan,
    required this.size,
    this.font,
    this.fontSpan,
    this.height,
    this.align,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: RichText(
        text: TextSpan(
          text: text,
          style: style ??
              TextStyle(
                color: color ?? AppColors.darkColor,
                fontSize: size,
                fontWeight: font,
              ),
          children: [
            TextSpan(
              text: textSpan,
              style: styleSpan ??
                  TextStyle(
                    fontSize: size,
                    fontWeight: fontSpan ?? FontWeight.bold,
                    color: colorSpan ?? AppColors.primaryColor,
                  ),
            ),
          ],
        ),
        textAlign: align ?? TextAlign.start,
      ),
    );
  }
}
