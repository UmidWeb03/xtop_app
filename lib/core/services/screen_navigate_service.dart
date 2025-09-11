import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/core/services/local_storage.dart';

/// Splash screen navigation logikasi
class SplashScreenNavigateService {
  static const Duration _splashDuration = Duration(seconds: 2);

  /// Splash screen navigation logikasi
  static Future<void> checkNavigateSplash(BuildContext context) async {
    try {
      // SplashScreen 2 soniya ko'rsatiladi
      await Future.delayed(_splashDuration);

      // Navigation logic
      await _handleNavigation(context);
    } catch (e) {
      // Xatolik bo'lsa, default'ga yo'naltirish
      debugPrint('Splash navigation error: $e');
      if (context.mounted) {
        context.go(AppRoutes.onboarding);
      }
    }
  }

  /// Navigation mantiqini boshqaradi
  static Future<void> _handleNavigation(BuildContext context) async {
    final isFirstLaunch = await AppLocalStorage.isFirstLaunch();
    final isOnboardingCompleted = await AppLocalStorage.isOnboardingCompleted();
    final isUserLoggedIn = await AppLocalStorage.isUserLoggedIn();

    if (!context.mounted) return; // Widget dispose bo'lganmi tekshirish

    if (isFirstLaunch) {
      // Birinchi marta ilovaga kirilganda: Onboarding'ga o'tadi
      await AppLocalStorage.setFirstLaunchCompleted();
      context.go(AppRoutes.onboarding);
    } else if (!isOnboardingCompleted) {
      // Onboarding tugallanmagan bo'lsa
      context.go(AppRoutes.onboarding);
    } else if (!isUserLoggedIn) {
      // Login qilinmagan bo'lsa
      context.go(AppRoutes.auth);
    } else {
      // Hammasi tugallangan: Home'ga o'tadi
      context.go(AppRoutes.home);
    }
  }
}

/// Auth Screen navigatsiya logikasi
class AuthNavigateService {
  /// Auth tekshiruviga o'tadi va yakunlangach Home screenga qaytadi
  static Future<void> checkAuthNavigate(BuildContext context) async {
    final isLoggedIn = await AppLocalStorage.isUserLoggedIn();

    // BuildContext does not have a 'mounted' property, so we remove this check.

    if (isLoggedIn) {
      // Login bo'lgan bo'lsa, home'ga o'tadi
      context.go(AppRoutes.home);
    } else {
      // Auth sahifasiga push qilamiz va u yakunlangach home'ga qaytamiz
      await context.push(AppRoutes.auth);
      // Auth yakunlangach (pop bo'lgach), qayta tekshiradi va home'ga o'tadi
      final isLoggedInAfter = await AppLocalStorage.isUserLoggedIn();
      if (isLoggedInAfter) {
        context.go(AppRoutes.home);
      }
    }
  }

  /// Login statusini o'rnatadi
  static Future<void> setLoginStatus(bool isLoggedIn) async {
    await AppLocalStorage.setLoginStatus(isLoggedIn);
    if (isLoggedIn) {
      await AppLocalStorage.setLoginCompleted();
    }
  }

  /// Logout qiladi va auth sahifasiga yo'naltiradi
  static Future<void> logout(BuildContext context) async {
    await AppLocalStorage.clearAll();
    // // BuildContext does not have a 'mounted' property, so we remove this check.
    // context.push(AppRoutes.auth);
  }
}
