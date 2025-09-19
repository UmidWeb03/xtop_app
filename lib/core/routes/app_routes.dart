import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/presentation/pages/products/products.dart';
import 'package:xtop_app/presentation/pages/profile/profile.dart';

// Core screens
import 'package:xtop_app/presentation/templates/app.dart';
import 'package:xtop_app/presentation/pages/splash/splash_screen.dart';

// Onboarding screens
import 'package:xtop_app/presentation/pages/onboarding/onboarding.dart';
import 'package:xtop_app/presentation/pages/onboarding/first_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/second_screen.dart';
import 'package:xtop_app/presentation/pages/onboarding/third_screen.dart';

// Auth screens
import 'package:xtop_app/presentation/pages/auth/auth_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_in/sign_in_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_up/sign_up_screen.dart';

import 'package:xtop_app/presentation/pages/auth/phone_login/login_code/phone_login_code_screen.dart';
import 'package:xtop_app/presentation/pages/auth/phone_login/phone_number_login_screen.dart';

import 'package:xtop_app/presentation/pages/auth/sign_in/forgot_password/forgot_password_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_in/forgot_password/verify_email_code/verify_code_email_screen.dart';
import 'package:xtop_app/presentation/pages/auth/sign_in/forgot_password/verify_phone_code/verify_code_phone_screen.dart';

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

  // onboarding screens
  static const String onboarding = '/onboarding';
  static const String firstOnboarding = '/onboarding/first';
  static const String secondOnboarding = '/onboarding/second';
  static const String thirdOnboarding = '/onboarding/third';

  // auth screens
  static const String auth = '/auth';
  static const String signIn = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';
  static const String forgotPassword = '/auth/sign-in/forgot-password';
  static const String forgotPhoneCode =
      '/auth/sign-in/forgot-password/phone-code';
  static const String forgotEmailCode =
      '/auth/sign-in/forgot-password/email-code';
  static const String phoneLogin = '/auth/phone-login';
  static const String verifyCode = '/auth/phone-login/verify-code';
  static const String signUpPhoneLogin = '/auth/sign-up/phone-login';
  static const String signUpVerifyCode =
      '/auth/sign-up/phone-login/verify-code';

  // navigation screens
  static const String home = '/home';
  static const String category = '/category';
  static const String cart = '/cart';
  static const String location = '/location';
  static const String news = '/news';

  // profile screens
  static const String profile = '/profile';

  static const String products = '/products';

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
            onPressed: () => context.go(AppRoutes.home),
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

    // Onboarding routes - Foydalanuvchini tanishtirishdar
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
      routes: [
        GoRoute(
          path: 'first',
          name: 'first_onboarding',
          builder: (context, state) => const FirstScreen(),
        ),
        GoRoute(
          path: 'second',
          name: 'second_onboarding',
          builder: (context, state) => const SecondScreen(),
        ),
        GoRoute(
          path: 'third',
          name: 'third_onboarding',
          builder: (context, state) => const ThirdScreen(),
        ),
      ],
    ),

    // Authentication routes - Autentifikatsiya bilan bog'liq sahifalar
    GoRoute(
      path: AppRoutes.auth,
      name: 'auth',
      builder: (context, state) => const AuthScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          name: 'sign_in',
          builder: (context, state) => const SignInScreen(),
          routes: [
            GoRoute(
              path: 'forgot-password',
              name: 'forgot_password',
              builder: (context, state) => const ForgotPasswordScreen(),
              routes: [
                GoRoute(
                  path: 'phone-code',
                  name: 'forgot_phone_code',
                  builder: (context, state) => VerifyPhoneCodeScreen(),
                ),
                GoRoute(
                  path: 'email-code',
                  name: 'forgot_email_code',
                  builder: (context, state) => const VerifyEmailCodeScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'sign-up',
          name: 'sign_up',
          builder: (context, state) => const SignUpScreen(),
          routes: [
            GoRoute(
              path: 'phone-login',
              name: 'sign_up_phone_login',
              builder: (context, state) => const PhoneNumberLoginScreen(),
              routes: [
                GoRoute(
                  path: 'verify-code',
                  name: 'sign_up_verify_code',
                  builder: (context, state) => const PhoneLoginCodeScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'phone-login',
          name: 'auth_phone_login',
          builder: (context, state) => const PhoneNumberLoginScreen(),
          routes: [
            GoRoute(
              path: 'verify-code',
              name: 'auth_verify_code',
              builder: (context, state) => const PhoneLoginCodeScreen(),
            ),
          ],
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

    GoRoute(
      path: AppRoutes.search,
      name: 'search',
      builder: (context, state) => const SearchScreen(),
    ),

    GoRoute(
      path: AppRoutes.profile,
      name: 'profile',
      builder: (context, state) => const Profile(),
    ),

    GoRoute(
      path: AppRoutes.products,
      name: 'products',
      builder: (context, state) => const ProductsScreen(),
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
}
