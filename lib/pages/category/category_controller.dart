import 'package:better_accounting/pages/accounts/accounts_model.dart';
import 'package:better_accounting/services/isar_service.dart';
import 'package:better_accounting/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class CategoryController extends GetxController {
  var iconList = <IconAssetModel>[].obs;
  var currentSelectedIcon = IconAssetModel().obs;

  @override
  void onInit() async {
    await loadIconAssetsFronDB();
    super.onInit();
  }

  Future loadIconAssetsFronDB() async {
    iconList.value =
        await IsarService.instance.isar.iconAssetModels.where().findAll();
  }

  void selectIcon(IconAssetModel iconAssetModel) {
    currentSelectedIcon.value = iconAssetModel;
    iconList.value = iconList.map<IconAssetModel>((element) {
      element.isSelected = false;
      if (element.id == iconAssetModel.id) {
        element.isSelected = true;
      }
      return element;
    }).toList();
  }
}
