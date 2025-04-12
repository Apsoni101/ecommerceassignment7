part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsListEvent extends ProductListEvent {}

class FetchProductDetailEvent extends ProductListEvent {
  final int productId;

  FetchProductDetailEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class ProductItemClickedEvent extends ProductListEvent {
  final ProductItemEntity product;

  ProductItemClickedEvent(this.product);

  @override
  List<Object> get props => [product];
}

class SearchQueryChangedEvent extends ProductListEvent {
  final String query;

  SearchQueryChangedEvent({required this.query});
}

class CartButtonClickedEvent extends ProductListEvent {}