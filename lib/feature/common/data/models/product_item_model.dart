import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

class ProductItemModel extends ProductItemEntity {
  ProductItemModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.description,
    required super.brand,
    required super.model,
    required super.color,
    required super.category,
    super.discount,
    super.popular,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      color: json['color'] ?? '',
      category: json['category'] ?? '',
      discount: (json['discount'] as num?)?.toDouble(),
      popular: json['popular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'brand': brand,
      'model': model,
      'color': color,
      'category': category,
      'discount': discount,
      'popular': popular,
    };
  }

  factory ProductItemModel.fromEntity(ProductItemEntity entity) {
    return ProductItemModel(
      id: entity.id,
      title: entity.title,
      image: entity.image,
      price: entity.price,
      description: entity.description,
      brand: entity.brand,
      model: entity.model,
      color: entity.color,
      category: entity.category,
      discount: entity.discount,
      popular: entity.popular,
    );
  }

  ProductItemEntity toEntity() {
    return ProductItemEntity(
      id: id,
      title: title,
      image: image,
      price: price,
      description: description,
      brand: brand,
      model: model,
      color: color,
      category: category,
      discount: discount,
      popular: popular,
    );
  }
}
