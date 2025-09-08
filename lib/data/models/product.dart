class Product {
  final int id;
  final String name;
  final String imagePath;
  final double rating;
  final String line;
  final String? originalPrice;
  final double discountedPrice;
  final String discountPercent;
  final String logoPath;
  final String? bonus;
  final String? bonusName;

  const Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.line,
    this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
    required this.logoPath,
    this.bonus,
    this.bonusName,
  });
}
