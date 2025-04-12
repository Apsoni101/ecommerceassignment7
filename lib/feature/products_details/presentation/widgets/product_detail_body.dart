import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:assignment7/feature/common/domain/entities/product_item_entity.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/product_details.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/product_img_with_back.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/increment_decrement_quantity.dart';

class ProductDetailBody extends StatelessWidget {
  final ProductItemEntity product;

  const ProductDetailBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImgWithBack(
            onBackPress: () => Navigator.pop(context),
            imageUrl: product.image,
          ),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              product.title,
              style: AppTextStyles.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Rating(rating: AppsStrings.rating),
            trailing: IncrementDecrementQuantity(product: product),
          ),
          const SizedBox(height: 16),
          FractionallySizedBox(
              widthFactor: 0.8,
              child:
                  Text(product.description, style: AppTextStyles.description,)),
          const SizedBox(height: 20),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 16),
          ProductDetails(
            brand: product.brand,
            model: product.title,
            color: product.color,
            category: product.category,
          ),
        ],
      ),
    );
  }
}
