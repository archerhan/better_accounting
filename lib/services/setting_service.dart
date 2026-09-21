import 'dart:convert';

import 'package:better_accounting/constants/assets.gen.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// 设置 service: 语言, 以及数据库内置数据(图标库)的初始化.
class SettingService extends GetxService {
  SettingService._();

  static SettingService? _instance;

  static SettingService get instance => _instance!;

  /// 目前支持的语言, 与 [GetMaterialApp.supportedLocales] 保持一致
  static const supportedLanguages = <String>['zh_CN', 'en'];
  static const _defaultLanguage = 'zh_CN';
  static const _languageKey = 'setting_language_code';

  late final GetStorage _storage;

  static Future<SettingService> init() async {
    final service = _instance ??= SettingService._();
    service._storage = GetStorage();
    return service;
  }

  String get languageCode =>
      _storage.read<String>(_languageKey) ?? _defaultLanguage;

  Locale get locale {
    final codes = languageCode.split('_');
    return Locale(codes.first, codes.length > 1 ? codes[1] : null);
  }

  Future<void> changeLanguage(String languageCode) async {
    if (!supportedLanguages.contains(languageCode)) return;
    await _storage.write(_languageKey, languageCode);
    Get.updateLocale(locale);
  }

  /// 初始化时加载Icon数据(只做一次)
  Future<void> preLoadAssets() async {
    final isar = IsarService.instance.isar;
    if (await isar.iconAssetModels.count() > 0) {
      logger.i('数据库已存在Icon数据,无需再次加载');
      return;
    }

    logger.i('数据库中无Icon数据, 即将使用json生成');
    final jsonString = await rootBundle.loadString(Assets.json.icons);
    final iconPaths = List<String>.from(
        (jsonDecode(jsonString) as Map<String, dynamic>)['iconPath'] as List);
    logger.i('json中加载了${iconPaths.length}条数据');

    final iconList = <IconAssetModel>[
      for (final (index, path) in iconPaths.indexed)
        _buildIcon(index: index, path: path),
    ];

    await isar.writeTxn(() async {
      await isar.iconAssetModels.putAll(iconList);
    });
    logger.i('插入完成,共插入了${await isar.iconAssetModels.count()}条数据');
  }

  IconAssetModel _buildIcon({required int index, required String path}) {
    // assets/images/business/business_cable.png -> [assets, images, business, business_cable]
    final parts = path.split('.').first.split('/');
    final categoryName = parts[2];
    final now = DateTime.now();
    return IconAssetModel()
      ..assetPath = path
      ..index = index
      ..name = parts.last
      ..tags = <String>[]
      ..memos = <String>[]
      ..isInUse = true
      ..isCustomized = false
      ..createDT = now
      ..updateDT = now
      ..iconType =
          categoryName == 'income' ? IconType.income : IconType.expenses
      ..iconCategory = _iconCategory(categoryName);
  }

  IconCategory _iconCategory(String categoryName) => switch (categoryName) {
        'business' => IconCategory.business,
        'entertainment' => IconCategory.entertainment,
        'family' => IconCategory.family,
        'food' => IconCategory.food,
        'income' => IconCategory.income,
        'medical' => IconCategory.medical,
        'shopping' => IconCategory.shopping,
        'skill' => IconCategory.skill,
        'sport' => IconCategory.sport,
        'traffic' => IconCategory.traffic,
        _ => IconCategory.others,
      };
}
