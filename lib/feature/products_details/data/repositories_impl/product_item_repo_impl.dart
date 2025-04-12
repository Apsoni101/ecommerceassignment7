import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_details/data/datasource/product_item_remote_data_source.dart';
import 'package:assignment7/feature/products_details/domain/repositories/product_item_repo.dart';

class ProductItemRepoImpl implements ProductItemRepo {
  final ProductItemRemoteDataSource productItemRemoteDataSource;

  ProductItemRepoImpl(this.productItemRemoteDataSource);

  @override
  Future<ProductItemEntity> getProductById(int id) async {
    final product = await productItemRemoteDataSource.fetchProductById(id);
    return product;
  }
}
