import 'package:better_accounting/widgets/date_picker/date_picker_controller.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 日期选择弹框.
///
/// 返回用户选中的日期, 点关闭/取消时返回 null.
Future<DateTime?> showCustomDateTimeDialog(
  BuildContext context, {
  DatePickerShowType showType = DatePickerShowType.ymd,
  DateTime? initialDate,
}) {
  final logic =
      Get.find<DatePickerController>()..resetTo(initialDate ?? DateTime.now());
  return showModalBottomSheet<DateTime>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: MediaQuery.sizeOf(context).height / 3.0,
        child: Column(children: [
          SizedBox(
            height: 50.h,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      Navigator.of(context).pop(logic.selectedDateTime),
                  child: Text(
                    'common_ok'.tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1.0),
          Expanded(child: DatePickerView(showType: showType)),
        ]),
      );
    },
  );
}
