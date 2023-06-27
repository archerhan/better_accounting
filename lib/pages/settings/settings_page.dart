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
          SizedBox(
            height: 300,
          ),
          Expanded(child: _calculator()),
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
        borderColor: Colors.black,
        borderWidth: 2,
        displayColor: Colors.black,
        displayStyle: TextStyle(fontSize: 80, color: Colors.yellow),
        expressionColor: Colors.indigo,
        expressionStyle: TextStyle(fontSize: 16, color: Colors.white),
        operatorColor: Colors.pink,
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.orange,
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.grey,
        numStyle: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
