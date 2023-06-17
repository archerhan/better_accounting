import 'dart:convert';
import 'dart:io';

import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class SettingService extends GetxService {
  /// 初始化时加载Icon数据
  Future preLoadAssets() async {
    // 需要判断一下本地的数据库中有没有, 如果有数据就不需要加载了
    final isNotEmpty =
        await IsarService.instance.isar.iconAssetModels.count() > 0;
    if (IsarService.instance.isar.isOpen && isNotEmpty == true) {
      logger.i("数据库已存在Icon数据,无需再次加载");
      return;
    }
    logger.i("数据库中无Icon数据, 即将使用json生成");
    final file = await rootBundle.loadString(Assets.json.icons);
    final jsonString = jsonDecode(file);
    var data = List<String>.from(jsonString['iconPath']);
    logger.i("json中加载了${data.length}条数据");
    var iconList = <IconAssetModel>[];
    // var iconNameList = <String>[];
    for (var i = 0; i < data.length; i++) {
      final path = data[i];
      final parts = (path.split(".").first).split("/");
      // iconNameList.add(parts[3]);
      var iconModel = IconAssetModel();
      iconModel.assetPath = path;
      iconModel.index = i;
      iconModel.name = parts.last;
      iconModel.memos = <String>[];
      iconModel.tags = <String>[];
      iconModel.isCustomized = false;
      iconModel.isInUse = true;
      iconModel.createDT = DateTime.now();
      iconModel.updateDT = DateTime.now();
      iconModel.iconType =
          parts[2] == "income" ? IconType.income : IconType.expenses;
      iconModel.iconCategory = _iconCategory(parts[2]);
      iconList.add(iconModel);
    }
    // generateI18nKeyJson(iconNameList);
    logger.i("自动创建了${iconList.length}个IconAssetModel对象, 并准备插入数据库");
    await IsarService.instance.isar.writeTxn(() async {
      await IsarService.instance.isar.iconAssetModels.putAll(iconList);
    });
    final count = await IsarService.instance.isar.iconAssetModels.count();
    logger.i("插入完成,共插入了$count条数据");
  }

  IconCategory _iconCategory(String categoryName) {
    switch (categoryName) {
      case "business":
        return IconCategory.business;
      case "entertainment":
        return IconCategory.entertainment;
      case "family":
        return IconCategory.family;
      case "food":
        return IconCategory.food;
      case "income":
        return IconCategory.income;
      case "medical":
        return IconCategory.medical;
      case "shopping":
        return IconCategory.shopping;
      case "skill":
        return IconCategory.skill;
      case "sport":
        return IconCategory.sport;
      case "traffic":
        return IconCategory.traffic;
      default:
        return IconCategory.others;
    }
  }

  // 自动生成国际化文件
  Future generateI18nKeyJson(List<String> iconNameList) async {
    final path = "${(await getApplicationDocumentsDirectory()).path}/keys.json";
    var jsonFile = File(path);
    var mapData = Map.fromIterables(
        iconNameList, List.generate(iconNameList.length, (index) => ""));
    jsonFile.writeAsString(jsonEncode(mapData));
    logger.i("自动生成国际化文件,路径在:$path");
  }
}
