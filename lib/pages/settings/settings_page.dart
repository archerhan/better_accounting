import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_controller.dart';
import 'package:better_accounting/pages/category/category_binding.dart';
import 'package:better_accounting/pages/category/category_edit_page.dart';
import 'package:better_accounting/pages/settings/settings_controller.dart';
import 'package:better_accounting/services/mock_data_service.dart';
import 'package:better_accounting/services/setting_service.dart';
import 'package:better_accounting/utils/formatter.dart';
import 'package:better_accounting/widgets/custom_divider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: ListView(
        padding: EdgeInsets.only(top: 70.h, bottom: 120.h),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'settings_title'.tr,
              style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainTitle333),
            ),
          ),
          SizedBox(height: 20.h),
          _overviewCard(),
          _sectionTitle('settings_general'.tr),
          _tile(
            icon: Icons.translate,
            title: 'settings_language'.tr,
            value: _valueText(SettingService.instance.languageCode == 'en'
                ? 'settings_language_en'.tr
                : 'settings_language_zh'.tr),
            onTap: _pickLanguage,
          ),
          const CustomDivider(inset: 20),
          _tile(
            icon: Icons.category_outlined,
            title: 'category_setting'.tr,
            // 分类数量是异步读出来的, 要跟着刷新
            value: Obx(() => _valueText('settings_icon_count'
                .trParams({'count': controller.iconCount.string}))),
            onTap: () => Get.to(
              () => const CategoryEditPage(),
              binding: CategoryBinding(),
              transition: Transition.downToUp,
              curve: Curves.easeInOut,
            ),
          ),
          _sectionTitle('settings_data'.tr),
          _tile(
            icon: Icons.restart_alt,
            title: 'settings_reset_mock'.tr,
            subtitle: 'settings_reset_mock_desc'.tr,
            onTap: () => _confirmResetMockData(context),
          ),
          _sectionTitle('settings_about_section'.tr),
          _tile(
            icon: Icons.info_outline,
            title: 'settings_about'.tr,
            value: _valueText('v1.0.0'),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'Better记账',
              applicationVersion: '1.0.0',
              children: [
                SizedBox(height: 12.h),
                Text('settings_about_desc'.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _overviewCard() {
    final accounts = Get.find<AccountsController>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.brightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Obx(() {
        final summary = accounts.summary.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'settings_overview'.tr,
              style: TextStyle(fontSize: 13.sp, color: AppColors.mainWhite),
            ),
            SizedBox(height: 6.h),
            Text(
              '￥${formatMoney(summary.balance)}',
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainWhite),
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Flexible(
                    child: _overviewItem(
                        'accounts_expenses'.tr, formatMoney(summary.expenses))),
                SizedBox(width: 32.w),
                Flexible(
                    child: _overviewItem(
                        'accounts_income'.tr, formatMoney(summary.income))),
                SizedBox(width: 32.w),
                Flexible(
                    child: Obx(() => _overviewItem(
                        'settings_record_count'.tr,
                        controller.recordCount.string))),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _overviewItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.mainWhite)),
        SizedBox(height: 4.h),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainWhite),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 24.h, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.grey999),
      ),
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    Widget? value,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: Icon(icon, color: AppColors.primaryBlue, size: 22.w),
      title: Text(
        title,
        style: TextStyle(fontSize: 15.sp, color: AppColors.mainTitle333),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: TextStyle(fontSize: 12.sp, color: AppColors.grey999),
            ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ?value,
          SizedBox(width: 4.w),
          const Icon(Icons.chevron_right, color: AppColors.greyCCC),
        ],
      ),
    );
  }

  Widget _valueText(String text) => Text(
        text,
        style: TextStyle(fontSize: 13.sp, color: AppColors.grey999),
      );

  Future<void> _pickLanguage() async {
    final picked = await Get.bottomSheet<String>(
      SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            ListTile(
              title: Text('settings_language_zh'.tr),
              onTap: () => Get.back(result: 'zh_CN'),
            ),
            ListTile(
              title: Text('settings_language_en'.tr),
              onTap: () => Get.back(result: 'en'),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
      backgroundColor: AppColors.mainWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
    );
    if (picked == null) return;
    await SettingService.instance.changeLanguage(picked);
  }

  Future<void> _confirmResetMockData(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('settings_reset_mock'.tr),
        content: Text('settings_reset_mock_confirm'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('common_cancel'.tr),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('common_confirm'.tr),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await MockDataService.reset();
    await controller.refreshStats();
    BotToast.showText(text: 'settings_reset_mock_done'.tr);
  }
}
