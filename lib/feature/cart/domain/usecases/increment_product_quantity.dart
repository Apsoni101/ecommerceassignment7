import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';


class IncrementProductQuantity {
  final ProductCartRepo repo;

  IncrementProductQuantity(this.repo);

  Future<void> call(ProductItemEntity product) {
    return repo.incrementProductQuantity(product);
  }
}
