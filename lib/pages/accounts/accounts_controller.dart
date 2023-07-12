import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class AccountsController extends GetxController {
  @override
  void onReady() async {
    await loadAllAccountsRecord();

    Stream<void> accountsChanged =
        IsarService.instance.isar.accountsModels.watchLazy();
    accountsChanged.listen((_) async {
      logger.d("Collection Watcher:有新数据插入");
      await loadAllAccountsRecord();
    });
    super.onReady();
  }

  var selectedYear = "2023".obs;
  var selectedMonth = "05".obs;
  var balance = "0.00".obs;
  var income = "0.00".obs;
  var expenses = "0.00".obs;

  // 首页所有的账目
  var accountsList = <AccountsModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  // 加载所有数据
  Future loadAllAccountsRecord() async {
    var list = await IsarService.instance.isar.accountsModels
        .where()
        .sortByCreateDTDesc()
        .findAll();
    accountsList.value = list;
    logger.d("读取全部账目数据(按创建时间排序),共${list.length}条数据");
  }

  Future<void> addNewAccountsRecord(IconAssetModel icon, double amount,
      {String? memo,
      List<String>? tag,
      String? location,
      String? accountBook,
      String? account,
      bool isNotCount = false,
      bool isReimbursed = false}) async {
    final accountsModel = AccountsModel();
    accountsModel.icon.value = icon;
    accountsModel.amount = amount;
    accountsModel.memo = memo;
    accountsModel.tag = tag;
    accountsModel.location = location;
    accountsModel.accountBook = accountBook;
    accountsModel.isNotCount = isNotCount;
    accountsModel.isReimbursed = isReimbursed;
    accountsModel.createDT = DateTime.now();
    accountsModel.updateDT = DateTime.now();
    await IsarService.instance.isar.writeTxn(() async {
      await IsarService.instance.isar.accountsModels.put(accountsModel);
      await accountsModel.icon.save();
    });
    logger.d("添加新账目\nicon:${icon.name}\namount:$amount");
  }
}
