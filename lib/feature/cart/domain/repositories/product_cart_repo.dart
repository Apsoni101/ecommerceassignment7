import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

abstract class ProductCartRepo {
  Future<void> addProductToCart(ProductItemEntity product);
  Future<void> incrementProductQuantity(ProductItemEntity product);
  Future<void> decrementProductQuantity(ProductItemEntity product);
  Future<List<ProductCartItemEntity>> getCartItems();
  int getQuantityForProduct(ProductItemEntity product);
  Future<void> removeProductFromCart(ProductItemEntity product);
  Future<List<ProductCartItemEntity>> searchCartProducts(String query);

}

