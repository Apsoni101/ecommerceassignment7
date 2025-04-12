import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';


class DecrementProductQuantity {
  final ProductCartRepo repo;

  DecrementProductQuantity(this.repo);

  Future<void> call(ProductItemEntity product) {
    return repo.decrementProductQuantity(product);
  }
}
