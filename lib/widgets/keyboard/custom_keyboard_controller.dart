// ignore_for_file: prefer_function_declarations_over_variables

import 'package:better_accounting/widgets/keyboard/custom_keyboard_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomKeyboardService extends GetxService {
  var keyboardItemList = <CustomKeyboardModel>[];
  var numberResult = <String>["0"].obs;
  var cachedResultStr = "0";
  var finalResultStr = "0";
  @override
  void onInit() {
    keyboardItemList = [
      CustomKeyboardModel(title: "7", onTap: () => numberInput("7")),
      CustomKeyboardModel(title: "8", onTap: () => numberInput("8")),
      CustomKeyboardModel(title: "9", onTap: () => numberInput("9")),
      CustomKeyboardModel(title: "今天"),
      CustomKeyboardModel(title: "4", onTap: () => numberInput("4")),
      CustomKeyboardModel(title: "5", onTap: () => numberInput("5")),
      CustomKeyboardModel(title: "6", onTap: () => numberInput("6")),
      CustomKeyboardModel(title: "+"),
      CustomKeyboardModel(title: "1", onTap: () => numberInput("1")),
      CustomKeyboardModel(title: "2", onTap: () => numberInput("2")),
      CustomKeyboardModel(title: "3", onTap: () => numberInput("3")),
      CustomKeyboardModel(title: "-"),
      CustomKeyboardModel(title: ".", onTap: () => numberInput(".")),
      CustomKeyboardModel(title: "0", onTap: () => numberInput("0")),
      CustomKeyboardModel(title: "删除", onTap: () => deleteLastNum()),
      CustomKeyboardModel(title: "完成"),
    ];
    super.onInit();
  }

  /// 输入数字和小数点
  void numberInput(String num) {
    // 小数点只能有一个
    if (num == "." && numberResult.contains(".")) {
      return;
    }

    // 小数点后面只能输入两位
    if (numberResult.contains(".") &&
        (numberResult.length - numberResult.indexOf(".")) > 2) {
      return;
    }

    numberResult.add(num);

    // 以0开头的需要去掉0
    if (numberResult.length > 1 && numberResult.first == "0") {
      numberResult.removeAt(0);
    }
  }

  /// 删除
  void deleteLastNum() {
    if (numberResult.isNotEmpty) {
      numberResult.removeLast();
      if (numberResult.isEmpty) {
        numberResult.add("0");
      }
    } else {
      numberResult.add("0");
    }
  }

  void resetNumberResult() {
    numberResult.clear();
    numberResult.add("0");
  }

  void operatorTap(bool isAdd) {
    cachedResultStr = numberResult.join();
    resetNumberResult();
    if (isAdd) {
    } else {}
  }
}
