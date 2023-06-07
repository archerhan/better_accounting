import 'package:better_accounting/pages/accounts/accounts_binding.dart';
import 'package:better_accounting/pages/accounts/accounts_page.dart';
import 'package:better_accounting/pages/root/root_binding.dart';
import 'package:better_accounting/pages/root/root_page.dart';
import 'package:better_accounting/pages/settings/settings_binding.dart';
import 'package:better_accounting/pages/settings/settings_page.dart';
import 'package:better_accounting/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const kInitialRoute = Routes.root;

  static final routes = <GetPage>[
    GetPage(
        name: Routes.root,
        page: () => const RootPage(),
        binding: RootBinding()),
    GetPage(
        name: Routes.accounts,
        page: () => const AccountsPage(),
        binding: AccountsBinding()),
    GetPage(
        name: Routes.settings,
        page: () => const SettingsPage(),
        binding: SettingsBinding()),
  ];
}
