import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/widgets/keyboard/custom_keyboard_controller.dart';
import 'package:better_accounting/widgets/keyboard/custom_keyboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomKeyboard extends GetView<CustomKeyboardService> {
  const CustomKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5 * 2,
      decoration: const BoxDecoration(color: AppColors.mainWhite, boxShadow: [
        BoxShadow(
            color: AppColors.greyCCC, offset: Offset(0, -3), blurRadius: 24),
      ]),
      child: Column(
        children: [const Spacer(), _numberResult(), _numbersGridView()],
      ),
    );
  }

  Widget _numberResult() {
    return Obx(() => Text(
          controller.numberResult.join(),
          style: TextStyle(
              color: AppColors.mainTitle333,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600),
        ));
  }

  Widget _numbersGridView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 2),
        itemCount: controller.keyboardItemList.length,
        itemBuilder: (_, index) {
          return _numberPadItem(controller.keyboardItemList[index]);
        });
  }

  Widget _numberPadItem(CustomKeyboardModel customKeyboardModel) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: AppColors.dividerEEE, width: 0.5),
              right: BorderSide(color: AppColors.dividerEEE, width: 0.5))),
      child: TextButton(
          onPressed: () {
            if (customKeyboardModel.onTap != null) {
              customKeyboardModel.onTap?.call();
            }
          },
          child: Text(
            customKeyboardModel.title ?? '',
            style: TextStyle(color: AppColors.grey999, fontSize: 18.sp),
          )),
    );
  }
}
