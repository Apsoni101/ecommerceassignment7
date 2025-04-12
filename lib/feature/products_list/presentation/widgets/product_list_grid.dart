import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/feature/products_details/presentation/screens/product_detail_screen.dart';
import 'package:assignment7/feature/products_list/presentation/bloc/product_list_bloc.dart';
import 'package:assignment7/feature/common/presentation/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductListGrid extends StatelessWidget {
  const ProductListGrid({super.key});

  void _navigateToDetail(BuildContext context, int productId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(id: productId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading) {//switch case
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductListLoaded) {
            return MasonryGridView.count(
              padding: const EdgeInsets.symmetric(vertical: 30),
              crossAxisCount: 2,
              mainAxisSpacing: 17,
              crossAxisSpacing: 24,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductListItem(
                  product: state.products[index],
                  onTap: () => _navigateToDetail(context, index + 1),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text(AppsStrings.noData));
        },
      ),
    );
  }
}
