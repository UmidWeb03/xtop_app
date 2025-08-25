import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/screens/cart/cart.screen.dart';
import 'package:xtop_app/presentation/screens/category/category_screen.dart';
import 'package:xtop_app/presentation/screens/app.dart';
import 'package:xtop_app/presentation/screens/home/home_screen.dart';
import 'package:xtop_app/presentation/screens/lacation/location_screen.dart';
import 'package:xtop_app/presentation/screens/news/news_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/first_onboarding_screen.dart'
    as first_onboarding;
import 'package:xtop_app/presentation/screens/auth/onboarding/second_onboarding_screen.dart'
    as second_onboarding;
import 'package:xtop_app/presentation/screens/auth/sign_in/sign_in.dart';
import 'package:xtop_app/presentation/screens/splash/splash_screen.dart';
import 'package:xtop_app/presentation/screens/auth/onboarding/welcome_screen.dart';

class AppRoutes {
  static String splashScreen = '/';
  static String welcomeScreen = '/welcome';
  static String firstOnboardingScreen = '/first_onboarding';
  static String secondOnboardingScreen = '/second_onboarding';
  static String appScreen = '/app';
  static String homeScreen = '/home';
  static String signInScreen = '/sign_in';
  static String categoryScreen = '/category';
  static String cartScreen = '/cart';
  static String locationScreen = '/location';
  static String newsScreen = '/news';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    firstOnboardingScreen: (context) =>
        const first_onboarding.FirstOnboardingScreen(),
    secondOnboardingScreen: (context) =>
        const second_onboarding.SecondOnboardingScreen(),
    appScreen: (context) => const AppScreens(),
    homeScreen: (context) => const HomeScreen(),
    signInScreen: (context) => const SignInScreen(),
    categoryScreen: (context) => const CategoryScreen(),
    cartScreen: (context) => const CartScreen(),
    locationScreen: (context) => const LocationScreen(),
    newsScreen: (context) => const NewsScreen(),
  };
}
