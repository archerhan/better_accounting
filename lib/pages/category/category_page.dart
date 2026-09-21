import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/pages/category/category_edit_page.dart';
import 'package:better_accounting/utils/formatter.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:better_accounting/widgets/caculator/simple_calculator.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
import 'package:better_accounting/widgets/dialog.dart';
import 'package:better_accounting/widgets/vertical_line.dart';
import 'package:bot_toast/bot_toast.dart';
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
        panel: _calculatorPanel(context),
        body: Column(
          children: [Expanded(child: _pageView())],
        ),
      ),
    );
  }

  Widget _calculatorPanel(BuildContext context) {
    return SizedBox(
      // 面板高度 = SlidingUpPanel 的 maxHeight, 给计算器留足显示区
      height: 380,
      child: Column(
        children: [
          _calToolBar(context),
          Expanded(
            child: SimpleCalculator(
              hideExpression: false,
              hideSurroundingBorder: true,
              autofocus: true,
              onChanged: (key, value, expression) async {
                if (key != "OK") {
                  logger.d('$key\t$value\t$expression');
                  return;
                }
                await _saveRecord(value);
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

  /// 点计算器上的 OK: 存一笔账然后回到首页
  Future<void> _saveRecord(double? value) async {
    final icon = controller.currentSelectedIcon.value;
    final amount = value ?? 0;
    if (icon != null && amount != 0) {
      // 支出存负数, 收入存正数
      final signed = controller.tabController.index == 0 ? -amount : amount;
      final memo = controller.memoController.text.trim();
      await Get.find<AccountsController>().addNewAccountsRecord(
        icon,
        signed,
        memo: memo.isEmpty ? null : memo,
        createDT: controller.selectedDate.value,
      );
    }
    controller.panelController.close();
    controller.memoController.clear();
    Get.back();
  }

  Widget _calToolBar(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton.icon(
              label: Obx(() => Text(formatDay(controller.selectedDate.value))),
              onPressed: () async {
                final picked = await showCustomDateTimeDialog(
                  context,
                  showType: DatePickerShowType.ymd,
                  initialDate: controller.selectedDate.value,
                );
                if (picked != null) controller.updateSelectedDate(picked);
              },
              icon: const Icon(
                Icons.calendar_month,
                color: AppColors.brightBlue,
              ),
            ),
            const VerticalLine(),
            Expanded(
              child: TextField(
                controller: controller.memoController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: 'accounts_memo_hint'.tr,
                  hintStyle: TextStyle(
                      color: AppColors.grey999, fontSize: 13.sp),
                ),
                style: TextStyle(
                    color: AppColors.mainTitle333, fontSize: 13.sp),
              ),
            ),
            const VerticalLine(),
            TextButton.icon(
              label: const Text("标签"),
              onPressed: () => BotToast.showText(text: '标签功能还在开发中'),
              icon: const Icon(Icons.label, color: AppColors.brightBlue),
            ),
          ],
        ),
      ],
    );
  }

  Widget _settingIcon() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.to(() => const CategoryEditPage()),
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
          Tab(text: "accounts_expenses".tr),
          Tab(text: "accounts_income".tr),
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
      children: [
        _iconGrid(controller.expensesList),
        _iconGrid(controller.incomeList),
      ],
    );
  }

  Widget _iconGrid(List<IconAssetModel> icons) {
    return Obx(() => GridView.builder(
          padding: EdgeInsets.only(top: 12.h, bottom: 120.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) => _iconItem(icons[index]),
          itemCount: icons.length,
        ));
  }

  Widget _iconItem(IconAssetModel iconAssetModel) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => controller.selectIcon(iconAssetModel),
          child: Obx(() => Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: controller.isSelected(iconAssetModel)
                      ? AppColors.primaryYellow.withValues(alpha: 0.7)
                      : AppColors.mainWhite,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  iconAssetModel.assetPath,
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.contain,
                ),
              )),
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
