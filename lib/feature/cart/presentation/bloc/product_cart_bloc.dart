import 'package:assignment7/feature/cart/domain/usecases/get_quantity_for_product.dart';
import 'package:assignment7/feature/cart/domain/usecases/search_cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment7/feature/cart/domain/usecases/add_product_to_cart.dart';
import 'package:assignment7/feature/cart/domain/usecases/decrement_product_quantity.dart';
import 'package:assignment7/feature/cart/domain/usecases/get_cart_items.dart';
import 'package:assignment7/feature/cart/domain/usecases/increment_product_quantity.dart';
import 'package:assignment7/feature/cart/domain/usecases/remove_product_from_cart.dart';
import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';

part 'product_cart_event.dart';

part 'product_cart_state.dart';

class ProductCartBloc extends Bloc<ProductCartEvent, ProductCartState> {
  final AddProductToCart addProductToCart;
  final RemoveProductFromCart removeProductFromCart;
  final IncrementProductQuantity incrementProductQuantity;
  final DecrementProductQuantity decrementProductQuantity;
  final GetCartItems getCartItems;
  final GetQuantityForProduct getQuantityForProduct;
  final SearchCartProductsUseCase searchCartProductsUseCase;

  ProductCartBloc( {
    required this.addProductToCart,
    required this.removeProductFromCart,
    required this.incrementProductQuantity,
    required this.decrementProductQuantity,
    required this.getCartItems,
    required this.getQuantityForProduct,
    required this.searchCartProductsUseCase,
  }) : super(const ProductCartInitial()) {
    on<LoadCartItemsEvent>(_onLoadCartItems);
    on<AddProductToCartEvent>(_onAddToCart);
    on<RemoveProductFromCartEvent>(_onRemoveFromCart);
    on<IncrementQuantityEvent>(_onIncrement);
    on<DecrementQuantityEvent>(_onDecrement);
    on<GetQuantityForProductEvent>(_onGetQuantity);
    on<OnCartSearchQueryEvent>(_onCartSearchQueryEvent);
  }

  Future<void> _onLoadCartItems(
      LoadCartItemsEvent event,
      Emitter<ProductCartState> emit,
      ) async {
    emit(ProductCartLoading(state.items));
    final items = await getCartItems();
    if (items.isEmpty) {
      emit(ProductCartUpdated([]));
    } else {
      emit(ProductCartUpdated(items));
    }
  }


  Future<void> _onAddToCart(
    AddProductToCartEvent event,
    Emitter<ProductCartState> emit,
  ) async {
    await addProductToCart(event.product);
    add(LoadCartItemsEvent());
  }

  Future<void> _onRemoveFromCart(
    RemoveProductFromCartEvent event,
    Emitter<ProductCartState> emit,
  ) async {
    await removeProductFromCart(event.product);
    add(LoadCartItemsEvent());
  }

  Future<void> _onIncrement(
    IncrementQuantityEvent event,
    Emitter<ProductCartState> emit,
  ) async {
    await incrementProductQuantity(event.product);
    add(LoadCartItemsEvent());
  }

  Future<void> _onDecrement(
    DecrementQuantityEvent event,
    Emitter<ProductCartState> emit,
  ) async {
    await decrementProductQuantity(event.product);
    add(LoadCartItemsEvent());
  }

  Future<void> _onGetQuantity(
    GetQuantityForProductEvent event,
    Emitter<ProductCartState> emit,
  ) async {
    final quantity = getQuantityForProduct(event.product);
    emit(ProductQuantityLoadedState(quantity, state.items));
  }

  Future<void> _onCartSearchQueryEvent(
      OnCartSearchQueryEvent event,Emitter<ProductCartState> emit
      ) async{
    emit(ProductCartLoading(state.items));
    final items = await searchCartProductsUseCase.searchCartProducts(event.query);
    if (items.isEmpty) {
      emit(ProductCartUpdated([]));
    } else {
      emit(ProductCartUpdated(items));
    }
  }
}
