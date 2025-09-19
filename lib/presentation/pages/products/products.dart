import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/presentation/atoms/buttons/secondary_button.dart';
import 'package:xtop_app/presentation/atoms/colors/product_colors.dart';
import 'package:xtop_app/presentation/atoms/icons/app_icon.dart';
import 'package:xtop_app/presentation/atoms/texts/app_text.dart';
import 'package:xtop_app/presentation/organisms/product_grid/product_grid.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.secondaryColor,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/img.png',
                width: double.infinity,
                height: 428,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: 'P9 kalonkalari, simsiz',
                          size: 28,
                          font: FontWeight.bold,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AppIcons(
                            iconPath: 'assets/icons/like.png',
                            iconHeight: 28,
                            iconWidth: 28,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.searchColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            child: AppText(
                              text: '9,742 ta sotildi',
                              size: 12,
                              // font: FontWeight.w500,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                        AppIcons(
                          iconPath: 'assets/images/star.png',
                          iconHeight: 20,
                          iconWidth: 20,
                        ),
                        AppText(
                          text: '4.8 (6,573 sharhlar)',
                          size: 15,
                          // font: FontWeight.w500,
                          color: AppColors.darkColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Divider(
                      color: AppColors.searchColor.withOpacity(0.3),
                      thickness: 1,
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      text: 'Ta’rifi',
                      size: 24,
                      font: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
                      textSpan: 'batafsil..',
                      size: 13.5,
                    ),
                    const SizedBox(height: 16),
                    AppText(
                      text: 'Rang',
                      size: 24,
                      font: FontWeight.bold,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ProductColorSection(color: ProductColors.oneColor),
                        const SizedBox(width: 8),
                        ProductColorSection(color: ProductColors.twoColor),
                        const SizedBox(width: 8),
                        ProductColorSection(color: ProductColors.threeColor),
                        const SizedBox(width: 8),
                        ProductColorSection(color: ProductColors.fourColor),
                        const SizedBox(width: 8),
                        ProductColorSection(color: ProductColors.fiveColor),
                        const SizedBox(width: 8),
                        ProductColorSection(color: ProductColors.sixColor),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        AppText(
                          text: 'Miqdor',
                          size: 24,
                          font: FontWeight.bold,
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 139,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.searchColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: AppText(
                                  text: '-',
                                  size: 24,
                                  font: FontWeight.w600,
                                ),
                              ),
                              AppText(
                                text: '2',
                                size: 24,
                                font: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: AppText(
                                  text: '+',
                                  size: 24,
                                  font: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.searchColor.withOpacity(0.4),
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'Umumiy narxi',
                              size: 14,
                              font: FontWeight.w400,
                              color: AppColors.darkColor,
                            ),
                            const SizedBox(height: 4),
                            AppText(
                              text: '50 000 sum',
                              size: 24,
                              font: FontWeight.bold,
                            ),
                          ],
                        ),
                        SecondaryButton(
                          width: 0,
                          height: 58,
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.secondaryColor,
                          onPressed: () {},
                          label: 'Savatga qo’shish',
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: AppColors.searchColor.withOpacity(0.4),
                      thickness: 1,
                    ),
                    ProductGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
