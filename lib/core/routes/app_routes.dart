import 'package:flutter/material.dart';

// Core screens
import 'package:xtop_app/presentation/screens/app.dart';
import 'package:xtop_app/presentation/screens/splash/splash_screen.dart';

// Auth screens
import 'package:xtop_app/presentation/screens/auth/onboarding/welcome_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/first_onboarding_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/second_onboarding_screen.dart';
import 'package:xtop_app/presentation/screens/auth/sign_in/sign_in.dart';

// Main app screens
import 'package:xtop_app/presentation/screens/home/home_screen.dart';
import 'package:xtop_app/presentation/screens/category/category_screen.dart';
import 'package:xtop_app/presentation/screens/cart/cart_screen.dart';
import 'package:xtop_app/presentation/screens/location/location_screen.dart';
import 'package:xtop_app/presentation/screens/news/news_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Core routes
  static const String splashScreen = '/';
  static const String welcomeScreen = '/welcome';

  // Auth routes
  static const String firstOnboardingScreen = '/onboarding/first';
  static const String secondOnboardingScreen = '/onboarding/second';
  static const String signInScreen = '/auth/sign-in';

  // Main app routes
  static const String appScreen = '/app';
  static const String homeScreen = '/home';
  static const String categoryScreen = '/category';
  static const String cartScreen = '/cart';
  static const String locationScreen = '/location';
  static const String newsScreen = '/news';

  static final Map<String, WidgetBuilder> routes = {
    // Core routes
    splashScreen: (context) => const SplashScreen(),

    // Auth routes
    firstOnboardingScreen: (context) => const FirstOnboardingScreen(),
    secondOnboardingScreen: (context) => const SecondOnboardingScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),

    signInScreen: (context) => const SignInScreen(),

    // Main app routes
    appScreen: (context) => const AppScreens(),
    homeScreen: (context) => const HomeScreen(),
    categoryScreen: (context) => const CategoryScreen(),
    cartScreen: (context) => const CartScreen(),
    locationScreen: (context) => const LocationScreen(),
    newsScreen: (context) => const NewsScreen(),
  };

  // Helper navigation methoddi
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
