import 'package:better_accounting/pages/category/category_controller.dart';
import 'package:better_accounting/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "分类"),
      body: Container(),
    );
  }
}
