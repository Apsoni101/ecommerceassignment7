import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:assignment7/core/di/setup_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment7/feature/products_details/presentation/bloc/product_detail_bloc.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/product_detail_body.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/add_to_cart_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final int id;

  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) =>
          sl<ProductDetailBloc>()..add(LoadProductDetailEvent(id)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailError) {
                return Center(
                    child: Text(state.message, style: AppTextStyles.rating));
              } else if (state is ProductDetailLoaded) {
                final product = state.product;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: ProductDetailBody(product: product)),
                    AddToCartButton(
                      onPressed: () {
                        context.read<ProductCartBloc>().add(
                              AddProductToCartEvent(product),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppsStrings.addedToCart)));
                      },
                      price: product.price,
                    ),
                  ],
                );
              }
              return Center(
                  child: Text(
                AppsStrings.noData,
                style: AppTextStyles.rating,
              ));
            },
          ),
        ),
      ),
    );
  }
}
