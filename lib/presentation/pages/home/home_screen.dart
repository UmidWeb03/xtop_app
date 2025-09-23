import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/search_button.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/headers/app_header.dart';
import 'package:xtop_app/presentation/organisms/products/product_name_list.dart';
import 'package:xtop_app/presentation/organisms/products/product_grid.dart';
import 'package:xtop_app/presentation/pages/auth/auth_screen.dart';
import 'package:xtop_app/presentation/pages/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool _isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _isLoggedIn ? AppColors.secondaryColor : AppColors.primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              if (!_isLoggedIn)
                AppBackgroundImage(image: 'assets/images/app_background.png'),
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        AppHeader(
                          isLoggedIn: _isLoggedIn,
                        ),
                        _HomeBodySection(isLoggedIn: _isLoggedIn),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeBodySection extends StatelessWidget {
  final bool isLoggedIn;
  const _HomeBodySection({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLoggedIn ? AppColors.secondaryColor : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: SearchButton(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchScreen()),
              ),
              readOnly: true,
              width: 0,
            ),
          ),
          const AppText(
            text: 'Maxsus takliflar',
            color: AppColors.darkColor,
            size: 20,
            font: FontWeight.bold,
            padding: EdgeInsets.only(left: 24, right: 24),
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/images/banner.png',
            width: double.infinity,
            height: 181,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                  text: 'Eng mashhurlari',
                  color: AppColors.darkColor,
                  size: 20,
                  font: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                  ),
                  child: const AppText(
                    text: 'Barchasi',
                    color: AppColors.darkColor,
                    size: 15,
                    font: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const ProductNameList(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ProductGrid(),
          ),
        ],
      ),
    );
  }
}
