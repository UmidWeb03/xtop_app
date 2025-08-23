import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/services/local_storage.dart';

class NavigationService {
  Future<void> checkNavigationSplash(BuildContext context) async {
    final isFirstLaunch = await LocalStorage.isFirstLaunch();
    final onboardingStatus = await LocalStorage.getOnboardingStatus();

    if (isFirstLaunch || onboardingStatus) {
      // Birinchi marta ilovaga kirilganda → WelcomeScreen
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    } else {
      // ikkinchi marta ilovaga kirilganda → HomeScreeni
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }
}
