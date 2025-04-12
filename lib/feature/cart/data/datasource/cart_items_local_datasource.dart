
import 'package:assignment7/feature/cart/data/models/product_cart_item_model.dart';
import 'package:assignment7/feature/common/data/models/product_item_model.dart';

abstract class CartItemsLocalDataSource{
  Future<List<ProductCartItemModel>> getCartProducts();
  int getQuantityForProduct(ProductItemModel product);
  Future<void> addProductToCart(ProductItemModel product);
  Future<void> incrementProductQuantity(ProductItemModel product);
  Future<void> decrementProductQuantity(ProductItemModel product);
  Future<void> removeProductFromCart(ProductItemModel product);
  Future<List<ProductCartItemModel>> searchCartProducts(String query);
}