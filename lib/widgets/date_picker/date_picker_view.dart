import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum DatePickerShowType { ymd, ym }

class DatePickerView extends StatefulWidget {
  const DatePickerView({this.showType = DatePickerShowType.ymd, super.key});

  final DatePickerShowType showType;

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends State<DatePickerView> {
  final controller = Get.find<DatePickerController>();

  late final FixedExtentScrollController _yearController;
  late final FixedExtentScrollController _monthController;
  late final FixedExtentScrollController _dayController;

  @override
  void initState() {
    super.initState();
    _yearController = FixedExtentScrollController(initialItem: controller.yearIndex);
    _monthController =
        FixedExtentScrollController(initialItem: controller.monthIndex);
    _dayController = FixedExtentScrollController(initialItem: controller.dayIndex);
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildYear(),
              _unitText('common_year'.tr),
              _buildMonth(),
              _unitText('common_month'.tr),
              if (widget.showType == DatePickerShowType.ymd) _buildDay(),
              if (widget.showType == DatePickerShowType.ymd)
                _unitText('common_day'.tr),
            ],
          ),
        ),
      ],
    );
  }

  Widget _unitText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        color: AppColors.mainTitle333,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildYear() {
    return _pickerItem(
      key: const ValueKey('year'),
      width: 80.w,
      controller: _yearController,
      children: controller.years,
      onSelectedItemChanged: controller.selectYearIndex,
    );
  }

  Widget _buildMonth() {
    return _pickerItem(
      key: const ValueKey('month'),
      width: 80.w,
      controller: _monthController,
      children: controller.months,
      onSelectedItemChanged: (index) {
        controller.selectMonthIndex(index);
        // 换月以后天数会变, 上个月的31号在2月是不存在的
        if (widget.showType == DatePickerShowType.ymd &&
            _dayController.hasClients) {
          _dayController.jumpToItem(controller.dayIndex);
        }
      },
    );
  }

  Widget _buildDay() {
    return Obx(() => _pickerItem(
          key: const ValueKey('day'),
          width: 80.w,
          controller: _dayController,
          children: controller.days,
          onSelectedItemChanged: controller.selectDayIndex,
        ));
  }

  Widget _pickerItem({
    required Key key,
    required double width,
    required FixedExtentScrollController controller,
    required List<String> children,
    required ValueChanged<int> onSelectedItemChanged,
  }) {
    return SizedBox(
      key: key,
      width: width,
      child: CupertinoPicker(
        useMagnifier: true,
        itemExtent: 40.h,
        scrollController: controller,
        looping: true,
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: AppColors.primaryBlue.withValues(alpha: 0.15),
        ),
        diameterRatio: 0.8,
        squeeze: 1.4,
        onSelectedItemChanged: onSelectedItemChanged,
        children: [
          for (final item in children)
            SizedBox(
              width: width,
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColors.mainTitle333,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
