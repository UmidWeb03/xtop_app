import 'package:xtop_app/core/constants/app_strings.dart';
import 'package:xtop_app/data/models/product_name.dart';

class ProductNameData {
  static final List<String> names = Categories.categories_name;
  static final List<ProductName> productName = [
    ProductName(
      id: 1,
      name: names[0],
    ),
    ProductName(
      id: 2,
      name: names[1],
    ),
    ProductName(
      id: 3,
      name: names[2],
    ),
    ProductName(
      id: 4,
      name: names[3],
    ),
    ProductName(
      id: 5,
      name: names[4],
    ),
    ProductName(
      id: 6,
      name: names[5],
    ),
    ProductName(
      id: 7,
      name: names[6],
    ),
    ProductName(
      id: 8,
      name: names[7],
    ),
    ProductName(
      id: 9,
      name: names[8],
    ),
    ProductName(
      id: 10,
      name: names[9],
    ),
  ];
}
