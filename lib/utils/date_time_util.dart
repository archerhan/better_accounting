import 'package:date_format/date_format.dart';

class DateTimeUtil {
  static String getFirstDateOfMonth(DateTime dateTime, {String? separator}) {
    var year = dateTime.year;
    var month =
        dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month.toString();
    var day = '01';
    var sep = separator ?? '-';
    return formatDate(
        DateTime.parse('$year$sep$month$sep$day'), [yyyy, sep, mm, sep, dd]);
  }

  static String getLastDateOfMonth(DateTime dateTime, {String? separator}) {
    var year = dateTime.year;
    var currentMonthDays = getCurrentMonthDays(dateTime);
    var month =
        dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month.toString();
    var day = currentMonthDays < 10
        ? '0$currentMonthDays'
        : currentMonthDays.toString();
    var sep = separator ?? '-';
    return formatDate(
        DateTime.parse('$year$sep$month$sep$day'), [yyyy, sep, mm, sep, dd]);
  }

  static String getYearStr(DateTime dateTime) {
    return dateTime.year.toString();
  }

  static String getMonthStr(DateTime dateTime, {bool? hasZero = false}) {
    return dateTime.month < 10
        ? '${hasZero == true ? '0' : ''}${dateTime.month}'
        : dateTime.month.toString();
  }

  static String getDayStr(DateTime dateTime, {bool? hasZero = false}) {
    return dateTime.day < 10
        ? '${hasZero == true ? '0' : ''}${dateTime.day}'
        : dateTime.day.toString();
  }

  static String getHourStr(DateTime dateTime, {bool? hasZero = false}) {
    return dateTime.hour < 10
        ? '${hasZero == true ? '0' : ''}${dateTime.hour}'
        : dateTime.hour.toString();
  }

  static String getMinuteStr(DateTime dateTime, {bool? hasZero = false}) {
    return dateTime.minute < 10
        ? '${hasZero == true ? '0' : ''}${dateTime.minute}'
        : dateTime.minute.toString();
  }

  static String getSecondStr(DateTime dateTime, {bool? hasZero = false}) {
    return dateTime.second < 10
        ? '${hasZero == true ? '0' : ''}${dateTime.second}'
        : dateTime.second.toString();
  }

  static String getWeekDay(DateTime dateTime) {
    var weekday = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
    return weekday[dateTime.weekday - 1];
  }

  static int getCurrentMonthDays(DateTime dateTime) {
    var year = dateTime.year;
    var month = dateTime.month;
    if (month == 2) {
      //判断2月份是闰年月还是平年
      if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
        return 29;
      } else {
        return 28;
      }
    } else if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      return 31;
    } else {
      return 30;
    }
  }
}
