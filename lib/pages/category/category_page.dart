import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "分类"),
      backgroundColor: AppColors.mainWhite,
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _iconList(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _iconList() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) {
            return _iconItem(controller.iconList[index]);
          },
          itemCount: controller.iconList.length,
        ));
  }

  Widget _iconItem(IconAssetModel iconAssetModel) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.selectIcon(iconAssetModel);
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
                color: iconAssetModel.isSelected == true
                    ? AppColors.primaryYellow.withOpacity(0.7)
                    : AppColors.mainWhite,
                borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(
              iconAssetModel.assetPath,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          iconAssetModel.name.tr,
          style: TextStyle(color: AppColors.mainTitle333, fontSize: 13.sp),
        )
      ],
    );
  }
}
