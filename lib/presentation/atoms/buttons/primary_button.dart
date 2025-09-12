import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? border;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    required this.label,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return SizedBox(
      width: width == 0 ? null : (width ?? 380),
      height: height ?? 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: border ?? BorderSide.none,
          backgroundColor: isDisabled
              ? Colors.grey[400]
              : (backgroundColor ?? AppColors.primaryColor),
          foregroundColor: isDisabled
              ? Colors.grey[600]
              : (textColor ?? AppColors.secondaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: isDisabled ? 0 : 2,
          // Tugmaning padding'ini moslash
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.secondaryColor,
                  ),
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: fontWeight ?? FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:xtop_app/core/constants/app_colors.dart';

// class PrimaryButton extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final String label;
//   final double? width;
//   final double? height;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final BorderSide? border;
//   final FontWeight? fontWeight;

//   const PrimaryButton({
//     super.key,
//     required this.onPressed,
//     this.isLoading = false,
//     required this.label,
//     this.width,
//     this.height,
//     this.backgroundColor,
//     this.textColor,
//     this.border,
//     this.fontWeight,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isDisabled = onPressed == null || isLoading;

//     return SizedBox(
//       width: width ?? double.infinity,
//       height: height ?? 58,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           side: border ?? BorderSide.none,
//           backgroundColor: isDisabled
//               ? Colors.grey[400]
//               : (backgroundColor ?? AppColors.primaryColor),
//           foregroundColor: isDisabled
//               ? Colors.grey[600]
//               : (textColor ?? AppColors.secondaryColor),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           elevation: isDisabled ? 0 : 2,
//         ),
//         onPressed: isDisabled ? null : onPressed,
//         child: isLoading
//             ? SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.5,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     textColor ?? AppColors.secondaryColor,
//                   ),
//                 ),
//               )
//             : Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: fontWeight ?? FontWeight.bold,
//                 ),
//               ),
//       ),
//     );
//   }
// }
