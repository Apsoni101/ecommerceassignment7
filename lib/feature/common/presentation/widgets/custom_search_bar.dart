import 'package:assignment7/core/constants/app_assets.dart';
import 'package:assignment7/core/constants/app_colors.dart';
import 'package:assignment7/core/constants/app_strings.dart';
import 'package:assignment7/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        prefixIcon: Image.asset(AppAssets.search),
        prefixIconColor: AppColors.searchHint,
        hintText: AppsStrings.searchTxt,
        hintStyle: AppTextStyles.searchHint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.outline,
          ),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
