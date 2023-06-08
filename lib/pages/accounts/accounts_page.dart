import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_controller.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
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
                  showCustomDateTimeDialog(onOKTap: (date) {
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

  Future<int?> showCustomDateTimeDialog({Function(String)? onOKTap}) async {
    var logic = Get.find<DatePickerController>();
    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height / 3.0,
          child: Column(children: [
            SizedBox(
              height: 50.h,
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (logic.selectYear.toString().isEmpty ||
                          logic.selectYear.toString().isEmpty) {
                        return;
                      }
                      var date = '${logic.selectYear}:${logic.selectMonth}';
                      if (onOKTap != null) {
                        onOKTap(date);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'common_ok'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1.0),
            Expanded(
                child: DatePickerView(
              showType: DatePickerShowType.ym,
            )),
          ]),
        );
      },
    );
  }
}
