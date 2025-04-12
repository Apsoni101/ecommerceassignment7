part of 'product_cart_bloc.dart';

@immutable
sealed  class ProductCartState {
  final List<ProductCartItemEntity> items;
  const ProductCartState(this.items);
}

class ProductCartInitial extends ProductCartState {
  const ProductCartInitial() : super(const []);
}

class ProductCartLoading extends ProductCartState {
  const ProductCartLoading(super.items);
}

class ProductCartUpdated extends ProductCartState {
  const ProductCartUpdated(super.items);
}
class ProductQuantityLoadedState extends ProductCartState {
  final int quantity;
  const ProductQuantityLoadedState(this.quantity, List<ProductCartItemEntity> items) : super(items);
}

class ProductError extends ProductCartState {
  final String message;
  const ProductError(this.message) : super(const []);
}
