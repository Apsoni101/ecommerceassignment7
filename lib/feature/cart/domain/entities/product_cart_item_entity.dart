import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:equatable/equatable.dart';

class ProductCartItemEntity extends Equatable {
  final ProductItemEntity product;
  final int quantity;

  const ProductCartItemEntity({required this.product, required this.quantity});

  @override
  List<Object?> get props => [product.id, quantity];

}
