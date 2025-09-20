import 'package:flutter/material.dart';
import 'package:xtop_app/core/constants/app_colors.dart';
import 'package:xtop_app/data/repositories/product_name_data.dart';
import 'package:xtop_app/presentation/atoms/buttons/primary_button.dart';

class ProductNameList extends StatelessWidget {
  const ProductNameList();

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
