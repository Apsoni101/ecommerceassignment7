import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_list/domain/usecase/get_products_usecase.dart';
import 'package:assignment7/feature/products_list/domain/usecase/search_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductsUseCase getProductsUseCase;
  final SearchProductsUseCase searchProductsUseCase;

  List<ProductItemEntity> _products = [];
  List<ProductItemEntity> _filteredProducts = [];

  ProductListBloc({
    required this.getProductsUseCase,
    required this.searchProductsUseCase,
  }) : super(ProductListInitial()) {
    on<FetchProductsListEvent>(_fetchProductsListEvent);
    on<SearchQueryChangedEvent>(_onSearchQueryChangedEvent);
  }

  Future<void> _fetchProductsListEvent(
      FetchProductsListEvent event, Emitter<ProductListState> emit) async {
    try {
      emit(ProductListLoading());
      _products = await getProductsUseCase();
      _filteredProducts = _products;
      emit(ProductListLoaded(products: _filteredProducts));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


  Future<void> _onSearchQueryChangedEvent(
      SearchQueryChangedEvent event, Emitter<ProductListState> emit) async {
    emit(ProductListLoading());
    try {
      final filteredProducts = await searchProductsUseCase(event.query);
      emit(ProductListLoaded(products: filteredProducts));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


}
