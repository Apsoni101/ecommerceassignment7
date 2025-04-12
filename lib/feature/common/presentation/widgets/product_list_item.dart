import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:flutter/material.dart';

import '../../../products_details/presentation/widgets/rating.dart';

class ProductListItem extends StatelessWidget {
  final ProductItemEntity product;
  final VoidCallback onTap;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: product.id.isEven ? 0.6175 : 0.7142,
              child: Image.network(
                product.image,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image,
                      color: AppColors.mediumGrey);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.title,
            style: AppTextStyles.gridItemTitle,
            maxLines: 1,
          ),
          Text(
            product.category,
            style: AppTextStyles.gridItemCategory,
            maxLines: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            spacing: 24,
            children: [
              Text(
                "\$${product.price.toString()}",
                style: AppTextStyles.gridItemTitle,
                maxLines: 1,
              ),
              Rating(
                rating: AppsStrings.rating,
              )
            ],
          )
        ],
      ),
    );
  }
}
