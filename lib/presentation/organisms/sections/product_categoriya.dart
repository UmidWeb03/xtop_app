import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/presentation/atoms/icons/app_logo.dart';

class ProductCategorySection extends StatelessWidget {
  const ProductCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.products);
      },
      child: Container(
        width: 370,
        height: 120,
        margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Image.asset(
              'assets/icons/category/colors.png',
              width: 370,
              height: 120,
              // fit: BoxFit.cover,
            ),
            Positioned(
              width: 370,
              height: 120,
              left: 16,
              // top: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 9,
                      // bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Elektronika',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'bo\'limi',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                        SizedBox(height: 21),
                        AppLogo(width: 42, height: 19)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      'assets/icons/category/airPods.png',
                      width: 119,
                      height: 119,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  // const SizedBox(width: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
