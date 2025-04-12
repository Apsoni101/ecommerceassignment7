import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_list/domain/repositories/product_list_repo.dart';


class GetProductsUseCase {
  final ProductListRepo repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductItemEntity>> call() => repository.getProducts();
}
