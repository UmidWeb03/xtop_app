import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/data/models/navigation_item.dart';
import 'package:xtop_app/presentation/atoms/buttons/bottom_navigation_bar.dart';

final GlobalKey<_AppScreensState> appScreensKey = GlobalKey<_AppScreensState>();

class AppScreens extends StatefulWidget {
  const AppScreens({super.key, required Widget child});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<NavigationItem> items = NavigationItem.navigationItems;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: items.map((item) => item.screen).toList(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: items
            .map(
              (item) => BottomNavigationBarItem(
                backgroundColor: AppColors.secondaryColor,
                icon: Image.asset(
                  item.lightIconPath,
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  item.darkIconPath,
                  width: 24,
                  height: 24,
                ),
                label: item.label,
                tooltip: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
