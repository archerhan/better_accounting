import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_page.dart';
import 'package:better_accounting/pages/category/category_page.dart';
import 'package:better_accounting/pages/root/root_controller.dart';
import 'package:better_accounting/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      floatingActionButton: _addBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Obx(() => IndexedStack(
            index: controller.activeIndex.value,
            children: const [AccountsPage(), SettingsPage()],
          )),
    );
  }

  Widget _addBtn() {
    return FloatingActionButton(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: AppColors.primaryBlue,
      onPressed: () {
        SystemSound.play(SystemSoundType.click);
        Get.to(const CategoryPage(),
            transition: Transition.downToUp, curve: Curves.easeInOut);
      },
      child: const Icon(
        CupertinoIcons.add,
        size: 40,
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() => AnimatedBottomNavigationBar(
          backgroundColor: AppColors.mainWhite,
          shadow: const Shadow(
              color: AppColors.greyCCC, offset: Offset(0, -3), blurRadius: 24),
          safeAreaValues: const SafeAreaValues(bottom: true),
          icons: const [
            CupertinoIcons.news_solid,
            CupertinoIcons.settings_solid
          ],
          iconSize: 40,
          activeColor: AppColors.primaryBlue,
          inactiveColor: AppColors.greyCCC,
          activeIndex: controller.activeIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 16,
          rightCornerRadius: 16,
          onTap: (index) {
            controller.activeIndex.value = index;
          },
        ));
  }
}
