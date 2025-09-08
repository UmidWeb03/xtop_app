import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const String _isFirstLaunchKey = 'is_first_launch';

  /// Faqat birinchi marta ishga tushirilgaan bo'lsa true,
  /// ikkinchi marta ishga tushirilganda false
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunchKey) ?? true;
  }

  /// Birinchi launch tugaganda ishga tushadi
  /// Onboarding tugagach chaqiriladi
  static Future<void> setFirstLaunchDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLaunchKey, false);
  }
}
