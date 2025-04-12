import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

class ProductCartItemModel extends ProductCartItemEntity {
  const ProductCartItemModel({
    required super.product,
    required super.quantity,
  });

  @override
  List<Object?> get props => [product.id, quantity];

  ProductCartItemModel copyWith({
    ProductItemEntity? product,
    int? quantity,
  }) {
    return ProductCartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  ProductCartItemEntity toEntity() {
    return ProductCartItemEntity(
      product: product,
      quantity: quantity,
    );
  }

  factory ProductCartItemModel.fromEntity(ProductCartItemEntity entity) {
    return ProductCartItemModel(
      product: entity.product,
      quantity: entity.quantity,
    );
  }
}
