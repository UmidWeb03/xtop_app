import 'package:flutter/material.dart';
import 'package:xtop_app/ui/screens/cart/cart.screen.dart';
import 'package:xtop_app/ui/screens/category/category_screen.dart';
// import 'package:xtop_app/controllers/bloc/splash_bloc_bloc.dart';
import 'package:xtop_app/ui/screens/home/home_screen.dart';
import 'package:xtop_app/ui/screens/lacation/location_screen.dart';
import 'package:xtop_app/ui/screens/news/news_screen.dart';
import 'package:xtop_app/ui/screens/onboarding/first_onboarding_screen.dart'
    as first_onboarding;
import 'package:xtop_app/ui/screens/onboarding/second_onboarding_screen.dart'
    as second_onboarding;
import 'package:xtop_app/ui/screens/sign_in/sign_in.dart';
import 'package:xtop_app/ui/screens/splash/splash_screen.dart';
import 'package:xtop_app/ui/screens/onboarding/welcome_screen.dart';

class AppRoutes {
  static String splash = '/';
  static String welcome = '/welcome';
  static String firstOnboarding = '/first_onboarding';
  static String secondOnboarding = '/second_onboarding';
  static String home = '/home';
  static String signIn = '/sign_in';
  static String category = '/category';
  static String cart = '/cart';
  static String location = '/location';
  static String news = '/news';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    welcome: (context) => const WelcomeScreen(),
    firstOnboarding: (context) =>
        const first_onboarding.FirstOnboardingScreen(),
    secondOnboarding: (context) =>
        const second_onboarding.SecondOnboardingScreen(),
    home: (context) => const HomeScreen(),
    signIn: (context) => const SignInScreen(),
    category: (context) => const CategoryScreen(),
    cart: (context) => const CartScreen(),
    location: (context) => const LocationScreen(),
    news: (context) => const NewsScreen(),
  };
}
