import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/feature/products_details/presentation/widgets/product_details_row.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String brand;

  final String model;

  final String color;

  final String category;

  const ProductDetails(
      {super.key,
      required this.brand,
      required this.model,
      required this.color,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductDetailsRow(label: AppsStrings.brand, value: brand),
        ProductDetailsRow(label: AppsStrings.model, value: model),
        ProductDetailsRow(label: AppsStrings.color, value: color),
        ProductDetailsRow(label: AppsStrings.category, value: category),
      ],
    );
  }
}
