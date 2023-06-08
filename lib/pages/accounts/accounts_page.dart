import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/utils/logger_util.dart';
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
      body: Column(
        children: [_header()],
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 258.h,
      decoration: BoxDecoration(
          color: AppColors.brightBlue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(32.r))),
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
              Assets.images.common.betterLogo.image(width: 101.w, height: 25.h),
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
                    text: "结余:",
                    style:
                        TextStyle(fontSize: 20.sp, color: AppColors.mainWhite)),
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
    );
  }
}
