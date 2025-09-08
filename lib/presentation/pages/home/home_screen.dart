import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/data/repositories/product_name_data.dart';
import 'package:xtop_app/data/repositories/product_data.dart';
import 'package:xtop_app/presentation/atoms/buttons/app_button.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/search_button.dart';
import 'package:xtop_app/presentation/atoms/images/app_background_img.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/headers/app_header.dart';
import 'package:xtop_app/presentation/organisms/sections/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              const AppBackgroundImage(
                  image: 'assets/images/app_background.png'),
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        const AppHeader(),
                        const _HomeBodySection(),
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
  const _HomeBodySection();
  static final products = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: SearchButton(
              onTap: () => context.push(AppRoutes.search),
              readOnly: false,
            ),
          ),
          const AppText(
            text: 'Maxsus takliflar',
            color: AppColors.greyscaleDarkColor,
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
                  color: AppColors.greyscaleDarkColor,
                  size: 20,
                  font: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () => context.push(AppRoutes.auth),
                  child: const AppText(
                    text: 'Barchasi',
                    color: AppColors.greyscaleDarkColor,
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
            padding: EdgeInsets.all(24),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 182 / 357,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                if (products.isEmpty) {
                  return const Center(child: Text('Mahsulotlar topilmadi'));
                }
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

class _BodyCategorieSection extends StatefulWidget {
  const _BodyCategorieSection();

  @override
  State<_BodyCategorieSection> createState() => _BodyCategorieSectionState();
}

class _BodyCategorieSectionState extends State<_BodyCategorieSection> {
  int selectedIndex = -1;

  final productNames = ProductNameData.productName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productNames.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final productName = productNames[index % productNames.length];
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == productNames.length - 1 ? 12 : 12,
            ),
            child: AppButton(
              onPressed: () {
                setState(() {
                  selectedIndex = selectedIndex == index ? -1 : index;
                });
              },
              text: productName.name,
              border: BorderSide(
                width: 2,
                color: AppColors.primaryColor,
              ),
              fontWeight: FontWeight.normal,
              textColor: isSelected
                  ? AppColors.secondaryColor
                  : AppColors.greyscaleDarkColor,
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
