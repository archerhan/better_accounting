import 'package:isar/isar.dart';

part 'accounts_model.g.dart';

// 账目
@collection
class AccountsModel {
  Id? id;
  // icon信息
  final icon = IsarLink<IconAssetModel>();
  // 金额负的是支出,正的为收入
  late double amount;
  // 备注
  String? memo;
  // 标签(可多选)
  List<String>? tag;
  // 记账时的定位
  String? location;
  // 属于哪个账本
  String? accountBook;
  // 计入哪个账户
  String? account;
  // 是否不计入收支
  late bool isNotCount;
  // 是否报销(不计入收支)
  late bool isReimbursed;
  // 创建时间
  DateTime? createDT;
  // 修改时间
  DateTime? updateDT;
}

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
  others,
}

enum IconType {
  expenses,
  income,
}

// Icon
@collection
class IconAssetModel {
  Id? id;
  // 排列顺序(可能涉及重排)
  int? index;
  // icon的名字
  late String name;
  // icon的图片路径
  late String assetPath;
  // icon所属的大类
  @Enumerated(EnumType.name)
  late IconCategory iconCategory;
  // 属于支出还是收入
  @Enumerated(EnumType.name)
  late IconType iconType;
  // 该分类下的标签以英文逗号,分割
  List<String>? tags;
  // 在该分类下的备注
  List<String>? memos;
  // 是否启用
  late bool isInUse;
  // 是否是自定义的
  late bool isCustomized;
  // 创建时间
  late DateTime createDT;
  // 修改时间
  late DateTime updateDT;
}
