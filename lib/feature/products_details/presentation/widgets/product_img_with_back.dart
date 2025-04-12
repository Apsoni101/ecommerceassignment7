import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImgWithBack extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBackPress;

  const ProductImgWithBack(
      {super.key, required this.onBackPress, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 0.8341,
              child: Image.network(
                fit: BoxFit.cover,
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.broken_image,
                          color: AppColors.mediumGrey),
                      Text(AppsStrings.noImg)
                    ],
                  );
                },
              ),
            )),
        Positioned(
          left: 16,
          top: 16,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: AppColors.white,
                  padding: EdgeInsets.all(8)),
              onPressed: onBackPress,
              child: SvgPicture.asset(AppAssets.back),),
        )
      ],
    );
  }
}
