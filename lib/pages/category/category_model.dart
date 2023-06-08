import 'package:isar/isar.dart';

enum IconCategory {
  business,
  entertainment,
  family,
  food,
  income,
  medical,
  shopping,
  skill,
  sport,
  traffic,
  others
}

enum IconType { expenses, income }

class IconAssetModel {
  Id? id;
  // 排列顺序(可能涉及重排)
  int? index;
  // icon的名字
  String? name;
  // icon的图片路径
  String? assetPath;
  // icon所属的大类
  IconCategory? iconCategory;
  // 属于支出还是收入
  Type? iconType;
  // 该分类下的标签以英文逗号,分割
  String? tags;
  // 是否启用
  bool? isInUse;
  // 是否是自定义的
  bool? isCustomized;
  // 创建时间
  DateTime? createDT;
  // 修改时间
  DateTime? updateDT;
}
