part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final List<ProductItemEntity> products;

  ProductListLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductDetailLoading extends ProductListState {}

final class ProductDetailLoaded extends ProductListState {
  final ProductItemEntity product;

  ProductDetailLoaded(this.product);

  @override
  List<Object> get props => [product];
}

final class ProductDetailError extends ProductListState {
  final String message;

  ProductDetailError(this.message);

  @override
  List<Object> get props => [message];
}

final class NavigateToProductDetails extends ProductListState {
  final ProductItemEntity product;

  NavigateToProductDetails({required this.product});

  @override
  List<Object> get props => [product];
}

final class NavigateToSearch extends ProductListState {}

final class NavigateToCart extends ProductListState {}

class ProductError extends ProductListState {
  final String message;

  ProductError(this.message);

  @override
  List<Object> get props => [message];
}