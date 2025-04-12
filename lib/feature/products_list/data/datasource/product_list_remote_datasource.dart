
import 'package:assignment7/feature/common/data/models/product_item_model.dart';

abstract class ProductListRemoteDataSource {
  Future<List<ProductItemModel>> fetchProducts();
  Future<List<ProductItemModel>> getSearchedProducts(String query);
}