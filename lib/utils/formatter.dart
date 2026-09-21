import 'package:intl/intl.dart';

final _moneyFormat = NumberFormat('#,##0.00');
final _shortDate = DateFormat('MM-dd HH:mm');
final _monthFormat = DateFormat('yyyy年MM月');
final _dayFormat = DateFormat('MM月dd日');

/// 1234.5 -> 1,234.50
String formatMoney(double value) => _moneyFormat.format(value);

/// 带正负号的金额, 收入显示 +, 支出显示 -
String formatSignedMoney(double value) =>
    '${value >= 0 ? '+' : '-'}${formatMoney(value.abs())}';

/// 05-21 18:20
String formatDateTime(DateTime dateTime) => _shortDate.format(dateTime);

/// 2026年09月
String formatMonth(DateTime dateTime) => _monthFormat.format(dateTime);

/// 09月21日
String formatDay(DateTime dateTime) => _dayFormat.format(dateTime);
