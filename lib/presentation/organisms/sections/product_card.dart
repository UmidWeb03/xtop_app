import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/core/routes/app_routes.dart';
import 'package:xtop_app/data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(AppRoutes.category),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImageSection(product: product),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyscaleDarkColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                product.bonusName == null
                    ? const SizedBox.shrink()
                    : Text(
                        product.bonusName.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyscaleDarkColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                const SizedBox(height: 8),
                _ProductRatingSetion(product: product),
                const SizedBox(height: 8),
                _ProductPriceSection(product: product),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.discountedPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ')} so'm",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyscaleDarkColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/icons/bag.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImageSection extends StatelessWidget {
  final Product product;

  const _ProductImageSection({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: double.infinity,
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
              onTap: () => context.go(AppRoutes.cart),
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
            '${product.discountPercent}',
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
            product.bonus == null
                ? product.originalPrice.toString()
                : 'Bonus🔥',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyscaleDarkColor,
              decoration: product.bonus == null
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
