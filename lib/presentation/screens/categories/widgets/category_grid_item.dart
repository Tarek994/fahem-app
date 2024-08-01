import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:fahem_business/core/resources/routes_manager.dart';
import 'package:fahem_business/core/resources/strings_manager.dart';
import 'package:fahem_business/core/utilities/dialogs.dart';
import 'package:fahem_business/core/utilities/enums.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:fahem_business/core/network/api_constants.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:fahem_business/core/utilities/my_providers.dart';
import 'package:fahem_business/data/models/category_model.dart';
import 'package:fahem_business/presentation/shared/widgets/image_widget.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function onEdit;
  final Function onDelete;

  const CategoryGridItem({
    super.key,
    required this.categoryModel,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ImageWidget(
                    image: categoryModel.image,
                    imageDirectory: ApiConstants.categoriesDirectory,
                    width: SizeManager.s40,
                    height: SizeManager.s40,
                    boxShape: BoxShape.circle,
                    isShowFullImageScreen: true,
                  ),
                ),
                if(Methods.checkAdminPermission(AdminPermissions.editCategory) || Methods.checkAdminPermission(AdminPermissions.deleteCategory)) ...[
                  const SizedBox(width: SizeManager.s5),
                  CustomPopupMenu(
                    items: [
                      if(Methods.checkAdminPermission(AdminPermissions.editCategory)) PopupMenu.edit,
                      if(Methods.checkAdminPermission(AdminPermissions.deleteCategory)) PopupMenu.delete,
                    ],
                    onPressedEdit: () => Methods.routeTo(context, Routes.insertEditCategoryScreen, arguments: categoryModel, then: (category) => onEdit(category)),
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
          ),
          const SizedBox(width: SizeManager.s10),
          Text(
            MyProviders.appProvider.isEnglish ? categoryModel.nameEn : categoryModel.nameAr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}