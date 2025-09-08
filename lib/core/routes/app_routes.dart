import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Core screens
import 'package:xtop_app/presentation/app.dart';
import 'package:xtop_app/presentation/pages/splash/splash_screen.dart';

// Onboarding screens
import 'package:xtop_app/presentation/pages/auth/onboarding/onboarding.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/welcome_screen.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/first_onboarding_screen.dart';
import 'package:xtop_app/presentation/pages/auth/onboarding/second_onboarding_screen.dart';

// Auth screens
import 'package:xtop_app/presentation/pages/auth/sign_in/sign_in.dart';
import 'package:xtop_app/presentation/pages/auth/auth_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_up/sign_up.dart';

// Navigation screen
import 'package:xtop_app/presentation/pages/home/home_screen.dart';
import 'package:xtop_app/presentation/pages/categorie/categorie_screen.dart';
import 'package:xtop_app/presentation/pages/cart/cart_screen.dart';
import 'package:xtop_app/presentation/pages/location/location_screen.dart';
import 'package:xtop_app/presentation/pages/news/news_screen.dart';

// app screens
import 'package:xtop_app/presentation/pages/search/search_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Route paths constants

  // core screens
  static const String splash = '/';
  static const String app = '/app';

  // onboarding screens
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String firstOnboarding = '/onboarding/first';
  static const String secondOnboarding = '/onboarding/second';

  // auth screens
  static const String auth = '/auth';
  static const String signIn = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';

  // navigation screens
  static const String home = '/home';
  static const String category = '/category';
  static const String cart = '/cart';
  static const String location = '/location';
  static const String news = '/news';

  // app screens
  static const String search = '/search';
}

// GoRouter konfiguratsiyasi
final GoRouter appRouter = GoRouter(
  // Boshlang'ich marshrut
  initialLocation: AppRoutes.splash,

  // Xatolik sahifasi
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Xatolik')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Sahifa topilmadi: ${state.uri}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.splash),
            child: const Text('Bosh sahifaga qaytish'),
          ),
        ],
      ),
    ),
  ),

  // Debug rejimida ma'lumotlar
  debugLogDiagnostics: true,

  // Barcha marshrrutlar
  routes: [
    // Splash Screen - Boshlang'ich yuklash sahifasi
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Onboarding routes - Foydalanuvchini tanishtirishda foydalaniladigan sahifalar
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const Onboarding(),
      routes: [
        // Xush kelibsiz sahifasi
        GoRoute(
          path: AppRoutes.welcome,
          name: 'welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        // Birinchi onboarding sahifasi
        GoRoute(
          path: 'first', // /onboarding/first
          name: 'first_onboarding',
          builder: (context, state) => const FirstOnboardingScreen(),
        ),
        // Ikkinchi onboarding sahifasi
        GoRoute(
          path: 'second', // /onboarding/second
          name: 'second_onboarding',
          builder: (context, state) => const SecondOnboardingScreen(),
        ),
      ],
    ),

    // Authentication routes - Autentifikatsiya bilan bog'liq sahifalar
    GoRoute(
      path: AppRoutes.auth,
      name: 'auth',
      builder: (context, state) => const AuthScreen(),
      routes: [
        // Kirish sahifasi
        GoRoute(
          path: 'sign-in', // /auth/sign-in
          name: 'sign_in',
          builder: (context, state) => const SignInScreen(),
        ),

        GoRoute(
          path: 'sign-up', // /auth/sign-up
          name: 'sign_up',
          builder: (context, state) => const SignUpScreen(),
        ),
      ],
    ),

    // Asosiy app sahifasi - Shell route sifatida
    ShellRoute(
      builder: (context, state, child) => AppScreens(child: child),
      routes: [
        // Bosh sahifa
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),

        // Kategoriyalar sahifasi
        GoRoute(
          path: AppRoutes.category,
          name: 'category',
          builder: (context, state) => const CategoryScreen(),
        ),

        // Savatcha sahifasi
        GoRoute(
          path: AppRoutes.cart,
          name: 'cart',
          builder: (context, state) => const CartScreen(),
        ),

        // Joylashuv sahifasi
        GoRoute(
          path: AppRoutes.location,
          name: 'location',
          builder: (context, state) => const LocationScreen(),
        ),

        // Yangiliklar sahifasi
        GoRoute(
          path: AppRoutes.news,
          name: 'news',
          builder: (context, state) => const NewsScreen(),
        ),
      ],
    ),

    // Qidiruv sahifasi
    GoRoute(
      path: AppRoutes.search,
      name: 'search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);

// Navigation helper metodlari
class AppNavigation {
  static final GoRouter router = appRouter;

  // Sahifaga o'tish (stackni saqlab qolish)
  static void push(BuildContext context, String path) {
    context.push(path);
  }

  // Sahifaga o'tish va stackni tozalash
  static void go(BuildContext context, String path) {
    context.go(path);
  }

  // Orqaga qaytish
  static void pop(BuildContext context) {
    context.pop();
  }

  // Named route bilan navigatsiya
  static void pushNamed(BuildContext context, String name,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters}) {
    context.pushNamed(name,
        pathParameters: pathParameters ?? {},
        queryParameters: queryParameters ?? {});
  }

  static void goNamed(BuildContext context, String name,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters}) {
    context.goNamed(name,
        pathParameters: pathParameters ?? {},
        queryParameters: queryParameters ?? {});
  }

  // // Sahifani almashtirish
  // static void pushReplacement(BuildContext context, String path) {
  //   context.pushReplacement(path);
  // }

  // // Barcha sahifalarni tozalab yangi sahifaga o'tish
  // static void pushAndRemoveUntil(BuildContext context, String path) {
  //   context.go(path);
  // }
}
