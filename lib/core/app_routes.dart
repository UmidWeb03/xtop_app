import 'package:flutter/material.dart';
// import 'package:xtop_app/controllers/bloc/splash_bloc_bloc.dart';
import 'package:xtop_app/views/home/home_screen.dart';
import 'package:xtop_app/views/onboarding/first_onboarding_screen.dart'
    as first_onboarding;
import 'package:xtop_app/views/onboarding/second_onboarding_screen.dart'
    as second_onboarding;
import 'package:xtop_app/views/splash/splash_screen.dart';
import 'package:xtop_app/views/onboarding/welcome_screen.dart';

class AppRoutes {
  static String splash = '/';
  static String welcome = '/welcome';
  static String firstOnboarding = '/first_onboarding';
  static String secondOnboarding = '/second_onboarding';
  static String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    welcome: (context) => const WelcomeScreen(),
    firstOnboarding: (context) =>
        const first_onboarding.FirstOnboardingScreen(),
    secondOnboarding: (context) =>
        const second_onboarding.SecondOnboardingScreen(),
    home: (context) => const HomeScreen(),
  };
}
