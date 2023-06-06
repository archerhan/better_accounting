import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarHelper {
  IsarHelper._privateConstructor();
  static final IsarHelper _instance = IsarHelper._privateConstructor();
  static IsarHelper get instance => _instance;

  late Isar isarInstance;

  init() async {
    final dir = await getApplicationDocumentsDirectory();
    // TODO: 创建的模型Schema需要添加到这里
    isarInstance = await Isar.open([], directory: dir.path);
  }

  // TODO:根据实际业务需求做增删改查操作

}
