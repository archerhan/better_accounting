import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var iconList = <IconAssetModel>[].obs;
  var expensesList = <IconAssetModel>[].obs;
  var incomeList = <IconAssetModel>[].obs;
  var currentSelectedIcon = IconAssetModel().obs;

  late TabController tabController;
  late PageController pageController;

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    await loadIconAssetsFronDB();
    super.onInit();
  }

  Future loadIconAssetsFronDB() async {
    iconList.value =
        await IsarService.instance.isar.iconAssetModels.where().findAll();
    expensesList.value = iconList
        .where((element) => element.iconCategory != IconCategory.income)
        .toList();
    incomeList.value = iconList
        .where((element) => element.iconCategory == IconCategory.income)
        .toList();
  }

  void selectIcon(IconAssetModel iconAssetModel) {
    currentSelectedIcon.value = iconAssetModel;
    iconList.value = iconList.map<IconAssetModel>((element) {
      element.isSelected = false;
      if (element.id == iconAssetModel.id) {
        element.isSelected = true;
      }
      return element;
    }).toList();
  }
}
