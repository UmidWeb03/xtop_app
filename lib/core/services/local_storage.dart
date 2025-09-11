import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const String _isFirstLaunchKey = 'is_first_launch';
  static const String _isOnboardingCompletedKey = 'is_onboarding_completed';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _isLoginCompletedKey = 'is_login_completed';

  /// Ilovaga birinchi marta kirilganmi tekshiradi
  /// true = birinchi marta, false = ikkinchi martadan keyin
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunchKey) ?? true;
  }

  /// Birinchi launch tugaganligini belgilaydi
  /// Onboarding boshlanishida chaqiriladi
  static Future<void> setFirstLaunchCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLaunchKey, false);
  }

  /// Onboarding tugaganligini tekshiradi
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isOnboardingCompletedKey) ?? false;
  }

  /// Onboarding tugaganligini belgilaydi
  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isOnboardingCompletedKey, true);
  }

  /// Foydalanuvchi login qilganligini tekshiradi
  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  /// Login holatini o'rnatadi
  static Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  /// Login tugaganligini tekshiradi
  static Future<bool> isLoginCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoginCompletedKey) ?? false;
  }

  /// Login tugaganligini belgilaydi
  static Future<void> setLoginCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoginCompletedKey, true);
  }

  /// Barcha ma'lumotlarni tozalaydi (Logout)
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
