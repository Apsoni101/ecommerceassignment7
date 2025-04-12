
import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';

class SearchCartProductsUseCase{
  final ProductCartRepo repo;

  SearchCartProductsUseCase(this.repo);

  Future<List<ProductCartItemEntity>> searchCartProducts(String query) {
   return repo.searchCartProducts(query);
  }


}