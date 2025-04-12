class ProductItemEntity {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final String brand;
  final String model;
  final String color;
  final String category;
  final double? discount;
  final bool? popular;

  ProductItemEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    this.discount=0.0,
    this.popular=false,
  });
}
