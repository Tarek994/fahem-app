import 'package:fahem_dashboard/data/models/main_category_model.dart';
import 'package:flutter/material.dart';
import 'package:fahem_dashboard/core/network/api_constants.dart';
import 'package:fahem_dashboard/core/resources/colors_manager.dart';
import 'package:fahem_dashboard/core/resources/fonts_manager.dart';
import 'package:fahem_dashboard/core/resources/routes_manager.dart';
import 'package:fahem_dashboard/core/resources/strings_manager.dart';
import 'package:fahem_dashboard/core/resources/values_manager.dart';
import 'package:fahem_dashboard/core/utilities/dialogs.dart';
import 'package:fahem_dashboard/core/utilities/enums.dart';
import 'package:fahem_dashboard/core/utilities/extensions.dart';
import 'package:fahem_dashboard/core/utilities/methods.dart';
import 'package:fahem_dashboard/core/utilities/my_providers.dart';
import 'package:fahem_dashboard/presentation/shared/widgets/custom/custom_popup_menu.dart';
import 'package:fahem_dashboard/presentation/shared/widgets/image_widget.dart';

class MainCategoryListItem extends StatelessWidget {
  final MainCategoryModel mainCategoryModel;
  final Function onEdit;
  final Function onDelete;

  const MainCategoryListItem({
    super.key,
    required this.mainCategoryModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeManager.s10),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(SizeManager.s10),
      ),
      child: Row(
        children: [
          ImageWidget(
            image: mainCategoryModel.image,
            imageDirectory: ApiConstants.mainCategoriesDirectory,
            width: SizeManager.s40,
            height: SizeManager.s40,
            boxShape: BoxShape.circle,
            isShowFullImageScreen: true,
          ),
          const SizedBox(width: SizeManager.s10),
          Expanded(
            child: Text(
              MyProviders.appProvider.isEnglish ? mainCategoryModel.nameEn : mainCategoryModel.nameAr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium),
            ),
          ),
          const SizedBox(width: SizeManager.s10),
          if(Methods.checkAdminPermission(AdminPermissions.editMainCategory) || Methods.checkAdminPermission(AdminPermissions.deleteMainCategory)) ...[
            const SizedBox(width: SizeManager.s5),
            CustomPopupMenu(
              items: [
                if(Methods.checkAdminPermission(AdminPermissions.editMainCategory)) PopupMenu.edit,
                if(Methods.checkAdminPermission(AdminPermissions.deleteMainCategory)) PopupMenu.delete,
              ],
              onPressedEdit: () => Methods.routeTo(context, Routes.insertEditMainCategoryScreen, arguments: mainCategoryModel, then: (mainCategory) => onEdit(mainCategory)),
              onPressedDelete: () {
                Dialogs.showBottomSheetConfirmation(context: context, message: Methods.getText(StringsManager.areYouSureOfTheDeletionProcess).toCapitalized()).then((value) {
                  if(value) {
                    onDelete();
                  }
                });
              },
            ),
          ],
        ],
      ),
    );
  }
}