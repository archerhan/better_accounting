import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/pages/category/category_edit_page.dart';
import 'package:better_accounting/widgets/caculator/simple_calculator.dart';
import 'package:better_accounting/widgets/vertical_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainWhite,
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        title: _categoryBar(),
        foregroundColor: AppColors.mainBlack,
        actions: [_settingIcon()],
      ),
      backgroundColor: AppColors.mainWhite,
      body: SlidingUpPanel(
        controller: controller.panelController,
        minHeight: 0,
        maxHeight: 380,
        panel: _showCal(),
        body: Column(
          children: [Expanded(child: _pageView())],
        ),
      ),
    );
  }

  Widget _showCal() {
    return SizedBox(
      height: 380,
      child: Column(
        children: [
          _calToolBar(),
          Expanded(
            child: SimpleCalculator(
              hideExpression: false,
              hideSurroundingBorder: true,
              autofocus: true,
              onChanged: (key, value, expression) async {
                if (key == "OK") {
                  final accountsController = Get.find<AccountsController>();
                  if (value != 0) {
                    var v = value!;
                    if (controller.tabController.index == 0) {
                      v = -value;
                    }
                    await accountsController.addNewAccountsRecord(
                        controller.currentSelectedIcon.value, v);
                  }

                  controller.panelController.close();
                  Get.back();
                }
                if (kDebugMode) {
                  print('$key\t$value\t$expression');
                }
              },
              onTappedDisplay: (value, details) {
                if (kDebugMode) {
                  print('$value\t${details.globalPosition}');
                }
              },
              theme: const CalculatorThemeData(
                borderColor: AppColors.dividerEEE,
                borderWidth: 1,
                displayColor: AppColors.mainWhite,
                displayStyle:
                    TextStyle(fontSize: 80, color: AppColors.mainTitle333),
                expressionColor: AppColors.primaryBlue,
                expressionStyle:
                    TextStyle(fontSize: 16, color: AppColors.mainWhite),
                operatorColor: AppColors.mainWhite,
                operatorStyle:
                    TextStyle(fontSize: 30, color: AppColors.mainTitle333),
                commandColor: AppColors.primaryYellow,
                commandStyle:
                    TextStyle(fontSize: 30, color: AppColors.mainWhite),
                numColor: AppColors.mainWhite,
                numStyle:
                    TextStyle(fontSize: 30, color: AppColors.mainTitle333),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _calToolBar() {
    return Row(
      children: [
        TextButton.icon(
            label: Text("日期"),
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
              color: AppColors.brightBlue,
            )),
        const VerticalLine(),
        TextButton.icon(
            label: Text("备注"),
            onPressed: () {},
            icon: const Icon(
              Icons.note,
              color: AppColors.brightBlue,
            )),
        const VerticalLine(),
        TextButton.icon(
            label: Text("标签"),
            onPressed: () {},
            icon: const Icon(
              Icons.label,
              color: AppColors.brightBlue,
            )),
        const VerticalLine(),
        TextButton.icon(
            label: Text("定位"),
            onPressed: () {},
            icon: const Icon(
              Icons.location_on,
              color: AppColors.brightBlue,
            )),
      ],
    );
  }

  Widget _settingIcon() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.to(const CategoryEditPage()),
      child: Container(
        padding: EdgeInsets.all(5.w),
        child: Icon(
          Icons.settings,
          size: 26.w,
          color: AppColors.grey999,
        ),
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
        labelStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
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
            _showCal();
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
