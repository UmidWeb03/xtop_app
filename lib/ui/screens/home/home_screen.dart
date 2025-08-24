import 'package:flutter/material.dart';
import 'package:xtop_app/core/app_routes.dart';
import 'package:xtop_app/ui/widgets/App_button.dart';
import 'package:xtop_app/core/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              _home_background(),
              CustomScrollView(
                slivers: [
                  _header_section(context: context),
                  _body_section(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _home_background() {
    return Image.asset(
      'assets/images/x_background.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _header_section({required BuildContext context}) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _header_app_bar_logo(),
          _header_app_bar_button(context: context),
        ],
      ),
    );
  }

  Widget _header_app_bar_logo() {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Image.asset(
        'assets/images/x_logo.png',
        height: 107,
        width: 107,
      ),
    );
  }

  Widget _header_app_bar_button({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AppButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.firstOnboarding);
        },
        text: 'krish',
        width: 79,
        height: 38,
        backgroundColor: AppColors.accentColor,
      ),
    );
  }

  Widget _body_section() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 675,
        // color: AppColors.secondaryColor,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _body_search_section(),
            _body_banner_text(),
            _body_banner_section()
          ],
        ),
      ),
    );
  }

  Widget _body_search_section() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Qidiruv',
          hintStyle: TextStyle(color: AppColors.greyscaleColor),
          prefixIcon: Image.asset('assets/icons/search.png'),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/voice.png'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Image.asset('assets/icons/filter.png'),
              ),
            ],
          ),
          filled: true,
          fillColor: AppColors.searchColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // bir xil radius
            borderSide: BorderSide(
              color: AppColors.greyscaleColor, // bir xil rang
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _body_banner_text() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 0,
        bottom: 24.0,
      ),
      child: Text(
        'Maxsus takliflar',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _body_banner_section() {
    return SizedBox(
      width: double.infinity,
      height: 181,
      child: Image.asset(
        'assets/images/home_banner.png',
        fit: BoxFit.cover,
      ),
    );
  }

  // Widget _bottom_navigation_bar() {
  //   return BottomNavigationBar(
  //     currentIndex: _current_index,
  //     onTap: (index) {
  //       setState(() {
  //         _current_index = index;
  //       });
  //     },
  //     type: BottomNavigationBarType.fixed,
  //     enableFeedback: false,
  //     selectedItemColor: AppColors.greyscaleDarkColor,
  //     unselectedItemColor: AppColors.greyscaleColor,
  //     selectedLabelStyle: TextStyle(
  //       fontWeight: FontWeight.bold,
  //     ),
  //     backgroundColor: AppColors.secondaryColor,
  //     items: [
  //       BottomNavigationBarItem(
  //         backgroundColor: AppColors.accentColor,
  //         icon: Image.asset('assets/icons/home_ligth.png'),
  //         activeIcon: Image.asset('assets/icons/home_dark.png'),
  //         label: 'Asosiy',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image.asset('assets/icons/category_ligth.png'),
  //         activeIcon: Image.asset('assets/icons/category_dark.png'),
  //         label: 'Kategoriya',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image.asset('assets/icons/cart_ligth.png'),
  //         activeIcon: Image.asset('assets/icons/cart_dark.png'),
  //         label: 'Savat',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image.asset('assets/icons/location_ligth.png'),
  //         activeIcon: Image.asset('assets/icons/location_dark.png'),
  //         label: 'Joylashuv',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image.asset('assets/icons/news_ligth.png'),
  //         activeIcon: Image.asset('assets/icons/news_dark.png'),
  //         label: 'Yangiliklar',
  //       ),
  //     ],
  //   );
  // }
}
