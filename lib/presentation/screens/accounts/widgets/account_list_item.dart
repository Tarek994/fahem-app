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
import 'package:fahem/data/models/account_model.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_button.dart';
import 'package:fahem/presentation/shared/widgets/name_widget.dart';
import 'package:fahem/presentation/shared/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fahem/presentation/shared/widgets/image_widget.dart';

class AccountListItem extends StatelessWidget {
  final AccountModel accountModel;
  final int index;

  const AccountListItem({
    super.key,
    required this.accountModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeManager.s23),
      decoration: BoxDecoration(
        color: Colors.white,
        //color: index % 2 == 0 ? ColorsManager.lightPrimaryColor : ColorsManager.lightSecondaryColor,
        borderRadius: BorderRadius.circular(SizeManager.s10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(
                    context,
                    Routes.accountDetailsScreen,
                    arguments: accountModel,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ImageWidget(
                    image: accountModel.personalImage,
                    imageDirectory: ApiConstants.accountsDirectory,
                    defaultImage: ImagesManager.defaultAvatar,
                    width: SizeManager.s50,
                    height: SizeManager.s50,
                    boxShape: BoxShape.circle,
                    isShowFullImageScreen: false,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(SizeManager.s10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameWidget(
                        fullName: accountModel.fullName,
                        isFeatured: accountModel.isFeatured,
                        isSupportFeatured: true,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: ColorsManager.veryDarkBlue,
                          fontWeight: FontWeightManager.semiBold,
                          height: SizeManager.s1_8,
                        ),
                      ),
                      if(accountModel.jobTitle != null) ...[
                        const SizedBox(height: SizeManager.s5),
                        Text(
                          accountModel.jobTitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorsManager.veryDarkBlue, height: SizeManager.s1_5),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: SizeManager.s17),
                  RatingBar(numberOfStars: accountModel.rating),
                  // Text(
                  //   '${Methods.getText(StringsManager.overallRatingOf).toCapitalized()} ${Methods.getWordStatusLabel(num: accountModel.numberOfReviews, label: WordStatusLabel.user)}',
                  //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  //     color: ColorsManager.white,
                  //     fontSize: SizeManager.s10,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
           Center(
             child: Container(
               width: 173.3,
               height: 30,
               child: Divider(color: Color(0xff9ba9c7),
                              thickness: 1.2,
                         ),
             ),
           ),
          if(accountModel.tasks.isNotEmpty) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
               height: 25,
                width: 25,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Color(0xff5978A7),
        ),
                  child: Icon(CupertinoIcons.doc_text_fill, color: ColorsManager.white,
                    size: 15,
                  ),
                ),
                const SizedBox(width: SizeManager.s5),
                Expanded(
                  child: Wrap(
                    children: List.generate(accountModel.tasks.length > 3 ? 3 : accountModel.tasks.length, (index) {
                      return Text(
                        // '${accountModel.tasks[index]} ${index == accountModel.tasks.length-1 ? '' : '-'} ',
                        '${accountModel.tasks[index]} ${index == accountModel.tasks.length-1 ? '' : ''} ',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorsManager.veryDarkBlue, height: SizeManager.s1_8,
                            fontFamily: FontFamilyManager.poppins
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SizeManager.s10),
          ],
          if(accountModel.address != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xff5978A7),
                  ),

                  child: Icon(Icons.location_on, color: ColorsManager.white,
                    size: 15,
                  ),
                ),
                const SizedBox(width: SizeManager.s5),
                Expanded(
                  child: Text(
                    accountModel.address!,
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorsManager.veryDarkBlue, height: SizeManager.s1_8,
                        fontFamily: FontFamilyManager.poppins
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SizeManager.s10),
          ],
          if(accountModel.consultationPrice != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xff5978A7),
                    ),

                    child:Icon(Icons.attach_money_outlined, color: ColorsManager.white,
                      size: 20,
                    ),
                    ),
                const SizedBox(width: SizeManager.s5),
                Text(
                  '${Methods.getText(StringsManager.consultationPrice).toCapitalized()}: ${accountModel.consultationPrice} ${Methods.getText(StringsManager.egp).toUpperCase()}',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorsManager.veryDarkBlue,
                  fontFamily: FontFamilyManager.poppins
                  ),
                ),
              ],
            ),
            const SizedBox(height: SizeManager.s10),
          ],
          const SizedBox(height: SizeManager.s5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: SizeManager.s5,
                  runSpacing: SizeManager.s5,
                  children: List.generate(accountModel.features.length, (index) {
                    return Container(
                      padding: const EdgeInsets.all(SizeManager.s5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(SizeManager.s5),
                        border: Border.all(color: ColorsManager.white),
                      ),
                      child: Text(
                        accountModel.features[index],
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: ColorsManager.veryDarkBlue,
                          fontSize: SizeManager.s10,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: SizeManager.s10),
              // Column(
              //   children: [
              //     RatingBar(numberOfStars: accountModel.rating),
              //     const SizedBox(height: SizeManager.s10),
              //     // Text(
              //     //   '${Methods.getText(StringsManager.overallRatingOf).toCapitalized()} ${Methods.getWordStatusLabel(num: accountModel.numberOfReviews, label: WordStatusLabel.user)}',
              //     //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
              //     //     color: ColorsManager.white,
              //     //     fontSize: SizeManager.s10,
              //     //   ),
              //     // ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(height: SizeManager.s10),
          Center(
            child: CustomButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pushNamed(
                  context,
                  Routes.accountDetailsScreen,
                  arguments: accountModel,
                );
              },
              buttonType: ButtonType.text,
              text: Methods.getText(StringsManager.details,
              ).toUpperCase(),
              width: 140,
              height: SizeManager.s35,
              buttonColor: ColorsManager.veryDarkBlue,
              textColor: Colors.white,
              //textColor: index % 2 == 0 ? ColorsManager.lightSecondaryColor : ColorsManager.lightPrimaryColor,
              textFontWeight: FontWeightManager.black,
            ),
          ),
        ],
      ),
    );
  }
}