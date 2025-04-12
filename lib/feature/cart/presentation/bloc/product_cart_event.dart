part of 'product_cart_bloc.dart';

@immutable
sealed class ProductCartEvent {}

class AddProductToCartEvent extends ProductCartEvent {
  final ProductItemEntity product;
  AddProductToCartEvent(this.product);
}

class RemoveProductFromCartEvent extends ProductCartEvent {
  final ProductItemEntity product;
  RemoveProductFromCartEvent(this.product);
}

class IncrementQuantityEvent extends ProductCartEvent {
  final ProductItemEntity product;
  IncrementQuantityEvent(this.product);
}

class DecrementQuantityEvent extends ProductCartEvent {
  final ProductItemEntity product;
  DecrementQuantityEvent(this.product);
}
class GetQuantityForProductEvent extends ProductCartEvent {
  final ProductItemEntity product;
  GetQuantityForProductEvent(this.product);
}

class OnCartSearchQueryEvent extends ProductCartEvent{
  final String query;
  OnCartSearchQueryEvent(this.query);
}


class LoadCartItemsEvent extends ProductCartEvent {}

