import 'package:better_accounting/constants/setting_service.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService extends GetxService {
  IsarService._privateConstructor();
  static final IsarService _instance = IsarService._privateConstructor();
  static IsarService get instance => _instance;

  late Isar isar;

  @override
  void onInit() async {
    await initDB();
    super.onInit();
  }

  Future initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = Isar.openSync([AccountsModelSchema, IconAssetModelSchema],
        directory: dir.path);
    if (isar.isOpen) {
      logger.i("==IsarDB已开启可以进行操作了==");
      var settingService = Get.find<SettingService>();
      await settingService.preLoadAssets();
    }
  }
}
