import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/services/local_storage.dart';

class SplashScreenNavigateService {
  Future<void> checkNavigateSplash(BuildContext context) async {
    /// 2-3 soniya splashScreen ko'rsatadi
    await Future.delayed(const Duration(seconds: 2));

    final isFirstLaunch = await AppLocalStorage.isFirstLaunch();

    if (!isFirstLaunch || isFirstLaunch == true) {
      // birinchi marta ilovaga kirilganda: Splash'dan WelcomeScreen'ga o'tadi
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);

      /// Ikkinchi onboarding tugagach first launch ni false qilib HomeScreen'ga o'tadi
      await AppLocalStorage.setFirstLaunchDone();
    } else {
      // ikkinchi marta ilovaga kirilganda: Splash'dan HomeScreen'ga o'tadi
      Navigator.pushReplacementNamed(context, AppRoutes.appScreen);
    }
  }
}
