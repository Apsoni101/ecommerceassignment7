import 'package:assignment7/core/networking%20/network_service.dart';
import 'package:assignment7/feature/cart/data/datasource/cart_items_local_datasource.dart';
import 'package:assignment7/feature/cart/data/datasource/cart_items_local_datasource_impl.dart';
import 'package:assignment7/feature/cart/data/repoimpl/product_cart_repo_impl.dart';
import 'package:assignment7/feature/cart/domain/repositories/product_cart_repo.dart';
import 'package:assignment7/feature/cart/domain/usecases/add_product_to_cart.dart';
import 'package:assignment7/feature/cart/domain/usecases/decrement_product_quantity.dart';
import 'package:assignment7/feature/cart/domain/usecases/get_cart_items.dart';
import 'package:assignment7/feature/cart/domain/usecases/get_quantity_for_product.dart';
import 'package:assignment7/feature/cart/domain/usecases/increment_product_quantity.dart';
import 'package:assignment7/feature/cart/domain/usecases/remove_product_from_cart.dart';
import 'package:assignment7/feature/cart/domain/usecases/search_cart_products.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/products_details/data/datasource/product_item_remote_data_source.dart';
import 'package:assignment7/feature/products_details/data/repositories_impl/product_item_repo_impl.dart';
import 'package:assignment7/feature/products_details/domain/repositories/product_item_repo.dart';
import 'package:assignment7/feature/products_details/domain/usecase/get_product_item_usecase.dart';
import 'package:assignment7/feature/products_details/presentation/bloc/product_detail_bloc.dart';
import 'package:assignment7/feature/products_list/data/datasource/product_list_remote_data_source_impl.dart';
import 'package:assignment7/feature/products_list/data/datasource/product_list_remote_datasource.dart';
import 'package:assignment7/feature/products_list/data/repositories_impl/product_list_repo_impl.dart';
import 'package:assignment7/feature/products_list/domain/repositories/product_list_repo.dart';
import 'package:assignment7/feature/products_list/domain/usecase/get_products_usecase.dart';
import 'package:assignment7/feature/products_list/domain/usecase/search_products_usecase.dart';
import 'package:assignment7/feature/products_list/presentation/bloc/product_list_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;


Future<void> setupLocator() async {
  sl.registerLazySingleton(() => NetworkService());

  sl.registerLazySingleton<ProductListRemoteDataSource>(
    () => ProductListRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductItemRemoteDataSource>(
    () => ProductItemRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CartItemsLocalDataSource>(
    () => CartItemsLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ProductListRepo>(
    () => ProductListRepoImpl(sl()),
  );
  sl.registerLazySingleton<ProductItemRepo>(
    () => ProductItemRepoImpl(sl()),
  );
  sl.registerLazySingleton<ProductCartRepo>(
    () => ProductCartRepoImpl(sl()),
  );

  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetProductItemUseCase(sl()));
  sl.registerLazySingleton(() => SearchProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductToCart(sl()));
  sl.registerLazySingleton(() => GetCartItems(sl()));
  sl.registerLazySingleton(() => GetQuantityForProduct(sl()));
  sl.registerLazySingleton(() => IncrementProductQuantity(sl()));
  sl.registerLazySingleton(() => DecrementProductQuantity(sl()));
  sl.registerLazySingleton(() => RemoveProductFromCart(sl()));
  sl.registerLazySingleton(() => SearchCartProductsUseCase(sl()));

  sl.registerFactory<ProductListBloc>(
    () => ProductListBloc(
      getProductsUseCase: sl(),
      searchProductsUseCase: sl(),
    ),
  );

  sl.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(getProductItemUseCase: sl()),
  );

  sl.registerFactory<ProductCartBloc>(
    () => ProductCartBloc(
      searchCartProductsUseCase: sl(),
      addProductToCart: sl(),
      removeProductFromCart: sl(),
      incrementProductQuantity: sl(),
      decrementProductQuantity: sl(),
      getCartItems: sl(),
      getQuantityForProduct: sl(),
    ),
  );
}
