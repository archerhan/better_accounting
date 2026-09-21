import 'package:get/get.dart';

class DatePickerController extends GetxController {
  DatePickerController({DateTime? initialDate}) {
    resetTo(initialDate ?? DateTime.now());
  }

  static const firstYear = 2010;
  static const lastYear = 2100;

  final years = <String>[
    for (var year = firstYear; year <= lastYear; year++) '$year',
  ];

  final months = <String>[
    for (var month = 1; month <= 12; month++) '$month'.padLeft(2, '0'),
  ];

  /// 每个月的天数不一样, 所以是动态的
  final days = <String>[].obs;

  var selectYear = 0;
  var selectMonth = 0;
  var selectDay = 0;

  /// 月份滚轮在列表中的下标, 用来判断有没有跨年
  var _monthIndex = 0;

  int get yearIndex => selectYear - firstYear;
  int get monthIndex => _monthIndex;
  int get dayIndex => selectDay - 1;

  DateTime get selectedDateTime => DateTime(selectYear, selectMonth, selectDay);

  /// 把滚轮位置重置到指定日期
  void resetTo(DateTime date) {
    selectYear = date.year.clamp(firstYear, lastYear).toInt();
    selectMonth = date.month;
    selectDay = date.day;
    _monthIndex = selectMonth - 1;
    _refreshDays();
  }

  void selectYearIndex(int index) {
    selectYear = int.parse(years[index]);
    _refreshDays();
  }

  /// 月份滚轮是循环的, 从12月滑到1月就意味着到了下一年
  void selectMonthIndex(int index) {
    if (_monthIndex == 11 && index == 0) {
      selectYear = (selectYear + 1).clamp(firstYear, lastYear).toInt();
    } else if (_monthIndex == 0 && index == 11) {
      selectYear = (selectYear - 1).clamp(firstYear, lastYear).toInt();
    }
    _monthIndex = index;
    selectMonth = index + 1;
    _refreshDays();
  }

  void selectDayIndex(int index) => selectDay = index + 1;

  void _refreshDays() {
    // DateTime 会自动处理闰年和大小月
    final daysInMonth = DateTime(selectYear, selectMonth + 1, 0).day;
    selectDay = selectDay.clamp(1, daysInMonth).toInt();
    days.assignAll([
      for (var day = 1; day <= daysInMonth; day++)
        '$day'.padLeft(2, '0'),
    ]);
  }
}
