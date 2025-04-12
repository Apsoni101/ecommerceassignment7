import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/common/presentation/widgets/increment_decrement_quantity.dart';
import 'package:assignment7/feature/common/presentation/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCartListItem extends StatelessWidget {
  final ProductItemEntity product;
  final VoidCallback onTap;

  const ProductCartListItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductListItem(product: product, onTap: onTap),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IncrementDecrementQuantity(product: product),
            IconButton(onPressed: () {
              context.read<ProductCartBloc>().add(RemoveProductFromCartEvent(product));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppsStrings.removeFromCart)));
            }, icon: Icon(Icons.delete))
          ],
        )
        
      ],
    );
  }
}
