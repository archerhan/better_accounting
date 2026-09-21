import 'dart:math';

import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/accounts/accounts_summary.dart';
import 'package:better_accounting/utils/formatter.dart';
import 'package:better_accounting/widgets/custom_app_bar.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
import 'package:better_accounting/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 收支分析: 每日支出柱状图 + 支出分类排行
class AccountsChartPage extends GetView<AccountsController> {
  const AccountsChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      appBar: CustomAppBar(text: 'accounts_chart_title'.tr),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 10.h),
            _monthSelector(context),
            SizedBox(height: 20.h),
            _summaryCard(),
            SizedBox(height: 28.h),
            _dailyChart(),
            SizedBox(height: 28.h),
            _ranking(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Future<void> _pickMonth(BuildContext context) async {
    final picked = await showCustomDateTimeDialog(
      context,
      showType: DatePickerShowType.ym,
      initialDate: controller.selectedMonth.value,
    );
    if (picked != null) controller.selectMonth(picked);
  }

  Widget _monthSelector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => controller.shiftMonth(-1),
          icon: const Icon(Icons.chevron_left),
          color: AppColors.mainTitle333,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _pickMonth(context),
          child: Obx(() => Text(
                controller.monthLabel,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTitle333),
              )),
        ),
        IconButton(
          onPressed: () => controller.shiftMonth(1),
          icon: const Icon(Icons.chevron_right),
          color: AppColors.mainTitle333,
        ),
      ],
    );
  }

  Widget _summaryCard() {
    final summary = controller.summary.value;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.brightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'accounts_balance'.tr,
            style: TextStyle(fontSize: 13.sp, color: AppColors.mainWhite),
          ),
          SizedBox(height: 6.h),
          Text(
            '￥${formatMoney(summary.balance)}',
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.mainWhite),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              Flexible(
                  child: _summaryItem('accounts_expenses'.tr,
                      formatMoney(summary.expenses), AppColors.mainWhite)),
              SizedBox(width: 40.w),
              Flexible(
                  child: _summaryItem('accounts_income'.tr,
                      formatMoney(summary.income), AppColors.mainWhite)),
            ],
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: summary.expenseRatio.clamp(0, 1).toDouble(),
              minHeight: 6.h,
              backgroundColor: AppColors.mainWhite.withValues(alpha: 0.3),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primaryYellow),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12.sp, color: color)),
        SizedBox(height: 4.h),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 18.sp, fontWeight: FontWeight.w600, color: color),
          ),
        ),
      ],
    );
  }

  Widget _dailyChart() {
    final daily = controller.dailyExpenses;
    if (daily.isEmpty) return const SizedBox.shrink();
    final maxValue = daily.fold<double>(0, max);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('accounts_chart_daily'.tr),
        SizedBox(height: 14.h),
        SizedBox(
          height: 140.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final value in daily)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Container(
                      height: maxValue == 0
                          ? 2.h
                          : (value / maxValue * 120.h)
                              .clamp(2.h, 120.h)
                              .toDouble(),
                      decoration: BoxDecoration(
                        color: value > 0
                            ? AppColors.warningRed
                            : AppColors.dividerEEE,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('01',
                style: TextStyle(fontSize: 11.sp, color: AppColors.grey999)),
            Text('${daily.length}',
                style: TextStyle(fontSize: 11.sp, color: AppColors.grey999)),
          ],
        ),
      ],
    );
  }

  Widget _ranking() {
    final ranking = controller.monthlyExpensesByIcon;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('accounts_chart_ranking'.tr),
        SizedBox(height: 6.h),
        if (ranking.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Center(
              child: Text(
                'accounts_chart_empty'.tr,
                style: TextStyle(fontSize: 13.sp, color: AppColors.grey999),
              ),
            ),
          )
        else
          for (final item in ranking.take(8))
            _rankingItem(item, ranking.first.amount),
      ],
    );
  }

  Widget _rankingItem(CategoryAmount item, double maxAmount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Image.asset(item.assetPath, width: 32.w, height: 32.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15.sp, color: AppColors.mainTitle333),
                      ),
                    ),
                    Text(
                      '￥${formatMoney(item.amount)}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTitle333),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.r),
                  child: LinearProgressIndicator(
                    value: maxAmount == 0 ? 0 : item.amount / maxAmount,
                    minHeight: 5.h,
                    backgroundColor: AppColors.dividerEEE,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryBlue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.mainTitle333),
    );
  }
}
