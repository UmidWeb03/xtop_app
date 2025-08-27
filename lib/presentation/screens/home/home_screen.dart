import 'package:flutter/material.dart';
import 'package:xtop_app/core/models/product_categorie.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/data/product_categorie_data.dart';
import 'package:xtop_app/data/product_data.dart';
import 'package:xtop_app/presentation/screens/app.dart';
import 'package:xtop_app/presentation/screens/home/widgets/home_bottom.dart';
import 'package:xtop_app/presentation/screens/home/widgets/search_action_bottom.dart';
import 'package:xtop_app/presentation/widgets/app_button.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/models/product.dart';

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
              const _HomeBackgroundSection(),
              CustomScrollView(
                slivers: [
                  const _HomeHeaderSection(),
                  const _HomeBodySection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeBackgroundSection extends StatelessWidget {
  const _HomeBackgroundSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_background.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _HomeHeaderSection extends StatelessWidget {
  const _HomeHeaderSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _HeaderLogoSection(),
            _HeaderButtonSection(),
          ],
        ),
      ),
    );
  }
}

class _HeaderLogoSection extends StatelessWidget {
  const _HeaderLogoSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/x_logo.png',
      width: 107,
      fit: BoxFit.cover,
    );
  }
}

class _HeaderButtonSection extends StatelessWidget {
  const _HeaderButtonSection();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => _handleLoginPressed(context),
      text: 'krish',
      width: 79,
      height: 38,
      backgroundColor: AppColors.accentColor,
      textColor: AppColors.secondaryColor,
    );
  }

  void _handleLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authScreen);
  }
}

class _HomeBodySection extends StatelessWidget {
  const _HomeBodySection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
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
            const _BodySearchSection(),
            const _BodyTextSection(
              text: 'Maxsus takliflar',
              size: 20,
              padding: EdgeInsets.only(left: 24, bottom: 24),
            ),
            const _BodyBannerSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _BodyTextSection(
                  text: 'Eng mashhurlari',
                  size: 20,
                  padding: EdgeInsets.only(left: 24, bottom: 24, top: 24),
                ),
                GestureDetector(
                  onTap: () => _handleLoginPressed(context),
                  child: const _BodyTextSection(
                    text: 'Barchasi',
                    size: 15,
                    padding: EdgeInsets.only(right: 24, bottom: 24, top: 24),
                  ),
                ),
              ],
            ),
            const _BodyCategorieSection(),
            const _BodyCategorieViewSection(),
          ],
        ),
      ),
    );
  }

  void _handleLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authScreen);
  }
}

class _BodySearchSection extends StatelessWidget {
  const _BodySearchSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Mahsulot qidirish...',
          hintStyle: TextStyle(
            color: AppColors.greyscaleColor,
            fontSize: 16,
          ),
          prefixIcon: _bodySearchIcon(),
          suffixIcon: _buildSearchActions(),
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

  Widget _bodySearchIcon() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Image.asset(
        'assets/icons/search.png',
        width: 20,
        height: 20,
      ),
    );
  }

  Widget _buildSearchActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchActionButton(
          iconPath: 'assets/icons/voice.png',
          onTap: () {},
        ),
        SearchActionButton(
          iconPath: 'assets/icons/filter.png',
          onTap: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _BodyTextSection extends StatelessWidget {
  final String text;
  final double size;
  final EdgeInsets padding;

  const _BodyTextSection({
    required this.text,
    required this.size,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.greyscaleDarkColor,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BodyBannerSection extends StatelessWidget {
  const _BodyBannerSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 181,
      child: Image.asset(
        'assets/images/home_banner.png',
        fit: BoxFit.cover,
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

  final productCategories = ProductCategorieData.productCategorie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productCategories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final productCategorie =
              productCategories[index % productCategories.length];
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: _CategorieButtonSection(
              productCategorie: productCategorie,
              onPressed: () {
                setState(() {
                  selectedIndex = selectedIndex == index ? -1 : index;
                });
              },
              textColor: isSelected
                  ? AppColors.secondaryColor
                  : AppColors.greyscaleDarkColor,
              backgroundColor: isSelected
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
            ),
          );
          // return null;
        },
      ),
    );
  }
}

class _CategorieButtonSection extends StatelessWidget {
  final ProductCategorie productCategorie;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  const _CategorieButtonSection({
    required this.onPressed,
    required this.productCategorie,
    required this.textColor,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return HomeButton(
      onPressed: onPressed,
      text: productCategorie.name,
      border: BorderSide(
        width: 2,
        color: AppColors.primaryColor,
      ),
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}

class _BodyCategorieViewSection extends StatelessWidget {
  const _BodyCategorieViewSection();

  final products = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = screenWidth > 600 ? 3 : 2;
          final itemWidth =
              (screenWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
          final aspectRatio = itemWidth / 315; // height/width ratio

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: aspectRatio,
            ),
            itemCount: products.length, // Test uchun ko'paytirdim
            itemBuilder: (context, index) {
              final product = products[index % products.length];
              return _ProductCardSection(product: product);
            },
          );
        },
      ),
    );
  }
}

class _ProductCardSection extends StatelessWidget {
  final Product product;

  const _ProductCardSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToCategorieScreen(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImageSection(product: product),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 182,
                      height: 22,
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyscaleDarkColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _ProductRatingSetion(product: product),
                    const SizedBox(height: 8),
                    _ProductPriceSection(product: product),
                    const SizedBox(height: 8),
                    Text(
                      "${product.discountedPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ')} so'm",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyscaleDarkColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToCategorieScreen(BuildContext context) {
    appScreensKey.currentState?.goToCategorieScreen();
  }
}

class _ProductImageSection extends StatelessWidget {
  final Product product;

  const _ProductImageSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: 182,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              product.imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () => _goToLikeScreen(context),
              child: Image.asset(
                'assets/images/like.png',
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToLikeScreen(BuildContext context) {
    appScreensKey.currentState?.goToLikeScreen();
  }
}

class _ProductRatingSetion extends StatelessWidget {
  final Product product;

  const _ProductRatingSetion({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/star.png',
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4),
        Text(
          product.rating.toString(),
          style: TextStyle(
            fontSize: 14,
            color: AppColors.accentColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          product.line.toString(),
          style: TextStyle(
            fontSize: 14,
            color: AppColors.accentColor,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.searchColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '${product.discountPercent}%',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.greyscaleDarkColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Image.asset(
          product.logoPath,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}

class _ProductPriceSection extends StatelessWidget {
  final Product product;

  const _ProductPriceSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFDBBDF2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.originalPrice.toStringAsFixed(0),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.greyscaleDarkColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
