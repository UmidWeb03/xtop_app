import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';

class NavigationService {
  static const Duration _splashDuration = Duration(seconds: 2);

  /// Splash screen'dan keyin navigation mantiqini boshqaradi
  static Future<void> handleSplashNavigation(BuildContext context) async {
    try {
      if (!context.mounted) return;

      // Splash ekrani ko'rinishi uchun biroz kutish
      await Future.delayed(_splashDuration);

      if (!context.mounted) return;

      final isFirstLaunch = await AppLocalStorage.isFirstLaunch();
      final isOnboardingCompleted =
          await AppLocalStorage.isOnboardingCompleted();

      if (context.mounted) {
        if (isFirstLaunch || !isOnboardingCompleted) {
          // Birinchi marta yoki onboarding tugallanmagan
          context.go(AppRoutes.onboarding);
        } else {
          // Onboarding tugallangan, home ga o'tish
          context.go(AppRoutes.home);
        }
      }
    } catch (e) {
      debugPrint('Navigation error: $e');
      if (context.mounted) {
        context.go(AppRoutes.onboarding);
      }
    }
  }

  /// Onboarding tugagandan keyin
  static Future<void> handleOnboardingComplete(BuildContext context) async {
    try {
      await AppLocalStorage.setOnboardingCompleted();
      await AppLocalStorage.setFirstLaunchCompleted();
      if (context.mounted) {
        context.go(AppRoutes.home);
      }
    } catch (e) {
      debugPrint('Onboarding complete error: $e');
    }
  }
}
