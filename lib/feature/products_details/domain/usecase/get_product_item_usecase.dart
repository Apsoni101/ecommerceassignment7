import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_details/domain/repositories/product_item_repo.dart';


class GetProductItemUseCase {
  final ProductItemRepo repository;

  GetProductItemUseCase(this.repository);

  Future<ProductItemEntity> call(int id) => repository.getProductById(id);
}
