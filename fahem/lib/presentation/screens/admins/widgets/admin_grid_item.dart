import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/presentation/shared/widgets/hover.dart';
import 'package:flutter/material.dart';
import 'package:fahem/core/network/api_constants.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/dialogs.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/data/models/admin_model.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_popup_menu.dart';
import 'package:fahem/presentation/shared/widgets/image_widget.dart';
import 'package:fahem/presentation/shared/widgets/name_widget.dart';

class AdminGridItem extends StatelessWidget {
  final AdminModel adminModel;
  final Function onEdit;
  final Function onDelete;

  const AdminGridItem({
    super.key,
    required this.adminModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Hover(
      onTap: () {
        FocusScope.of(context).unfocus();
        Methods.routeTo(context, Routes.adminProfileScreen, arguments: adminModel);
      },
      child: Row(
        children: [
          ImageWidget(
            image: adminModel.personalImage,
            imageDirectory: ApiConstants.adminsDirectory,
            defaultImage: ImagesManager.defaultAvatar,
            width: SizeManager.s40,
            height: SizeManager.s40,
            boxShape: BoxShape.circle,
            isShowFullImageScreen: false,
          ),
          const SizedBox(width: SizeManager.s10),
          Expanded(
            child: NameWidget(
              fullName: adminModel.fullName,
              // isOverflow: true,
              maxLines: 2,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          if(Methods.checkAdminPermission(AdminPermissions.editAdmin) || Methods.checkAdminPermission(AdminPermissions.deleteAdmin)) ...[
            const SizedBox(width: SizeManager.s5),
            CustomPopupMenu(
              items: [
                if(Methods.checkAdminPermission(AdminPermissions.editAdmin)) PopupMenu.edit,
                if(Methods.checkAdminPermission(AdminPermissions.deleteAdmin)) PopupMenu.delete,
              ],
              onPressedEdit: () => Methods.routeTo(context, Routes.insertEditAdminScreen, arguments: adminModel, then: (admin) => onEdit(admin)),
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