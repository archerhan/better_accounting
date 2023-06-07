import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:get/get.dart';

class AccountsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountsController>(() => AccountsController());
  }
}
