import 'dart:async';

import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final iconList = <IconAssetModel>[].obs;
  final expensesList = <IconAssetModel>[].obs;
  final incomeList = <IconAssetModel>[].obs;

  /// 当前选中的分类, 没选之前是 null
  final currentSelectedIcon = Rxn<IconAssetModel>();

  /// 记账弹框里的"备注"输入框
  final memoController = TextEditingController();

  /// 记账弹框里选中的日期
  final selectedDate = DateTime.now().obs;

  final panelController = PanelController();

  late final TabController tabController;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    unawaited(loadIconAssetsFromDB());
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    memoController.dispose();
    super.onClose();
  }

  Future<void> loadIconAssetsFromDB() async {
    final all = await IsarService.instance.isar.iconAssetModels.where().findAll();
    all.sort((a, b) => (a.index ?? 0).compareTo(b.index ?? 0));
    iconList.assignAll(all);
    expensesList.assignAll(all.where((icon) => icon.iconType == IconType.expenses));
    incomeList.assignAll(all.where((icon) => icon.iconType == IconType.income));
  }

  bool isSelected(IconAssetModel icon) {
    final selected = currentSelectedIcon.value;
    if (selected == null) return false;
    return selected.id != null
        ? selected.id == icon.id
        : identical(selected, icon);
  }

  /// 选中一个分类. [openPanel] 为 true 时顺带把记账键盘弹出来
  void selectIcon(IconAssetModel icon, {bool openPanel = true}) {
    currentSelectedIcon.value = icon;
    if (openPanel) {
      panelController.open();
    }
  }

  void updateSelectedDate(DateTime date) => selectedDate.value = date;
}
