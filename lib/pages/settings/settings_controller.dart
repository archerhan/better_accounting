import 'dart:async';

import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  /// 分类数量
  final iconCount = 0.obs;

  /// 全部账目笔数
  final recordCount = 0.obs;

  @override
  void onReady() {
    super.onReady();
    unawaited(refreshStats());
  }

  Future<void> refreshStats() async {
    final isar = IsarService.instance.isar;
    iconCount.value = await isar.iconAssetModels.count();
    recordCount.value = await isar.accountsModels.count();
  }
}
