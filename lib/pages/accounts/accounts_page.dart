import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsPage extends GetView<AccountsController> {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("近期支出"),
      ),
    );
  }
}
