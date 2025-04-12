

import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

abstract class ProductItemRepo {
  Future<ProductItemEntity> getProductById(int id);
}