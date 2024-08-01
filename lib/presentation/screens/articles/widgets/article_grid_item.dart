import 'package:fahem_business/core/network/api_constants.dart';
import 'package:fahem_business/core/resources/routes_manager.dart';
import 'package:fahem_business/core/resources/strings_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:fahem_business/core/utilities/dialogs.dart';
import 'package:fahem_business/core/utilities/enums.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:fahem_business/presentation/shared/widgets/views_widget.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_popup_menu.dart';
import 'package:fahem_business/presentation/shared/widgets/hover.dart';
import 'package:flutter/material.dart';
import 'package:fahem_business/data/models/article_model.dart';
import 'package:fahem_business/core/utilities/my_providers.dart';
import 'package:fahem_business/presentation/shared/widgets/date_widget.dart';
import 'package:fahem_business/presentation/shared/widgets/image_widget.dart';

class ArticleGridItem extends StatelessWidget {
  final ArticleModel articleModel;
  final Function onEdit;
  final Function onDelete;

  const ArticleGridItem({
    super.key,
    required this.articleModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Hover(
      onTap: () {
        FocusScope.of(context).unfocus();
        Methods.routeTo(context, Routes.articleDetailsScreen, arguments: articleModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageWidget(
                image: articleModel.image,
                imageDirectory: ApiConstants.articlesDirectory,
                width: double.infinity,
                height: SizeManager.s100,
                borderRadius: SizeManager.s10,
                isShowFullImageScreen: false,
              ),
              PositionedDirectional(
                top: 10,
                end: 10,
                child: ViewsWidget(views: articleModel.views),
              ),
            ],
          ),
          const SizedBox(height: SizeManager.s10),
          Row(
            children: [
              Expanded(
                child: Text(
                  MyProviders.appProvider.isEnglish ? articleModel.titleEn : articleModel.titleAr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(width: SizeManager.s10),
              if(Methods.checkAdminPermission(AdminPermissions.editArticle) || Methods.checkAdminPermission(AdminPermissions.deleteArticle)) ...[
                const SizedBox(width: SizeManager.s5),
                CustomPopupMenu(
                  items: [
                    if(Methods.checkAdminPermission(AdminPermissions.editArticle)) PopupMenu.edit,
                    if(Methods.checkAdminPermission(AdminPermissions.deleteArticle)) PopupMenu.delete,
                  ],
                  onPressedEdit: () => Methods.routeTo(context, Routes.insertEditArticleScreen, arguments: articleModel, then: (article) => onEdit(article)),
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
          const SizedBox(height: SizeManager.s10),
          SizedBox(
            width: double.infinity,
            child: Text(
              MyProviders.appProvider.isEnglish ? articleModel.articleEn : articleModel.articleAr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(height: SizeManager.s1_8),
            ),
          ),
          const SizedBox(height: SizeManager.s10),
          const Spacer(),
          DateWidget(createdAt: articleModel.createdAt),
        ],
      ),
    );
  }
}