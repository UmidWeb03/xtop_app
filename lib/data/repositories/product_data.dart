import 'package:flutter/material.dart';
import 'package:xtop_app/data/models/product.dart';
import 'package:xtop_app/presentation/pages/products/products.dart';

class ProductData {
  static List<Product> products(BuildContext context) {
    return [
      Product(
        id: 1,
        name: 'Canon fotoapparati',
        imagePath: 'assets/images/photo.png',
        rating: 4.5,
        line: '|',
        originalPrice: '2600000',
        discountedPrice: 1300000,
        discountPercent: '50%',
        logoPath: 'assets/images/logo.png',
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProductsScreen()),
        ),
      ),
      const Product(
        id: 2,
        name: 'Varmillo klaviaturasi',
        bonusName: '+Sichqoncha | Kovrik',
        imagePath: 'assets/images/keybort.png',
        bonus: 'Bonus🔥',
        rating: 4.8,
        line: '|',
        originalPrice: '400000',
        discountedPrice: 2000000,
        discountPercent: '1 + 1',
        logoPath: 'assets/images/logo.png',
      ),
      const Product(
        id: 3,
        name: "Rolex qo’l soati",
        imagePath: 'assets/images/watch.png',
        rating: 4.8,
        line: '|',
        originalPrice: '140000',
        discountedPrice: 70000,
        discountPercent: '50%',
        logoPath: 'assets/images/logo.png',
      ),
      const Product(
        id: 4,
        name: "Rolex qo’l soati",
        imagePath: 'assets/images/rolex.png',
        rating: 4.8,
        line: '|',
        originalPrice: '300000',
        discountedPrice: 150000,
        discountPercent: '50%',
        logoPath: 'assets/images/logo.png',
      ),
      const Product(
        id: 5,
        name: 'NIKE Air krossovkalari',
        imagePath: 'assets/images/nike.png',
        rating: 4.8,
        line: '|',
        originalPrice: '000',
        discountedPrice: 000,
        discountPercent: '0%',
        logoPath: 'assets/images/logo.png',
      ),
      const Product(
        id: 6,
        name: 'Nike futbolkalari',
        imagePath: 'assets/images/clothes.png',
        rating: 4.8,
        line: '|',
        originalPrice: '000',
        discountedPrice: 000,
        discountPercent: '0%',
        logoPath: 'assets/images/logo.png',
      ),
    ];
  }
}
