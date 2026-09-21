import 'package:better_accounting/widgets/date_picker/date_picker_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DatePickerController', () {
    test('重置到指定日期后, 滚轮下标对得上', () {
      final controller = DatePickerController(initialDate: DateTime(2026, 9, 21));

      expect(controller.selectYear, 2026);
      expect(controller.selectMonth, 9);
      expect(controller.selectDay, 21);
      expect(controller.yearIndex, 2026 - DatePickerController.firstYear);
      expect(controller.monthIndex, 8);
      expect(controller.dayIndex, 20);
      expect(controller.selectedDateTime, DateTime(2026, 9, 21));
    });

    test('闰年2月有29天', () {
      final controller = DatePickerController(initialDate: DateTime(2024, 2, 29));

      expect(controller.days.length, 29);
      expect(controller.selectDay, 29);
    });

    test('从大月切到小月时, 日期会被收敛到当月最后一天', () {
      final controller = DatePickerController(initialDate: DateTime(2026, 3, 31));

      controller.selectMonthIndex(3); // 4月

      expect(controller.selectMonth, 4);
      expect(controller.days.length, 30);
      expect(controller.selectDay, 30);
    });

    test('月份滚轮从12月滑到1月会跨到下一年', () {
      final controller = DatePickerController(initialDate: DateTime(2026, 12, 10));

      controller.selectMonthIndex(11);
      controller.selectMonthIndex(0);

      expect(controller.selectYear, 2027);
      expect(controller.selectMonth, 1);
    });

    test('年份被限制在可选范围内', () {
      final controller = DatePickerController();

      controller.selectYearIndex(controller.years.length - 1);

      expect(controller.selectYear, DatePickerController.lastYear);
    });
  });
}
