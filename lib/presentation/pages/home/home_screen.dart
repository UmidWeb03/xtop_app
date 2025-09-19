import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/data/repositories/product_name_data.dart';
import 'package:xtop_app/data/repositories/product_data.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/search_button.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/headers/app_header.dart';
import 'package:xtop_app/presentation/organisms/sections/product_card.dart';

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
    final products = ProductData.products(context);
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
              onTap: () => context.push(AppRoutes.search),
              readOnly: false,
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
                  onTap: () => context.push(AppRoutes.auth),
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
          const _BodyCategorieSection(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                // mainAxisSpacing: 24,
                childAspectRatio: 180 / 350,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyCategorieSection extends StatelessWidget {
  const _BodyCategorieSection();

  static final productNames = ProductNameData.productName;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = -1; // local state handled by StatefulBuilder
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productNames.length,
        itemBuilder: (context, index) {
          final productName = productNames[index];
          final isSelected = index == selectedIndex;
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: 12,
            ),
            child: PrimaryButton(
              onPressed: () {
                selectedIndex = index;
                (context as Element).markNeedsBuild();
              },
              width: 0,
              height: 38,
              label: productName.name,
              border: const BorderSide(
                width: 2,
                color: AppColors.primaryColor,
              ),
              fontWeight: FontWeight.normal,
              textColor: isSelected ? Colors.white : AppColors.primaryColor,
              backgroundColor: isSelected
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
            ),
          );
        },
      ),
    );
  }
}
