import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rating extends StatelessWidget {

  final String rating;
  const Rating({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 8,
      children: [SvgPicture.asset(AppAssets.star), Text(rating,style: AppTextStyles.rating,)],
    );
  }
}
