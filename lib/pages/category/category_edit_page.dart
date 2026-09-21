import 'package:better_accounting/constants/app_colors.dart';
import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 类别设置页.
///
/// 这里自己管一套 TabController/PageController, 不能和记账页共用,
/// 否则一个 PageController 会同时挂在两个 PageView 上, 翻页时会报错.
class CategoryEditPage extends StatefulWidget {
  const CategoryEditPage({super.key});

  @override
  State<CategoryEditPage> createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<CategoryController>();

  late final TabController _tabController;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "category_setting".tr,
        bottom: _categoryBar(),
      ),
      backgroundColor: AppColors.mainWhite,
      body: PageView(
        controller: _pageController,
        onPageChanged: _tabController.animateTo,
        children: [
          _iconGrid(controller.expensesList),
          _iconGrid(controller.incomeList),
        ],
      ),
    );
  }

  PreferredSize _categoryBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(48.h),
      child: SizedBox(
        width: 200.w,
        child: TabBar(
          tabs: [
            Tab(text: "accounts_expenses".tr),
            Tab(text: "accounts_income".tr),
          ],
          labelColor: AppColors.mainTitle333,
          labelStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          unselectedLabelColor: AppColors.grey999,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.h,
          indicatorColor: AppColors.primaryBlue,
          controller: _tabController,
          onTap: (index) => _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut),
        ),
      ),
    );
  }

  Widget _iconGrid(List<IconAssetModel> icons) {
    return Obx(() => GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) => _iconItem(icons[index]),
          itemCount: icons.length,
        ));
  }

  Widget _iconItem(IconAssetModel iconAssetModel) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          // 这里只是改选中项, 不弹键盘
          onTap: () => controller.selectIcon(iconAssetModel, openPanel: false),
          child: Obx(() => Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: controller.isSelected(iconAssetModel)
                      ? AppColors.primaryYellow.withValues(alpha: 0.7)
                      : AppColors.mainWhite,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  iconAssetModel.assetPath,
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.contain,
                ),
              )),
        ),
        SizedBox(height: 8.h),
        Text(
          iconAssetModel.name.tr,
          style: TextStyle(color: AppColors.mainTitle333, fontSize: 13.sp),
        )
      ],
    );
  }
}
