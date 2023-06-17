// ignore_for_file: prefer_function_declarations_over_variables

import 'package:better_accounting/widgets/keyboard/custom_keyboard_model.dart';
import 'package:get/get.dart';
import 'package:decimal/decimal.dart';

class CustomKeyboardService extends GetxService {
  var keyboardItemList = <CustomKeyboardModel>[];
  var numberResult = "0".obs;
  @override
  void onInit() {
    keyboardItemList = [
      CustomKeyboardModel(
          title: "7",
          onTap: () {
            numberResult.value =
                (Decimal.parse(numberResult.value) + Decimal.parse("7"))
                    .toString();
          }),
      CustomKeyboardModel(title: "8"),
      CustomKeyboardModel(title: "9"),
      CustomKeyboardModel(title: "今天"),
      CustomKeyboardModel(title: "4"),
      CustomKeyboardModel(title: "5"),
      CustomKeyboardModel(title: "6"),
      CustomKeyboardModel(title: "+"),
      CustomKeyboardModel(title: "1"),
      CustomKeyboardModel(title: "2"),
      CustomKeyboardModel(title: "3"),
      CustomKeyboardModel(title: "-"),
      CustomKeyboardModel(title: "."),
      CustomKeyboardModel(title: "0"),
      CustomKeyboardModel(title: "删除"),
      CustomKeyboardModel(title: "完成"),
    ];
    super.onInit();
  }
}
