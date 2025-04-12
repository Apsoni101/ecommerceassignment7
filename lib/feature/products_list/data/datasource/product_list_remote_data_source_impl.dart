import 'package:assignment7/core/networking%20/network_constants.dart';
import 'package:assignment7/core/networking%20/network_service.dart';
import 'package:assignment7/feature/common/data/models/product_item_model.dart';
import 'package:assignment7/feature/products_list/data/datasource/product_list_remote_datasource.dart';

class ProductListRemoteDataSourceImpl implements ProductListRemoteDataSource {
  final NetworkService networkService;

  ProductListRemoteDataSourceImpl(this.networkService);

  @override
  Future<List<ProductItemModel>> fetchProducts() async {
    try {
      final response =
          await networkService.dio.get(NetworkConstants.productsEndpoint);
      final List<dynamic> data = response.data[NetworkConstants.products];
      return data.map((json) => ProductItemModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductItemModel>> getSearchedProducts(String query) async {
    try {
      final response =
          await networkService.dio.get(NetworkConstants.productsEndpoint);
      final List<dynamic> data = response.data[NetworkConstants.products];
      final products =
          data.map((json) => ProductItemModel.fromJson(json)).toList();
      final filteredProducts = products.where((items) {
        final productTitle = items.title.toLowerCase();
        final productCategory = items.title.toLowerCase();
        final productBrand = items.title.toLowerCase();
        final productModel = items.title.toLowerCase();
        final searchQuery = query.toLowerCase();
        return productTitle.contains(searchQuery) ||
            productCategory.contains(searchQuery) ||
            productBrand.contains(searchQuery) ||
            productModel.contains(searchQuery);
      }).toList();

      return filteredProducts;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
