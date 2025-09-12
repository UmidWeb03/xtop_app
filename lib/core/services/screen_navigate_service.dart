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
      await Future.delayed(_splashDuration);
      await _navigateBasedOnState(context);
    } catch (e) {
      debugPrint('Navigation error: $e');
      if (context.mounted) {
        context.go(AppRoutes.onboarding);
      }
    }
  }

  /// App holatiga qarab navigation yo'nalishini aniqlaydi
  static Future<void> _navigateBasedOnState(BuildContext context) async {
    if (!context.mounted) return;

    final isFirstLaunch = await AppLocalStorage.isFirstLaunch();
    final isOnboardingCompleted = await AppLocalStorage.isOnboardingCompleted();
    final isUserLoggedIn = await AppLocalStorage.isUserLoggedIn();

    if (isFirstLaunch) {
      await AppLocalStorage.setFirstLaunchCompleted();
      context.go(AppRoutes.onboarding);
    } else if (!isOnboardingCompleted) {
      context.go(AppRoutes.onboarding);
    } else if (!isUserLoggedIn) {
      context.go(AppRoutes.auth);
    } else {
      context.go(AppRoutes.home);
    }
  }

  /// Login muvaffaqiyatli tugagandan keyin
  static Future<void> handleSuccessfulLogin(BuildContext context) async {
    await AppLocalStorage.setLoginStatus(true);
    if (context.mounted) {
      context.go(AppRoutes.home);
    }
  }

  /// Logout va auth sahifasiga qaytish
  static Future<void> handleLogout(BuildContext context) async {
    await AppLocalStorage.clearLoginStatus();
    if (context.mounted) {
      context.go(AppRoutes.auth);
    }
  }

  /// Onboarding tugagandan keyin
  static Future<void> handleOnboardingComplete(BuildContext context) async {
    await AppLocalStorage.setOnboardingCompleted();
    if (context.mounted) {
      context.go(AppRoutes.auth);
    }
  }

  /// Login holatini tekshirish
  static Future<bool> isLoggedIn() async {
    return await AppLocalStorage.isUserLoggedIn();
  }
}
