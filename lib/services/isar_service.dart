import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService extends GetxService {
  IsarService._privateConstructor();
  static final IsarService _instance = IsarService._privateConstructor();
  static IsarService get instance => _instance;

  late Isar isarInstance;

  @override
  void onInit() async {
    await initDB();
    super.onInit();
  }

  Future initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isarInstance = await Isar.open([AccountsModelSchema, IconAssetModelSchema],
        directory: dir.path);
  }
}
