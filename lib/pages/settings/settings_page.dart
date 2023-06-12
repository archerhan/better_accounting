import 'package:better_accounting/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("设置"),
      ),
    );
  }
}
