import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/screens/cart/cart_screen.dart';
import 'package:xtop_app/presentation/screens/categorie/categorie_screen.dart';
import 'package:xtop_app/presentation/screens/home/home_screen.dart';
import 'package:xtop_app/presentation/screens/location/location_screen.dart';
import 'package:xtop_app/presentation/screens/news/news_screen.dart';

class NavigationItem {
  final String lightIconPath;
  final String darkIconPath;
  final String label;
  final Widget screen;

  const NavigationItem({
    required this.lightIconPath,
    required this.darkIconPath,
    required this.label,
    required this.screen,
  });

  static const List<NavigationItem> navigationItems = [
    NavigationItem(
      lightIconPath: 'assets/icons/light/home_light.png',
      darkIconPath: 'assets/icons/dark/home_dark.png',
      label: 'Asosiy',
      screen: HomeScreen(),
    ),
    NavigationItem(
      lightIconPath: 'assets/icons/light/category_light.png',
      darkIconPath: 'assets/icons/dark/category_dark.png',
      label: 'Kategoriya',
      screen: CategoryScreen(),
    ),
    NavigationItem(
      lightIconPath: 'assets/icons/light/cart_light.png',
      darkIconPath: 'assets/icons/dark/cart_dark.png',
      label: 'Savat',
      screen: CartScreen(),
    ),
    NavigationItem(
      lightIconPath: 'assets/icons/light/location_light.png',
      darkIconPath: 'assets/icons/dark/location_dark.png',
      label: 'Joylashuv',
      screen: LocationScreen(),
    ),
    NavigationItem(
      lightIconPath: 'assets/icons/light/news_light.png',
      darkIconPath: 'assets/icons/dark/news_dark.png',
      label: 'Yangiliklar',
      screen: NewsScreen(),
    ),
  ];
}
