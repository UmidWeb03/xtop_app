import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String isFirstLaunchKey = 'is_first_launch';

  /// Faqat birinchi marta ishga tushirilganini belgilash
  static Future<void> setFirstLaunchDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstLaunchKey, true);
  }

  /// Agar oldin ishga tushirilgan bo‘lsa true qaytaradi
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstLaunchKey) ?? false;
  }

  static getOnboardingStatus() {}
}
