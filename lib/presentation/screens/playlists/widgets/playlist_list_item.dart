import 'package:fahem/core/network/api_constants.dart';
import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/core/utilities/my_providers.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_button.dart';
import 'package:fahem/presentation/shared/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:fahem/data/models/playlist_model.dart';

class PlaylistListItem extends StatelessWidget {
  final PlaylistModel playlistModel;
  final int index;

  const PlaylistListItem({
    super.key,
    required this.playlistModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xff5978a7),
            width: 5
        ),
        borderRadius: BorderRadius.circular(SizeManager.s20),
        image: DecorationImage(image: AssetImage(playlistModel.getLocalAssetPath(),
        ),
        fit:BoxFit.fill
        )
      ),
      child: Stack(
        children: [
          // Image.asset(
          //   playlistModel.getLocalAssetPath(),
          //   width: SizeManager.s100,
          //   height: SizeManager.s100,
          //   fit: BoxFit.fill,
          // ),
          // ImageWidget(
          //   image: playlistModel.image,
          //   imageDirectory: ApiConstants.playlistsDirectory,
          //   width: double.infinity,
          //   height: SizeManager.s150,
          //   borderRadius: SizeManager.s10,
          //   isShowFullImageScreen: false,
          // ),
          // Container(
          //   color: ColorsManager.black.withOpacity(0.5),
          //   width: double.infinity,
          //   height: SizeManager.s150,
          // ),
          // Image.asset(
          //   ImagesManager.lines3,
          //   width: double.infinity,
          //   height: SizeManager.s150,
          //   fit: BoxFit.fill,
          //   color: index % 2 == 0 ? ColorsManager.lightPrimaryColor : ColorsManager.lightSecondaryColor,
          // ),
          Padding(
            padding: const EdgeInsets.all(SizeManager.s10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   MyProviders.appProvider.isEnglish ? playlistModel.playlistNameEn : playlistModel.playlistNameAr,
                //   style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorsManager.white, fontWeight: FontWeightManager.semiBold),
                // ),
                // const SizedBox(height: SizeManager.s10),
                // Text(
                //   Methods.getWordStatusLabel(num: playlistModel.numberOfVideos, label: WordStatusLabel.video),
                //   style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorsManager.white, fontWeight: FontWeightManager.semiBold),
                // ),
                InkWell(
                  onTap:() {
                  Methods.routeTo(
                    context,
                    Routes.playlistDetailsScreen,
                    arguments: playlistModel,
                  );
                },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: ColorsManager.shadowblue,
                      borderRadius: BorderRadius.circular(35)
                    ),

                    child: Icon(Icons.play_arrow_sharp,
                      color: Color(0xff5978a7),
                      size: 35,
                    ),
                  ),
                ),
                // CustomButton(
                //   onPressed: () {
                //     Methods.routeTo(
                //       context,
                //       Routes.playlistDetailsScreen,
                //       arguments: playlistModel,
                //     );
                //   },
                //   buttonType: ButtonType.text,
                //   text: Methods.getText(StringsManager.watch).toCapitalized(),
                //   //buttonColor: index % 2 != 0 ? ColorsManager.lightPrimaryColor : ColorsManager.lightSecondaryColor,
                //   height: SizeManager.s35,
                //   buttonColor: ColorsManager.veryDarkBlue,
                //   textFontWeight: FontWeightManager.black,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}