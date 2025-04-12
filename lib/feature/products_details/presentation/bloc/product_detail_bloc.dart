import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_details/domain/usecase/get_product_item_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductItemUseCase getProductItemUseCase;

  ProductDetailBloc({required this.getProductItemUseCase})
      : super(ProductDetailInitial()) {
    on<LoadProductDetailEvent>(_onLoadProductDetail);
  }

  Future<void> _onLoadProductDetail(
      LoadProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      final product = await getProductItemUseCase(event.productId);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}
