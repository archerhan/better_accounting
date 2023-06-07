import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/root/root_controller.dart';
import 'package:better_accounting/pages/settings/settings_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => AccountsController());
    Get.lazyPut(() => SettingsController());
  }
}
