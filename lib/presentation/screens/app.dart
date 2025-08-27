import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/models/navigation_item.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/screens/home/widgets/bottom_navigation_bar.dart';

final GlobalKey<_AppScreensState> appScreensKey = GlobalKey<_AppScreensState>();

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

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

  void goToLikeScreen() {
    _onItemTapped(2);
  }

  void goToCategorieScreen() {
    _onItemTapped(1);
  }

  // void goTOHomeScreen() {
  //   AppRoutes.navigateTo(context, AppRoutes.appScreen);
  // }

  void goToAuthScreen() {
    AppRoutes.navigateTo(context, AppRoutes.authScreen);
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
