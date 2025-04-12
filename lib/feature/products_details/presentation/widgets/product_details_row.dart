import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsRow extends StatelessWidget {
  final String label;
  final String value;

  const ProductDetailsRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(label, style: AppTextStyles.leading),
        Expanded(child: Text(value, style: AppTextStyles.correspondingLeading,maxLines: 1,softWrap: true,)),
      ],
    );
  }
}
