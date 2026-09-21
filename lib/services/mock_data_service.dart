import 'dart:math';

import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isar/isar.dart';

/// 演示数据: 第一次启动时灌一批账目进去, 让列表/统计这些页面有内容可看.
///
/// 数据是按固定随机种子生成的, 所以每次生成结果都一样.
/// 想重新灌一份, 到"设置 -> 重新生成演示数据".
class MockDataService {
  static const _versionKey = 'mock_data_version';
  static const _version = 1;
  static const _randomSeed = 20260921;

  static Isar get _isar => IsarService.instance.isar;

  /// 没有数据也没有灌过演示数据时, 自动灌一份
  static Future<void> seedIfNeeded() async {
    final storage = GetStorage();
    if (storage.read<int>(_versionKey) == _version) return;
    if (await _isar.accountsModels.count() > 0) {
      logger.i('数据库里已经有账目, 跳过演示数据生成');
      await storage.write(_versionKey, _version);
      return;
    }
    await reset();
  }

  /// 清空账目并重新生成演示数据
  static Future<void> reset() async {
    final icons = await _isar.iconAssetModels.where().findAll();
    if (icons.isEmpty) {
      logger.w('图标数据还没准备好, 跳过演示数据生成');
      return;
    }

    final expenseIcons =
        icons.where((icon) => icon.iconType == IconType.expenses).toList();
    final incomeIcons =
        icons.where((icon) => icon.iconType == IconType.income).toList();

    final records = _generate(expenseIcons, incomeIcons);

    await _isar.writeTxn(() async {
      await _isar.accountsModels.clear();
      await _isar.accountsModels.putAll(records);
      for (final record in records) {
        await record.icon.save();
      }
    });
    await GetStorage().write(_versionKey, _version);
    logger.i('演示数据生成完成, 共${records.length}条账目');
  }

  static List<AccountsModel> _generate(
    List<IconAssetModel> expenseIcons,
    List<IconAssetModel> incomeIcons,
  ) {
    final random = Random(_randomSeed);
    final now = DateTime.now();
    final records = <AccountsModel>[];

    // 生成最近三个月(含本月), 这样切换月份也有数据看
    for (var monthOffset = 2; monthOffset >= 0; monthOffset--) {
      final month = DateTime(now.year, now.month - monthOffset);
      final isCurrentMonth = month.year == now.year && month.month == now.month;
      final lastDay =
          isCurrentMonth ? now.day : DateTime(month.year, month.month + 1, 0).day;

      for (var day = 1; day <= lastDay; day++) {
        final date = DateTime(month.year, month.month, day);
        final count = _dailyRecordCount(date, random);
        for (var i = 0; i < count; i++) {
          final template = _pickTemplate(_expenseTemplates, random);
          records.add(_buildRecord(
            icon: _iconOf(expenseIcons, template.iconName),
            amount: -_amountOf(template, random),
            template: template,
            date: date,
            random: random,
          ));
        }
      }

      // 每月随机的几笔收入
      final incomeCount = 2 + random.nextInt(3);
      for (var i = 0; i < incomeCount; i++) {
        final template = _pickTemplate(_incomeTemplates, random);
        records.add(_buildRecord(
          icon: _iconOf(incomeIcons, template.iconName),
          amount: _amountOf(template, random),
          template: template,
          date: DateTime(month.year, month.month, 1 + random.nextInt(lastDay)),
          random: random,
        ));
      }

      // 每月固定的几笔: 工资 / 房租 / 水电
      records
        ..add(_buildRecord(
          icon: _iconOf(incomeIcons, 'income_card_wallet'),
          amount: 15800 + random.nextInt(12) * 100,
          template: _salaryTemplate,
          date: DateTime(month.year, month.month, 10),
          random: random,
        ))
        ..add(_buildRecord(
          icon: _iconOf(expenseIcons, 'family_house'),
          amount: -3200,
          template: _rentTemplate,
          date: DateTime(month.year, month.month, 5),
          random: random,
        ))
        ..add(_buildRecord(
          icon: _iconOf(expenseIcons, 'family_electric'),
          amount: -(120 + random.nextInt(140)).toDouble(),
          template: _utilityTemplate,
          date: DateTime(month.year, month.month, 12),
          random: random,
        ));
    }

    records.sort((a, b) => a.createDT!.compareTo(b.createDT!));
    return records;
  }

  static AccountsModel _buildRecord({
    required IconAssetModel icon,
    required double amount,
    required _Template template,
    required DateTime date,
    required Random random,
  }) {
    final createDT = DateTime(
      date.year,
      date.month,
      date.day,
      7 + random.nextInt(16),
      random.nextInt(60),
    );
    return AccountsModel()
      ..icon.value = icon
      ..amount = double.parse(amount.toStringAsFixed(2))
      ..memo = template.memos[random.nextInt(template.memos.length)]
      ..tag = template.tags.isEmpty ? null : [...template.tags]
      ..location = template.locations.isEmpty
          ? null
          : template.locations[random.nextInt(template.locations.length)]
      ..accountBook = '日常账本'
      ..account = _accounts[random.nextInt(_accounts.length)]
      ..isNotCount = false
      ..isReimbursed = false
      ..createDT = createDT
      ..updateDT = createDT;
  }

  static IconAssetModel _iconOf(List<IconAssetModel> icons, String name) {
    // 名字对不上时兜底取一个同类图标, 保证不会抛异常
    return icons.firstWhere((icon) => icon.name == name, orElse: () => icons.first);
  }

  static _Template _pickTemplate(List<_Template> templates, Random random) {
    final totalWeight =
        templates.fold<int>(0, (sum, template) => sum + template.weight);
    var hit = random.nextInt(totalWeight);
    for (final template in templates) {
      hit -= template.weight;
      if (hit < 0) return template;
    }
    return templates.first;
  }

  static double _amountOf(_Template template, Random random) {
    final amount =
        template.min + random.nextDouble() * (template.max - template.min);
    return amount >= 100 ? amount.roundToDouble() : amount;
  }

  /// 周末多花一点, 工作日少一点
  static int _dailyRecordCount(DateTime date, Random random) {
    final isWeekend = date.weekday >= DateTime.saturday;
    final base = isWeekend ? 3 : 2;
    return base + random.nextInt(isWeekend ? 3 : 2);
  }

  static const _accounts = ['微信', '支付宝', '招商银行', '现金'];

  static const _salaryTemplate = _Template(
    iconName: 'income_card_wallet',
    memos: ['工资', '本月工资'],
    tags: ['收入'],
  );

  static const _rentTemplate = _Template(
    iconName: 'family_house',
    memos: ['房租', '房租 + 物业'],
    tags: ['固定支出'],
  );

  static const _utilityTemplate = _Template(
    iconName: 'family_electric',
    memos: ['水电燃气费', '电费'],
    tags: ['固定支出'],
  );

  static const _expenseTemplates = <_Template>[
    _Template(
        iconName: 'food_cafe',
        memos: ['早餐', '楼下咖啡', '下午茶', '瑞幸咖啡'],
        min: 12,
        max: 38,
        tags: ['吃饭'],
        locations: ['公司', '国贸', '家'],
        weight: 6),
    _Template(
        iconName: 'food_rice',
        memos: ['午饭', '工作餐', '食堂'],
        min: 18,
        max: 48,
        tags: ['吃饭'],
        locations: ['公司', '写字楼'],
        weight: 6),
    _Template(
        iconName: 'food_noodles',
        memos: ['晚饭', '和朋友吃面', '夜宵'],
        min: 22,
        max: 68,
        tags: ['吃饭'],
        weight: 5),
    _Template(
        iconName: 'traffic_subway',
        memos: ['地铁', '通勤', '坐地铁上班'],
        min: 4,
        max: 12,
        tags: ['通勤'],
        weight: 7),
    _Template(
        iconName: 'traffic_taxi',
        memos: ['打车回家', '加班打车', '机场快线'],
        min: 26,
        max: 96,
        tags: ['通勤'],
        weight: 4),
    _Template(
        iconName: 'traffic_bus',
        memos: ['公交'],
        min: 2,
        max: 6,
        tags: ['通勤'],
        weight: 2),
    _Template(
        iconName: 'shopping_buying',
        memos: ['超市采购', '日用品', '买菜'],
        min: 36,
        max: 260,
        tags: ['购物'],
        locations: ['永辉超市', '山姆', '盒马'],
        weight: 5),
    _Template(
        iconName: 'food_milk',
        memos: ['牛奶', '水果', '零食'],
        min: 15,
        max: 88,
        tags: ['购物'],
        weight: 4),
    _Template(
        iconName: 'food_sushi',
        memos: ['寿司', '和朋友聚餐'],
        min: 88,
        max: 320,
        tags: ['聚餐'],
        weight: 3),
    _Template(
        iconName: 'food_crab',
        memos: ['海鲜大餐', '家人生日聚餐'],
        min: 180,
        max: 520,
        tags: ['聚餐'],
        weight: 2),
    _Template(
        iconName: 'food_cheesecake',
        memos: ['蛋糕', '甜品'],
        min: 28,
        max: 138,
        tags: ['零食'],
        weight: 3),
    _Template(
        iconName: 'food_icecream',
        memos: ['冰激凌', '奶茶'],
        min: 12,
        max: 36,
        tags: ['零食'],
        weight: 4),
    _Template(
        iconName: 'entertainment_documentary',
        memos: ['电影票', '看展'],
        min: 45,
        max: 168,
        tags: ['娱乐'],
        locations: ['万达影城', 'CGV'],
        weight: 3),
    _Template(
        iconName: 'entertainment_music',
        memos: ['演唱会门票', '音乐节'],
        min: 280,
        max: 880,
        tags: ['娱乐'],
        weight: 1),
    _Template(
        iconName: 'entertainment_beer',
        memos: ['和朋友小酌', '精酿'],
        min: 68,
        max: 260,
        tags: ['聚餐'],
        weight: 3),
    _Template(
        iconName: 'entertainment_spa',
        memos: ['按摩', '足疗'],
        min: 98,
        max: 268,
        tags: ['放松'],
        weight: 2),
    _Template(
        iconName: 'entertainment_cards',
        memos: ['桌游', '剧本杀'],
        min: 58,
        max: 158,
        tags: ['娱乐'],
        weight: 2),
    _Template(
        iconName: 'entertainment_controller',
        memos: ['游戏充值', '手柄'],
        min: 68,
        max: 398,
        tags: ['娱乐'],
        weight: 2),
    _Template(
        iconName: 'shopping_clothes',
        memos: ['衣服', '换季买衣服', '裤子'],
        min: 99,
        max: 699,
        tags: ['购物'],
        locations: ['优衣库', '淘宝', '京东'],
        weight: 3),
    _Template(
        iconName: 'shopping_powder',
        memos: ['护肤品', '化妆品'],
        min: 128,
        max: 580,
        tags: ['购物'],
        weight: 2),
    _Template(
        iconName: 'shopping_iphone',
        memos: ['话费充值', '手机配件'],
        min: 50,
        max: 299,
        tags: ['数码'],
        weight: 2),
    _Template(
        iconName: 'shopping_ipad',
        memos: ['数码配件', '键盘鼠标'],
        min: 129,
        max: 899,
        tags: ['数码'],
        weight: 1),
    _Template(
        iconName: 'shopping_gift',
        memos: ['给家人买礼物', '生日礼物'],
        min: 99,
        max: 699,
        tags: ['人情'],
        weight: 2),
    _Template(
        iconName: 'skill_book',
        memos: ['买书', '技术书'],
        min: 39,
        max: 168,
        tags: ['学习'],
        weight: 2),
    _Template(
        iconName: 'skill_study',
        memos: ['在线课程', '考证报名'],
        min: 199,
        max: 1280,
        tags: ['学习'],
        weight: 1),
    _Template(
        iconName: 'sport_yoga',
        memos: ['健身房月卡', '瑜伽课'],
        min: 199,
        max: 599,
        tags: ['运动'],
        weight: 2),
    _Template(
        iconName: 'sport_basketball',
        memos: ['球场场地费', '打球'],
        min: 30,
        max: 120,
        tags: ['运动'],
        weight: 2),
    _Template(
        iconName: 'sport_swim',
        memos: ['游泳卡'],
        min: 60,
        max: 260,
        tags: ['运动'],
        weight: 1),
    _Template(
        iconName: 'traffic_car',
        memos: ['停车费', '洗车'],
        min: 15,
        max: 120,
        tags: ['用车'],
        weight: 3),
    _Template(
        iconName: 'traffic_gas_station',
        memos: ['加油', '充电'],
        min: 200,
        max: 500,
        tags: ['用车'],
        weight: 2),
    _Template(
        iconName: 'traffic_tesla',
        memos: ['充电桩', '超充'],
        min: 40,
        max: 160,
        tags: ['用车'],
        weight: 2),
    _Template(
        iconName: 'traffic_delivery',
        memos: ['快递', '寄件'],
        min: 12,
        max: 68,
        tags: ['日常'],
        weight: 3),
    _Template(
        iconName: 'traffic_airplane',
        memos: ['机票', '出差机票'],
        min: 680,
        max: 2380,
        tags: ['出行'],
        weight: 1),
    _Template(
        iconName: 'traffic_subway',
        memos: ['共享单车', '骑行月卡'],
        min: 1.5,
        max: 25,
        tags: ['通勤'],
        weight: 4),
    _Template(
        iconName: 'family_lamp',
        memos: ['家居用品', '台灯'],
        min: 59,
        max: 469,
        tags: ['家居'],
        weight: 2),
    _Template(
        iconName: 'family_teddy',
        memos: ['给侄子买玩具', '毛绒玩具'],
        min: 39,
        max: 299,
        tags: ['人情'],
        weight: 2),
    _Template(
        iconName: 'family_dog',
        memos: ['猫粮狗粮', '宠物医院'],
        min: 68,
        max: 480,
        tags: ['宠物'],
        weight: 2),
    _Template(
        iconName: 'medical_medical_case',
        memos: ['买药', '感冒药'],
        min: 18,
        max: 168,
        tags: ['医疗'],
        weight: 2),
    _Template(
        iconName: 'medical_doctor_man',
        memos: ['挂号', '看牙'],
        min: 60,
        max: 860,
        tags: ['医疗'],
        weight: 1),
    _Template(
        iconName: 'others_barbershop',
        memos: ['理发'],
        min: 38,
        max: 168,
        tags: ['日常'],
        weight: 2),
    _Template(
        iconName: 'others_tooth_cleaning_kit',
        memos: ['洗护用品', '牙膏'],
        min: 25,
        max: 128,
        tags: ['日常'],
        weight: 2),
    _Template(
        iconName: 'others_guitar',
        memos: ['吉他课', '乐器配件'],
        min: 120,
        max: 680,
        tags: ['兴趣'],
        weight: 1),
    _Template(
        iconName: 'others_garden',
        memos: ['花店', '绿植'],
        min: 25,
        max: 199,
        tags: ['兴趣'],
        weight: 1),
  ];

  static const _incomeTemplates = <_Template>[
    _Template(
        iconName: 'income_money_transfer',
        memos: ['外包收入', '兼职收入'],
        min: 500,
        max: 3600,
        tags: ['外快'],
        weight: 1),
    _Template(
        iconName: 'income_coin_wallet',
        memos: ['红包', '报销到账'],
        min: 50,
        max: 800,
        tags: ['收入'],
        weight: 1),
    _Template(
        iconName: 'income_coin',
        memos: ['理财收益', '基金分红'],
        min: 30,
        max: 1200,
        tags: ['投资'],
        weight: 1),
    _Template(
        iconName: 'income_money_box',
        memos: ['退货运费', '退款'],
        min: 20,
        max: 300,
        tags: ['收入'],
        weight: 1),
  ];
}

class _Template {
  const _Template({
    required this.iconName,
    required this.memos,
    this.min = 0,
    this.max = 0,
    this.tags = const <String>[],
    this.locations = const <String>[],
    this.weight = 1,
  });

  final String iconName;
  final List<String> memos;
  final double min;
  final double max;
  final List<String> tags;
  final List<String> locations;
  final int weight;
}
