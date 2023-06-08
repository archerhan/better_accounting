import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:better_accounting/widgets/custom_divider.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
import 'package:better_accounting/widgets/dialog.dart';
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [_header(), Positioned(bottom: 40.h, child: _card())],
      ),
    );
  }

  Widget _header() {
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
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.search,
                      size: 36.w,
                      color: AppColors.mainWhite,
                    ),
                  ),
                  const Spacer(),
                  Assets.images.common.betterLogo
                      .image(width: 101.w, height: 25.h),
                  const Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.calendar,
                      size: 36.w,
                      color: AppColors.mainWhite,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
              SizedBox(height: 30.h),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      showCustomDateTimeDialog(
                          showType: DatePickerShowType.ym,
                          onOKTap: (date) {
                            logger.d(date);
                          });
                    },
                    child: Obx(() => Text(
                          "${controller.selectedYear.string}年${controller.selectedMonth.string}月",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.mainWhite,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 24.w,
                    color: AppColors.mainWhite,
                  ),
                  const Spacer(),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "accounts_balance".tr,
                        style: TextStyle(
                            fontSize: 20.sp, color: AppColors.mainWhite)),
                    TextSpan(
                        text: "￥${controller.balance}",
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: AppColors.mainWhite,
                            fontWeight: FontWeight.w600))
                  ])),
                ],
              ).paddingSymmetric(horizontal: 40.w)
            ],
          ),
        ),
        SizedBox(
          height: 160.h,
        )
      ],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_numItem(0), _numItem(1)],
          ).paddingSymmetric(vertical: 20.h),
          const CustomDivider(
            height: 2,
            color: AppColors.greyCCC,
          ),
          SizedBox(height: 20.h),
          Text(
            "本月你在交通花费了￥1080，让我们更节省一些吧~",
            style: TextStyle(
                color: AppColors.grey999,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300),
          ),
          const Spacer(),
          Text(
            "accounts_more_analyze".tr,
            style: TextStyle(
                color: AppColors.lightBlue,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  Widget _numItem(int type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: type == 0 ? AppColors.warningRed : AppColors.lightBlue),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type == 0 ? "accounts_expenses".tr : "accounts_income".tr,
              style: TextStyle(color: AppColors.grey999, fontSize: 11.sp),
            ),
            SizedBox(height: 5.h),
            Obx(() => Text(
                  type == 0
                      ? controller.expenses.string
                      : controller.income.string,
                  style: TextStyle(
                      color: AppColors.mainTitle333,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                ))
          ],
        )
      ],
    );
  }
}
