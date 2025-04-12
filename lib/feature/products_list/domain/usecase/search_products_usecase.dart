
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_list/domain/repositories/product_list_repo.dart';

class SearchProductsUseCase {
  final ProductListRepo repository;

  SearchProductsUseCase(this.repository);

  Future<List<ProductItemEntity>> call(String query) async {
    return repository.getSearchedProducts(query);
  }
}
