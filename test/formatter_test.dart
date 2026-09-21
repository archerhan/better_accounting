import 'package:better_accounting/utils/formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatter', () {
    test('金额保留两位并加千分位', () {
      expect(formatMoney(0), '0.00');
      expect(formatMoney(1234.5), '1,234.50');
      expect(formatMoney(-20), '-20.00');
    });

    test('收入带 + 号, 支出带 - 号', () {
      expect(formatSignedMoney(15800), '+15,800.00');
      expect(formatSignedMoney(-12), '-12.00');
    });

    test('日期格式化', () {
      expect(formatDateTime(DateTime(2026, 9, 21, 18, 20)), '09-21 18:20');
      expect(formatMonth(DateTime(2026, 9, 1)), '2026年09月');
      expect(formatDay(DateTime(2026, 9, 21)), '09月21日');
    });
  });
}
