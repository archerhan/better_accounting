import 'package:better_accounting/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine(
      {this.width = 1.0,
      this.height = 20.0,
      this.color = AppColors.greyCCC,
      this.gap = 5.0,
      super.key});
  final double? width;
  final double? height;
  final Color? color;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: gap ?? 0),
    );
  }
}
