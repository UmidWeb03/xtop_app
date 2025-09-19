import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const String _isFirstLaunchKey = 'is_first_launch';
  static const String _isOnboardingCompletedKey = 'is_onboarding_completed';

  // First Launch
  static Future<bool> isFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isFirstLaunchKey) ?? true;
    } catch (e) {
      debugPrint('Error reading first launch: $e');
      return true;
    }
  }

  static Future<void> setFirstLaunchCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isFirstLaunchKey, false);
    } catch (e) {
      debugPrint('Error setting first launch completed: $e');
    }
  }

  // Onboarding
  static Future<bool> isOnboardingCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isOnboardingCompletedKey) ?? false;
    } catch (e) {
      debugPrint('Error reading onboarding status: $e');
      return false;
    }
  }

  static Future<void> setOnboardingCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isOnboardingCompletedKey, true);
    } catch (e) {
      debugPrint('Error setting onboarding completed: $e');
    }
  }

  // Clear all data
  static Future<void> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      debugPrint('Error clearing all data: $e');
    }
  }

  // Reset onboarding (debug uchun)
  static Future<void> resetOnboarding() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isFirstLaunchKey, true);
      await prefs.setBool(_isOnboardingCompletedKey, false);
    } catch (e) {
      debugPrint('Error resetting onboarding: $e');
    }
  }
}
