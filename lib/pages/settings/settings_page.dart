import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/settings/settings_controller.dart';
import 'package:better_accounting/widgets/caculator/simple_calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
              child: SizedBox(
            height: 300,
            child: _calculator(),
          )),
        ],
      ),
    );
  }

  Widget _calculator() {
    return SimpleCalculator(
      // value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        // setState(() {
        //   _currentValue = value ?? 0;
        // });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: const CalculatorThemeData(
        borderColor: AppColors.dividerEEE,
        borderWidth: 1,
        displayColor: AppColors.mainWhite,
        displayStyle: TextStyle(fontSize: 80, color: AppColors.primaryYellow),
        expressionColor: AppColors.primaryBlue,
        expressionStyle: TextStyle(fontSize: 16, color: AppColors.mainWhite),
        operatorColor: AppColors.mainWhite,
        operatorStyle: TextStyle(fontSize: 30, color: AppColors.mainTitle333),
        commandColor: AppColors.primaryYellow,
        commandStyle: TextStyle(fontSize: 30, color: AppColors.mainWhite),
        numColor: AppColors.mainWhite,
        numStyle: TextStyle(fontSize: 30, color: AppColors.mainTitle333),
      ),
    );
  }
}
