
import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double price;

   const AddToCartButton({super.key,required this.onPressed,required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 24),//padding responsible for placing en widget (Ap)
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.addCartBg,
              padding: const EdgeInsets.symmetric(vertical: 20)// content padding (Ap)
          ),
          label: Text("${AppsStrings.addToCart} \$$price",style: AppTextStyles.addToCart,),
          onPressed: onPressed,
          icon: SvgPicture.asset(AppAssets.cart)),
    );
  }
}
