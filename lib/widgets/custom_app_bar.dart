import 'package:better_accounting/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    this.leftAction,
    this.text = '',
    this.textStyle,
    this.center = true,
    this.elevate = 0,
    this.shadow = Colors.transparent,
    this.bgColor = Colors.transparent,
    this.transparent = false,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFffffff), Color(0xFFffffff)],
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
    ),
    this.rightActions = const [],
  }) : super(
          leading: leftAction,
          title: Text(text,
              style: textStyle ??
                  TextStyle(
                      color: AppColors.mainTitle333,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600)),
          centerTitle: center,
          shadowColor: shadow,
          backgroundColor: bgColor,
          flexibleSpace: transparent
              ? Container()
              : Container(decoration: BoxDecoration(gradient: gradient)),
          foregroundColor: Colors.black,
          elevation: elevate,
          actions: rightActions,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        );

  final Widget? leftAction;

  final String text;

  final TextStyle? textStyle;

  final bool center;

  final Color shadow;

  final Color bgColor;

  final double elevate;

  final bool transparent;

  final LinearGradient gradient;

  final List<Widget> rightActions;
}
