import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_chart_page.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/utils/formatter.dart';
import 'package:better_accounting/widgets/custom_divider.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
import 'package:better_accounting/widgets/dialog.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountsPage extends GetView<AccountsController> {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              _header(context),
              Positioned(bottom: 40.h, child: _card()),
            ],
          ),
          Expanded(child: _accountsListView()),
        ],
      ),
    );
  }

  Future<void> _pickMonth(BuildContext context) async {
    final picked = await showCustomDateTimeDialog(
      context,
      showType: DatePickerShowType.ym,
      initialDate: controller.selectedMonth.value,
    );
    if (picked != null) {
      controller.selectMonth(picked);
    }
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 258.h,
          decoration: BoxDecoration(
              color: AppColors.brightBlue,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(32.r))),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Row(
                children: [
                  _headerIcon(
                    icon: CupertinoIcons.search,
                    onTap: () => BotToast.showText(text: '搜索功能还在开发中'),
                  ),
                  const Spacer(),
                  Assets.images.common.betterLogo
                      .image(width: 101.w, height: 25.h),
                  const Spacer(),
                  _headerIcon(
                    icon: CupertinoIcons.calendar,
                    onTap: () => _pickMonth(context),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _pickMonth(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => Text(
                                controller.monthLabel,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.mainWhite,
                                    fontWeight: FontWeight.w500),
                              )),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 24.w,
                            color: AppColors.mainWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Obx(() => Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "accounts_balance".tr,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.mainWhite)),
                              TextSpan(
                                  text:
                                      "￥${formatMoney(controller.summary.value.balance)}",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: AppColors.mainWhite,
                                      fontWeight: FontWeight.w600))
                            ]))),
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 40.w)
            ],
          ),
        ),
        SizedBox(height: 160.h),
      ],
    );
  }

  Widget _headerIcon({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Icon(icon, size: 36.w, color: AppColors.mainWhite),
    );
  }

  Widget _accountsListView() {
    return Obx(() {
      final records = controller.monthlyAccounts;
      if (records.isEmpty) return _emptyView();
      return ListView.separated(
        padding: EdgeInsets.only(bottom: 100.h),
        itemCount: records.length,
        itemBuilder: (_, index) => _accountsItem(records[index]),
        separatorBuilder: (_, index) => const CustomDivider(),
      );
    });
  }

  Widget _emptyView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(CupertinoIcons.doc_text,
              size: 60.w, color: AppColors.greyCCC),
          SizedBox(height: 16.h),
          Text(
            "accounts_empty".tr,
            style: TextStyle(color: AppColors.grey999, fontSize: 15.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            "accounts_empty_hint".tr,
            style: TextStyle(color: AppColors.grey999, fontSize: 13.sp),
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 360.w,
      height: 200.h,
      decoration: BoxDecoration(
          color: AppColors.mainWhite,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
                color: AppColors.greyCCC,
                offset: Offset(0, 30),
                blurRadius: 40,
                spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _numItem(0)),
              SizedBox(width: 8.w),
              Expanded(child: _numItem(1)),
            ],
          ).paddingSymmetric(vertical: 20.h),
          const CustomDivider(
            height: 2,
            color: AppColors.greyCCC,
          ),
          SizedBox(height: 20.h),
          Obx(() => Text(
                _monthlyTip(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.grey999,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300),
              )),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.to(() => const AccountsChartPage()),
            child: Text(
              "accounts_more_analyze".tr,
              style: TextStyle(
                  color: AppColors.lightBlue,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// 本月花费最多的分类, 用来提示用户
  String _monthlyTip() {
    final ranking = controller.monthlyExpensesByIcon;
    if (ranking.isEmpty) return 'accounts_empty_tip'.tr;
    final top = ranking.first;
    return 'accounts_month_tip'.trParams({
      'category': top.name.tr,
      'amount': formatMoney(top.amount),
    });
  }

  Widget _numItem(int type) {
    final isExpense = type == 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isExpense ? AppColors.warningRed : AppColors.lightBlue),
        ),
        SizedBox(width: 5.w),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isExpense ? "accounts_expenses".tr : "accounts_income".tr,
                style: TextStyle(color: AppColors.grey999, fontSize: 11.sp),
              ),
              SizedBox(height: 5.h),
              Obx(() => FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      formatMoney(isExpense
                          ? controller.summary.value.expenses
                          : controller.summary.value.income),
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.mainTitle333,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget _accountsItem(AccountsModel accountsModel) {
    final icon = accountsModel.icon.value;
    final tags = accountsModel.tag ?? const <String>[];
    final createDT = accountsModel.createDT;
    return Container(
        color: AppColors.mainWhite,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            SizedBox(
              width: 44.w,
              height: 44.w,
              child: icon == null
                  ? const SizedBox.shrink()
                  : Image.asset(
                      icon.assetPath,
                      width: 44.w,
                      height: 44.w,
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountsModel.memo ??
                        (icon == null ? '' : icon.name.tr),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: AppColors.mainTitle333, fontSize: 18.sp),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      if (createDT != null)
                        Text(
                          formatDateTime(createDT),
                          style: TextStyle(
                              color: AppColors.grey999, fontSize: 12.sp),
                        ),
                      if (tags.isNotEmpty) ...[
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Text(
                            tags.map((tag) => '#$tag').join(' '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.lightBlue, fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              formatSignedMoney(accountsModel.amount),
              style: TextStyle(
                  color: accountsModel.amount.isNegative
                      ? AppColors.textRed
                      : AppColors.textGreen,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
