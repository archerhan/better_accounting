import 'package:better_accounting/i18n/app_translation.dart';
import 'package:better_accounting/routes/app_pages.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
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
            translationsKeys: AppTranslation.translations,
            locale: const Locale('zh', 'CN'),
            fallbackLocale: const Locale('zh', 'CN'),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Container(),
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
