import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CategoryEditPage extends GetView<CategoryController> {
  const CategoryEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "category_setting".tr,
      ),
      backgroundColor: AppColors.mainWhite,
      body: Column(
        children: [Expanded(child: _pageView())],
      ),
    );
  }

  Widget _categoryBar() {
    return SizedBox(
      width: 200.w,
      child: TabBar(
        tabs: [
          Tab(
            text: "accounts_expenses".tr,
          ),
          Tab(
            text: "accounts_income".tr,
          )
        ],
        labelColor: AppColors.mainTitle333,
        labelStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        unselectedLabelColor: AppColors.grey999,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2.h,
        indicatorColor: AppColors.primaryBlue,
        controller: controller.tabController,
        onTap: (index) {
          controller.pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
      ),
    );
  }

  Widget _pageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.tabController.animateTo(value);
      },
      children: [_expensesListView(), _incomeListView()],
    );
  }

  Widget _expensesListView() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) {
            return _iconItem(controller.expensesList[index]);
          },
          itemCount: controller.expensesList.length,
        ));
  }

  Widget _incomeListView() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) {
            return _iconItem(controller.incomeList[index]);
          },
          itemCount: controller.incomeList.length,
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
