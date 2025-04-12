import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';


class GetQuantityForProduct {
  final ProductCartRepo repo;

  GetQuantityForProduct(this.repo);

  int call(ProductItemEntity product) {
    return repo.getQuantityForProduct(product);
  }
}
