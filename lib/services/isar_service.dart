import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// 数据库 service.
///
/// 用 [IsarService.init] 注册, 它返回时 [isar] 一定已经打开,
/// 不会再出现"数据库还没准备好就被上层访问"的情况.
class IsarService extends GetxService {
  IsarService._();

  static IsarService? _instance;

  static IsarService get instance => _instance!;

  late final Isar isar;

  static Future<IsarService> init() async {
    final service = _instance ??= IsarService._();
    await service._open();
    return service;
  }

  Future<void> _open() async {
    final directory = await getApplicationDocumentsDirectory();
    isar = Isar.openSync(
      [AccountsModelSchema, IconAssetModelSchema],
      directory: directory.path,
    );
    logger.i('==IsarDB已开启可以进行操作了== ${directory.path}');
  }

  @override
  void onClose() {
    isar.close();
    super.onClose();
  }
}
