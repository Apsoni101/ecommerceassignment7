import 'package:assignment7/feature/cart/domain/entities/product_cart_item_entity.dart';
import 'package:assignment7/feature/cart/presentation/widgets/product_cart_list_item.dart';
import 'package:assignment7/feature/products_details/presentation/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductCartGrid extends StatelessWidget {
  final List<ProductCartItemEntity> cartItems;
  const ProductCartGrid({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(vertical: 30),
      crossAxisCount: 2,
      mainAxisSpacing: 17,
      crossAxisSpacing: 24,
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return ProductCartListItem(
          product: cartItems[index].product,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(id: cartItems[index].product.id),
              ),
            );
          },
        );
      },
    );
  }
}
