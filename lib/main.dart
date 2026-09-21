import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/i18n/app_translation.dart';
import 'package:better_accounting/pages/root/root_binding.dart';
import 'package:better_accounting/pages/root/root_page.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/services/mock_data_service.dart';
import 'package:better_accounting/services/setting_service.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // 任何会用到平台通道(MethodChannel)的代码都必须在 binding 初始化之后执行
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  otherConfigs();
  runApp(const MyApp());
}

/// service里面做App启动前的初始化,比如初始化存储,初始化主题数据,
/// 初始化多语言(动态下发多语言),初始化设置等
/// 有依赖关系的service, 被依赖的必须放在前面
Future<void> initServices() async {
  await Get.putAsync(() => GetStorage.init(), permanent: true);
  await Get.putAsync(() => SettingService.init(), permanent: true);
  await Get.putAsync(() => IsarService.init(), permanent: true);
  // Isar 准备好了才能往数据库里写内置数据
  await SettingService.instance.preLoadAssets();
  await MockDataService.seedIfNeeded();
}

void otherConfigs() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          enableLog: false,
          translationsKeys: AppTranslation.translations,
          locale: SettingService.instance.locale,
          fallbackLocale: const Locale('zh', 'CN'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')],
          defaultTransition: Transition.cupertino,
          popGesture: Get.isPopGestureEnable,
          initialBinding: RootBinding(),
          home: const RootPage(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
            useMaterial3: true,
            // 全局去掉点击的背景高亮颜色
            highlightColor: Colors.transparent,
            // 全局去掉水波纹效果
            splashColor: Colors.transparent,
          ),
          builder: (context, widget) {
            widget = MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
            widget = botToastBuilder(context, widget);
            return widget;
          },
        );
      },
    );
  }
}
