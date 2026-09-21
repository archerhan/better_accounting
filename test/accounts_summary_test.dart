import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/accounts/accounts_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountsSummary', () {
    test('分别汇总收入和支出', () {
      final summary = AccountsSummary.of([
        _record(amount: -12.5),
        _record(amount: -7.5),
        _record(amount: 100),
      ]);

      expect(summary.expenses, -20);
      expect(summary.income, 100);
      expect(summary.balance, 80);
    });

    test('不计入收支的账目不参与统计', () {
      final summary = AccountsSummary.of([
        _record(amount: -30),
        _record(amount: -40, isNotCount: true),
        _record(amount: 50, isReimbursed: true),
      ]);

      expect(summary.expenses, -30);
      expect(summary.income, 0);
    });

    test('按分类汇总支出, 从多到少排序', () {
      final ranking = AccountsSummary.expensesByIcon([
        _record(amount: -10, iconName: 'food_cafe'),
        _record(amount: -30, iconName: 'food_cafe'),
        _record(amount: -25, iconName: 'traffic_subway'),
        _record(amount: 200, iconName: 'income_money'),
      ]);

      expect(ranking.map((e) => e.name), ['food_cafe', 'traffic_subway']);
      expect(ranking.first.amount, 40);
      expect(ranking.first.assetPath, endsWith('food_cafe.png'));
    });

    test('每日支出只统计当月', () {
      final month = DateTime(2026, 9);
      final daily = AccountsSummary.dailyExpenses([
        _record(amount: -10, createDT: DateTime(2026, 9, 1)),
        _record(amount: -5, createDT: DateTime(2026, 9, 1)),
        _record(amount: -20, createDT: DateTime(2026, 9, 30)),
        _record(amount: -99, createDT: DateTime(2026, 8, 31)),
        _record(amount: 500, createDT: DateTime(2026, 9, 30)),
      ], month);

      expect(daily.length, 30);
      expect(daily[0], 15);
      expect(daily[29], 20);
    });

    test('isSameMonth 忽略 null', () {
      expect(isSameMonth(DateTime(2026, 9, 21), DateTime(2026, 9, 1)), isTrue);
      expect(isSameMonth(DateTime(2026, 8, 21), DateTime(2026, 9, 1)), isFalse);
      expect(isSameMonth(null, DateTime(2026, 9, 1)), isFalse);
    });
  });
}

AccountsModel _record({
  required double amount,
  DateTime? createDT,
  String iconName = 'food_cafe',
  bool isNotCount = false,
  bool isReimbursed = false,
}) {
  final icon = IconAssetModel()
    ..name = iconName
    ..assetPath = 'assets/images/food/$iconName.png';
  return AccountsModel()
    ..icon.value = icon
    ..amount = amount
    ..isNotCount = isNotCount
    ..isReimbursed = isReimbursed
    ..createDT = createDT;
}
