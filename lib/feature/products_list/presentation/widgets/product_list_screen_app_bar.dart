import 'package:flutter/material.dart';
import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';

class ProductListScreenAppBar extends StatelessWidget {
  const ProductListScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(AppsStrings.hello, style: AppTextStyles.hello),
            subtitle: Text(AppsStrings.albert, style: AppTextStyles.albert),
            trailing: CircleAvatar(
              radius: 16,
              child: Image.asset(AppAssets.profile),
            ),
          );
  }
}

