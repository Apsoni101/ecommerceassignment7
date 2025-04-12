import 'package:assignment7/feature/cart/data/models/product_cart_item_model.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/common/data/models/product_item_model.dart';
import 'cart_items_local_datasource.dart';

class CartItemsLocalDataSourceImpl implements CartItemsLocalDataSource {
  final List<ProductCartItemModel> _cartProducts = [];

  @override
  Future<List<ProductCartItemModel>> getCartProducts() async {
    return _cartProducts;
  }

  @override
  int getQuantityForProduct(ProductItemEntity product) {
    final item = _cartProducts.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ProductCartItemModel(product: product, quantity: 0),
    );
    return item.quantity;
  }

  @override
  Future<void> addProductToCart(ProductItemModel product) async {
    final index =
        _cartProducts.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartProducts[index] = _cartProducts[index].copyWith(
        quantity: _cartProducts[index].quantity + 1,
      );
    } else {
      _cartProducts.add(ProductCartItemModel(product: product, quantity: 1));
    }
  }

  @override
  Future<void> incrementProductQuantity(ProductItemModel product) async {
    final index =
        _cartProducts.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartProducts[index] = _cartProducts[index].copyWith(
        quantity: _cartProducts[index].quantity + 1,
      );
    }
  }

  @override
  Future<void> decrementProductQuantity(ProductItemModel product) async {
    final index =
        _cartProducts.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (_cartProducts[index].quantity > 1) {
        _cartProducts[index] = _cartProducts[index].copyWith(
          quantity: _cartProducts[index].quantity - 1,
        );
      } else {
        _cartProducts.removeAt(index);
      }
    }
  }

  @override
  Future<void> removeProductFromCart(ProductItemModel product) async {
    _cartProducts.removeWhere((item) => item.product.id == product.id);
  }

  @override
  Future<List<ProductCartItemModel>> searchCartProducts(String query) async {
    return _cartProducts.where((item) {
      final productTitle = item.product.title.toLowerCase();
      final productCategory = item.product.category.toLowerCase();
      final productBrand = item.product.brand.toLowerCase();
      final productModel = item.product.model.toLowerCase();
      final searchQuery = query.toLowerCase();
      return productTitle.contains(searchQuery) ||
          productCategory.contains(searchQuery) ||
          productBrand.contains(searchQuery) ||
          productModel.contains(searchQuery);
    }).toList();
  }
}
