import 'package:better_accounting/pages/accounts/accounts_model.dart';

/// 某个区间(通常是一个月)的收支汇总.
/// 纯逻辑, 不依赖数据库和 UI, 方便单元测试.
class AccountsSummary {
  const AccountsSummary({required this.income, required this.expenses});

  static const empty = AccountsSummary(income: 0, expenses: 0);

  /// 收入(正数)
  final double income;

  /// 支出(负数)
  final double expenses;

  /// 结余
  double get balance => income + expenses;

  double get expenseRatio {
    final total = income + expenses.abs();
    return total == 0 ? 0 : expenses.abs() / total;
  }

  factory AccountsSummary.of(Iterable<AccountsModel> records) {
    var income = 0.0;
    var expenses = 0.0;
    for (final record in records) {
      // 不计入收支的账目不参与统计
      if (record.isNotCount || record.isReimbursed) continue;
      if (record.amount >= 0) {
        income += record.amount;
      } else {
        expenses += record.amount;
      }
    }
    return AccountsSummary(income: income, expenses: expenses);
  }

  /// 按分类(图标)汇总支出, 金额从多到少
  static List<CategoryAmount> expensesByIcon(Iterable<AccountsModel> records) {
    final totals = <String, CategoryAmount>{};
    for (final record in records) {
      if (record.amount >= 0) continue;
      if (record.isNotCount || record.isReimbursed) continue;
      final icon = record.icon.value;
      final name = icon?.name ?? '';
      if (name.isEmpty) continue;
      final current = totals[name];
      totals[name] = CategoryAmount(
        name: name,
        assetPath: icon!.assetPath,
        amount: (current?.amount ?? 0) + record.amount.abs(),
      );
    }
    final result = totals.values.toList()
      ..sort((a, b) => b.amount.compareTo(a.amount));
    return result;
  }

  /// 某个月每天的支出(正数), 下标 0 对应 1 号
  static List<double> dailyExpenses(
      Iterable<AccountsModel> records, DateTime month) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final daily = List<double>.filled(daysInMonth, 0);
    for (final record in records) {
      final createDT = record.createDT;
      if (createDT == null || record.amount >= 0) continue;
      if (!isSameMonth(createDT, month)) continue;
      daily[createDT.day - 1] += record.amount.abs();
    }
    return daily;
  }
}

class CategoryAmount {
  const CategoryAmount({
    required this.name,
    required this.assetPath,
    required this.amount,
  });

  final String name;
  final String assetPath;
  final double amount;
}

bool isSameMonth(DateTime? dateTime, DateTime month) =>
    dateTime != null &&
    dateTime.year == month.year &&
    dateTime.month == month.month;
