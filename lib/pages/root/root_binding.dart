import 'package:better_accounting/pages/root/root_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
