import 'package:better_accounting/i18n/app_translation.dart';
import 'package:better_accounting/pages/root/root_binding.dart';
import 'package:better_accounting/pages/root/root_page.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  otherConfigs();
}

/// service里面做App启动前的初始化,比如初始化存储,初始化主题数据,
/// 初始化多语言(动态下发多语言),初始化设置等
Future initServices() async {
  await Get.putAsync(() async => await GetStorage.init(), permanent: true);
  await Get.putAsync(() async => IsarService.instance);
  // await Get.putAsync(() => SettingService().init());
}

void otherConfigs() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    // systemNavigationBarColor: Colors.black,
    // systemNavigationBarDividerColor: Colors.transparent,
    // systemNavigationBarIconBrightness: Brightness.dark,
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
            locale: Get.deviceLocale,
            defaultTransition: Transition.cupertino,
            popGesture: Get.isPopGestureEnable,
            fallbackLocale: const Locale('zh', 'CN'),
            initialBinding: RootBinding(),
            home: const RootPage(),
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
            ),
            builder: (context, widget) {
              widget = MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
              widget = botToastBuilder(context, widget);
              return widget;
            },
          );
        });
  }
}
