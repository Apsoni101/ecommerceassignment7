

import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

abstract class ProductListRepo {
  Future<List<ProductItemEntity>> getProducts();
  Future<List<ProductItemEntity>> getSearchedProducts(String query);
}