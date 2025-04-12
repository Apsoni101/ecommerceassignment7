import 'package:assignment7/feature/cart/data/datasource/cart_items_local_datasource.dart';
import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';
import 'package:assignment7/feature/common/data/models/product_item_model.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

class ProductCartRepoImpl implements ProductCartRepo {
  final CartItemsLocalDataSource cartItemsLocalDataSource;

  ProductCartRepoImpl(this.cartItemsLocalDataSource);

  @override
  Future<void> addProductToCart(ProductItemEntity product) async {
    final model = ProductItemModel.fromEntity(product);
    await cartItemsLocalDataSource.addProductToCart(model);
  }

  @override
  Future<void> incrementProductQuantity(ProductItemEntity product) async {
    final model = ProductItemModel.fromEntity(product);
    await cartItemsLocalDataSource.incrementProductQuantity(model);
  }

  @override
  Future<void> decrementProductQuantity(ProductItemEntity product) async {
    final model = ProductItemModel.fromEntity(product);
    await cartItemsLocalDataSource.decrementProductQuantity(model);
  }

  @override
  Future<List<ProductCartItemEntity>> getCartItems() async {
    final models = await cartItemsLocalDataSource.getCartProducts();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  int getQuantityForProduct(ProductItemEntity product) {
    final model = ProductItemModel.fromEntity(product);
    return cartItemsLocalDataSource.getQuantityForProduct(model);
  }

  @override
  Future<void> removeProductFromCart(ProductItemEntity product) async {
    final productModel = ProductItemModel.fromEntity(product);
    await cartItemsLocalDataSource.removeProductFromCart(productModel);
  }
  @override
  Future<List<ProductCartItemEntity>> searchCartProducts(String query) async {
    final models = await cartItemsLocalDataSource.searchCartProducts(query);
    return models.map((m) => m.toEntity()).toList();
  }


}
