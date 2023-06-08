import 'package:better_accounting/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double inset;
  final double height;
  final Color color;
  const CustomDivider(
      {super.key,
      this.inset = 0,
      this.height = 1,
      this.color = AppColors.dividerEEE});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      indent: inset,
      endIndent: inset,
    );
  }
}
