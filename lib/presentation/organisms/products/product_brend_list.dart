import 'package:flutter/material.dart';
import 'package:xtop_app/presentation/organisms/sections/product_brend.dart';

class ProductBrandList extends StatelessWidget {
  const ProductBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // padding: const EdgeInsets.only(left: 16, right: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ProductBrandSection();
        },
      ),
    );
  }
}
