import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/feature/cart/presentation/screens/cart_screen.dart';
import 'package:assignment7/feature/common/presentation/widgets/custom_search_bar.dart';
import 'package:assignment7/feature/products_list/presentation/bloc/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListSearchRow extends StatelessWidget {
  const ProductListSearchRow({super.key});

  void _navigateToCartScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            Expanded(child: CustomSearchBar(onChanged: (query) {
              context
                  .read<ProductListBloc>()
                  .add(SearchQueryChangedEvent(query: query));
            })),
            IconButton(
              onPressed: () => _navigateToCartScreen(context),
              icon: SvgPicture.asset(AppAssets.cart),
              style: IconButton.styleFrom(
                  backgroundColor: AppColors.black,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            )
          ],
        );
      },
    );
  }
}
