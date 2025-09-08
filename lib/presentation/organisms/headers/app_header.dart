import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/atoms/buttons/app_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(width: 107, height: 50),
          AppButton(
            onPressed: () => context.push(AppRoutes.auth),
            text: 'Kirish',
            width: 79,
            height: 38,
            backgroundColor: AppColors.accentColor,
            textColor: AppColors.secondaryColor,
          )
        ],
      ),
    );
  }
}
