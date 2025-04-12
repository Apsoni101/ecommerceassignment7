import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/cart/presentation/bloc/product_cart_bloc.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementQuantity extends StatelessWidget {
  final ProductItemEntity product;

  const IncrementDecrementQuantity({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCartBloc, ProductCartState>(
      builder: (context, state) {
        final quantity = context.watch<ProductCartBloc>().getQuantityForProduct(product);

        if (quantity == 0) return const SizedBox.shrink();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuantityButton(
              onPress: () {
                context.read<ProductCartBloc>().add(DecrementQuantityEvent(product));
              },
              icon: Icons.remove,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                quantity.toString(),
                style: AppTextStyles.quantity,
              ),
            ),
            QuantityButton(
              onPress: () {
                context.read<ProductCartBloc>().add(IncrementQuantityEvent(product));
              },
              icon: Icons.add,
            ),
          ],
        );
      },
    );
  }
}
