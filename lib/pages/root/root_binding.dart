import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/pages/root/root_controller.dart';
import 'package:better_accounting/pages/settings/settings_controller.dart';
import 'package:better_accounting/widgets/date_picker/date_picker_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(AccountsController());
    Get.put(SettingsController());
    Get.lazyPut(() => DatePickerController());
    Get.put(CategoryController());
  }
}
