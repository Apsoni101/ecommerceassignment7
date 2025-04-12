import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_list/data/datasource/product_list_remote_datasource.dart';
import 'package:assignment7/feature/products_list/domain/repositories/product_list_repo.dart';

class ProductListRepoImpl implements ProductListRepo {
  final ProductListRemoteDataSource productListRemoteDataSource;

  ProductListRepoImpl(this.productListRemoteDataSource);

  @override
  Future<List<ProductItemEntity>> getProducts() async {
    final products = await productListRemoteDataSource.fetchProducts();
    return products;
  }

  @override
  Future<List<ProductItemEntity>> getSearchedProducts(String query) async {
    final products = await productListRemoteDataSource.getSearchedProducts(query);
    return products;
  }
}
