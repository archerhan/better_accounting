import 'dart:async';

import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/accounts/accounts_summary.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/formatter.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class AccountsController extends GetxController {
  Isar get _isar => IsarService.instance.isar;

  StreamSubscription<void>? _accountsWatcher;

  /// 全部账目
  final accountsList = <AccountsModel>[].obs;

  /// 当前选中的月份(取该月 1 号)
  final selectedMonth = DateTime(DateTime.now().year, DateTime.now().month).obs;

  /// 选中月份的账目, 按时间倒序
  final monthlyAccounts = <AccountsModel>[].obs;

  /// 选中月份的收支汇总
  final summary = AccountsSummary.empty.obs;

  /// 选中月份的支出分类排行
  final monthlyExpensesByIcon = <CategoryAmount>[].obs;

  /// 选中月份每天的支出, 用于画柱状图
  final dailyExpenses = <double>[].obs;

  @override
  void onInit() {
    super.onInit();
    unawaited(loadAllAccountsRecord());
    // 数据库有变化时自动刷新
    _accountsWatcher?.cancel();
    _accountsWatcher = _isar.accountsModels.watchLazy().listen((_) {
      logger.d('Collection Watcher: 账目有变化');
      unawaited(loadAllAccountsRecord());
    });
  }

  @override
  void onClose() {
    _accountsWatcher?.cancel();
    super.onClose();
  }

  String get monthLabel => formatMonth(selectedMonth.value);

  bool get hasRecords => monthlyAccounts.isNotEmpty;

  /// 读取全部账目数据(按创建时间倒序)
  Future<void> loadAllAccountsRecord() async {
    accountsList.value =
        await _isar.accountsModels.where().sortByCreateDTDesc().findAll();
    logger.d('读取全部账目数据(按创建时间排序),共${accountsList.length}条数据');
    _refreshSelectedMonth();
  }

  /// 切换月份, [offset] 为月份偏移量
  void shiftMonth(int offset) {
    final month = selectedMonth.value;
    selectedMonth.value = DateTime(month.year, month.month + offset);
    _refreshSelectedMonth();
  }

  /// 跳到指定月份
  void selectMonth(DateTime month) {
    selectedMonth.value = DateTime(month.year, month.month);
    _refreshSelectedMonth();
  }

  void _refreshSelectedMonth() {
    final month = selectedMonth.value;
    final records = accountsList
        .where((record) => isSameMonth(record.createDT, month))
        .toList()
      ..sort((a, b) => (b.createDT ?? DateTime(0)).compareTo(a.createDT ?? DateTime(0)));
    monthlyAccounts.assignAll(records);
    summary.value = AccountsSummary.of(records);
    monthlyExpensesByIcon.assignAll(AccountsSummary.expensesByIcon(records));
    dailyExpenses.assignAll(AccountsSummary.dailyExpenses(records, month));
  }

  Future<void> addNewAccountsRecord(IconAssetModel icon, double amount,
      {String? memo,
      List<String>? tag,
      String? location,
      String? accountBook,
      String? account,
      bool isNotCount = false,
      bool isReimbursed = false,
      DateTime? createDT}) async {
    final now = DateTime.now();
    final recordDT = createDT ?? now;
    final accountsModel = AccountsModel()
      ..icon.value = icon
      ..amount = amount
      ..memo = memo
      ..tag = tag
      ..location = location
      ..accountBook = accountBook
      ..isNotCount = isNotCount
      ..isReimbursed = isReimbursed
      ..createDT = recordDT
      ..updateDT = recordDT;
    await _isar.writeTxn(() async {
      await _isar.accountsModels.put(accountsModel);
      await accountsModel.icon.save();
    });
    logger.d('添加新账目\nicon:${icon.name}\namount:$amount');
  }
}
