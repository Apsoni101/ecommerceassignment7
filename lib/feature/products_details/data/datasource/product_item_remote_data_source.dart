import 'package:assignment7/core/networking%20/network_constants.dart';
import 'package:assignment7/core/networking%20/network_service.dart';
import 'package:assignment7/feature/common/data/models/product_item_model.dart';

abstract class ProductItemRemoteDataSource {
  Future<ProductItemModel> fetchProductById(int id );
}

class ProductItemRemoteDataSourceImpl implements ProductItemRemoteDataSource {
  final NetworkService networkService;

  ProductItemRemoteDataSourceImpl(this.networkService);

  @override
  Future<ProductItemModel> fetchProductById(int id) async {
    try {
      final response = await networkService.dio.get(
        '${NetworkConstants.productsEndpoint}/$id',
      );

      final data = response.data[NetworkConstants.product];

      return ProductItemModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
