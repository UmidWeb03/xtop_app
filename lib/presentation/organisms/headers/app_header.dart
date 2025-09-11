import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  void _nextScreen() async {
    // Login sahifasiga yo'naltirish yoki Home'ga
    final isLoggedIn = await AppLocalStorage.isUserLoggedIn();

    if (context.mounted) {
      if (isLoggedIn) {
        context.go(AppRoutes.home);
      } else {
        context.push(AppRoutes.auth);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(width: 107, height: 50),
          PrimaryButton(
            onPressed: _nextScreen,
            label: 'Kirish',
            width: 79,
            height: 38,
          )
        ],
      ),
    );
  }
}
