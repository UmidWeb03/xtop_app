import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_constants.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/ui/screens/home/widgets/bottom_navigation_bar.dart';

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens> {
  final List<String> _screens = [
    AppRoutes.homeScreen,
    AppRoutes.categoryScreen,
    AppRoutes.cartScreen,
    AppRoutes.locationScreen,
    AppRoutes.newsScreen,
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens.map((e) => AppRoutes.routes[e]!(context)).toList(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.accentColor,
            icon: Image.asset('assets/icons/home_ligth.png'),
            activeIcon: Image.asset('assets/icons/home_dark.png'),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/category_ligth.png'),
            activeIcon: Image.asset('assets/icons/category_dark.png'),
            label: 'Kategoriya',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/cart_ligth.png'),
            activeIcon: Image.asset('assets/icons/cart_dark.png'),
            label: 'Savat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/location_ligth.png'),
            activeIcon: Image.asset('assets/icons/location_dark.png'),
            label: 'Joylashuv',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/news_ligth.png'),
            activeIcon: Image.asset('assets/icons/news_dark.png'),
            label: 'Yangiliklar',
          ),
        ],
      ),
    );
  }
}
