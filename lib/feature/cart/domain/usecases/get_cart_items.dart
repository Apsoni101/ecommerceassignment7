import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';


class GetCartItems {
  final ProductCartRepo repo;

  GetCartItems(this.repo);

  Future<List<ProductCartItemEntity>> call() {
    return repo.getCartItems();
  }
}
