class ProductModel {
  const ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.category,

    this.rating = 0.0,
    this.description = '',
  });

  final String name;
  final int price;
  final String image;
  final ProductCategory category;

  final double rating;
  final String description;
}

enum ProductCategory { lipstick, mascara, serum, sunscreen, toner, moisturizer }

extension ProductCategoryExtension on ProductCategory {
  String get displayName {
    switch (this) {
      case ProductCategory.lipstick:
        return "Lipstik";
      case ProductCategory.mascara:
        return "Mascara";
      case ProductCategory.serum:
        return "Serum";
      case ProductCategory.sunscreen:
        return "Sunscreen";
      case ProductCategory.toner:
        return "Toner";
      case ProductCategory.moisturizer:
        return "Moisturizer";
    }
  }
}
