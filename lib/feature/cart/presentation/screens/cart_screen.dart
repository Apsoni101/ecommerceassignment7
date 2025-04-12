import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/common/presentation/widgets/custom_search_bar.dart';
import 'package:assignment7/feature/cart/presentation/widgets/empty_cart.dart';
import 'package:assignment7/feature/cart/presentation/widgets/product_cart_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppsStrings.cart,
                style: AppTextStyles.cartTxt,
              ),
              CustomSearchBar(
                onChanged: (query) {
                  context
                      .read<ProductCartBloc>()
                      .add(OnCartSearchQueryEvent(query));
                },
              ),
              Expanded(
                child: BlocBuilder<ProductCartBloc, ProductCartState>(
                  builder: (context, state) {
                    if (state is ProductCartLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductCartUpdated) {
                      if (state.items.isEmpty) {
                        return EmptyCart();
                      }
                      return ProductCartGrid(cartItems: state.items);
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    }

                    return const Center(child: SizedBox());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
