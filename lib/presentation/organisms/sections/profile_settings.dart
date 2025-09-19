import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/app_switch.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';

class ProfileSettings extends StatelessWidget {
  final String primaryIcon;
  final String? secondaryIcon;
  final String? secondaryname;
  final String name;
  final Color? nameColor;
  final VoidCallback? onTap;
  const ProfileSettings({
    super.key,
    required this.primaryIcon,
    this.secondaryIcon,
    this.secondaryname,
    required this.name,
    this.nameColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            AppIcons(
              iconPath: primaryIcon,
              iconHeight: 24,
              iconWidth: 24,
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(0),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppText(
                text: name,
                color: nameColor ?? AppColors.darkColor,
                size: 15,
                font: FontWeight.w600,
              ),
            ),
            AppText(
              text: secondaryname ?? '',
              color: AppColors.darkColor,
              size: 15,
              font: FontWeight.w600,
            ),
            const SizedBox(width: 16),
            (secondaryIcon == '0')
                ? AppSwitch(
                    value: false,
                    onChanged: (value) {},
                  )
                : (secondaryIcon != null && secondaryIcon!.isNotEmpty)
                    ? AppIcons(
                        iconPath: secondaryIcon!,
                        iconHeight: 24,
                        iconWidth: 24,
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(0),
                      )
                    : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
