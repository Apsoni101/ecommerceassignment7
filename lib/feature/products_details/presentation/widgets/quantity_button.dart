import 'package:assignment7/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;

  const QuantityButton({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(width: 1, color: AppColors.outline)),
      child: InkWell(
          onTap: onPress,
          child: Icon(
            icon,
            size: 16,
          )),
    );
  }
}
