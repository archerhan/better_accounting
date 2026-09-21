# Better记账 (better_accounting)

一个用 Flutter 写的记账 App：本地存储、没有账号体系、数据不离开设备。

## 功能

- **分类记账**：160 个内置分类图标，区分支出 / 收入，也可以自定义
- **自带计算器**：记账时直接算数，不用切出去按计算器
- **收支分析**：按天统计的支出柱状图和支出排行
- **本地存储**：数据存在本机的 Isar 数据库里
- **多语言**：简体中文 / English（英文文案还在补充中）
- **演示数据**：首次启动自动生成最近三个月的账目，可在「设置 → 重新生成演示数据」里重置

## 运行

```bash
flutter pub get
flutter run                # 需要先启动一个模拟器/真机
```

环境要求：Flutter 3.44 或更高版本（Dart 3.12+）。

跑测试和静态检查：

```bash
flutter analyze
flutter test
```

iOS 真机调试需要在 Xcode 里选一下自己的开发团队（工程里没有预置签名信息）。

## 技术栈

| 用途 | 选型 |
| --- | --- |
| 状态管理 / 路由 / 多语言 | [GetX](https://pub.dev/packages/get) |
| 本地数据库 | [Isar](https://pub.dev/packages/isar) |
| 屏幕适配 | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) |
| 轻提示 | [bot_toast](https://pub.dev/packages/bot_toast) |

## 目录结构

```
lib/
├── constants/     # 颜色、文案、生成的资源引用
├── i18n/          # 多语言文案
├── pages/         # 页面 (accounts 账目 / category 分类 / settings 设置 / root 主框架)
├── services/      # 数据库、设置、演示数据
├── utils/         # 工具函数
└── widgets/       # 通用组件 (计算器、日期选择器等)
```

## License

[MIT](LICENSE)
