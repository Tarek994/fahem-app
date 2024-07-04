import 'dart:io';

import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/constants_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/dialogs.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/core/utilities/my_providers.dart';
import 'package:fahem/presentation/main/controllers/main_provider.dart';
import 'package:fahem/presentation/screens/authentication/controllers/authentication_provider.dart';
import 'package:fahem/presentation/shared/controllers/app_provider.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_button.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_full_loading.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_list_tile.dart';
import 'package:fahem/presentation/shared/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../shared/widgets/my_back_button.dart';

class MenuScreen extends StatelessWidget {

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, _) {
          return Consumer<AppProvider>(
            builder: (context, appProvider, _) {
              return CustomFullLoading(
                isShowLoading: authenticationProvider.isLoading,
                waitForDone: authenticationProvider.isLoading,
                isShowOpacityBackground: true,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text('Menu',
                      style: TextStyle(
                          color: ColorsManager.veryDarkBlue,
                          fontFamily: FontFamilyManager.poppins,
                          fontSize: 25
                      ),
                    ),
                    leading: MyBackButton(),

                  ),
                  body: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: <Widget>[
                              CustomListTile(
                                onTap: () => Methods.routeTo(
                                  context,
                                  Routes.userProfileScreen,
                                  arguments: MyProviders.authenticationProvider.currentUser,
                                  isMustLogin: true,
                                ),
                                text: StringsManager.profile,
                                icon: Icons.person_2_outlined,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                                         Padding(
                                           padding: const EdgeInsets.all(13.0),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             children: [
                                               Text('General Settings',
                                               style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.bold

                                               ),
                                               ),
                                             ],
                                           ),
                                         ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              //const Divider(height: SizeManager.s0, color: ColorsManager.grey, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () {
                                  Provider.of<MainProvider>(context, listen: false).changeBottomNavigationBarPages(context: context, page: BottomNavigationBarPages.transactions);
                                },
                                text: StringsManager.myTransactions,
                                icon: Icons.handshake_outlined,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                  color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () => Methods.routeTo(context, Routes.playlistsScreen),
                                text: StringsManager.videos,
                                icon: Icons.play_circle_outline,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                  color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () => Provider.of<MainProvider>(context, listen: false).changeBottomNavigationBarPages(context: context, page: BottomNavigationBarPages.wallet),
                                text: StringsManager.wallet,
                                icon: Icons.account_balance_wallet_rounded,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                  color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () => Methods.routeTo(context, Routes.jobsScreen),
                                text: StringsManager.jobs,
                                icon: Icons.work_rounded,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                  color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () => Methods.routeTo(
                                  context,
                                  Routes.chatRoomRoute,
                                  isMustLogin: true,
                                ),
                                text: StringsManager.help,
                                icon: Icons.question_answer_outlined,
                                // isTrailingArrow: true,
                                trailing: Image.asset(IconsManager.arrowCircleLeft, width: SizeManager.s32, height: SizeManager.s32,
                                  color: ColorsManager.veryDarkBlue,
                                ),
                              ),
                              const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              CustomListTile(
                                onTap: () => Methods.onChangeLanguage(),
                                text: StringsManager.language,
                                image: IconsManager.language,
                                trailingText: Methods.getText(MyProviders.appProvider.isEnglish ? StringsManager.english : StringsManager.arabic).toCapitalized(),
                              ),
                              //const Divider(height: SizeManager.s0, color: ColorsManager.grey, indent: SizeManager.s16, endIndent: SizeManager.s16),

                              //const Divider(height: SizeManager.s0, color: Colors.transparent, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (Platform.isAndroid) {
                                          Share.share(ConstantsManager.fahemPlayStoreUrl);
                                        }
                                        if (Platform.isIOS) {
                                          Share.share(ConstantsManager.fahemAppStoreUrl);
                                        }
                                      },
                                      child: Container(

                                        //color: ColorsManager.shadowblue ,
                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: SizeManager.s38,
                                              height: SizeManager.s38,
                                              // color: ColorsManager.shadowblue,
                                              decoration: BoxDecoration(
                                                color: ColorsManager.shadowblue,
                                                borderRadius: BorderRadius.circular(14)
                                              ),
                                              child: Icon(FontAwesomeIcons.share,
                                                size: SizeManager.s20,
                                                color: ColorsManager.veryDarkBlue,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(StringsManager.shareApp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        if (Platform.isAndroid) {
                                          await Methods.openUrl(url: ConstantsManager.fahemPlayStoreUrl);
                                        }
                                        if (Platform.isIOS) {
                                          await Methods.openUrl(url: ConstantsManager.fahemAppStoreUrl);
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: SizeManager.s38,
                                                height: SizeManager.s38,
                                                // color: ColorsManager.shadowblue,
                                                decoration: BoxDecoration(
                                                    color: ColorsManager.shadowblue,
                                                    borderRadius: BorderRadius.circular(14)
                                                ),
                                                child: Icon(Icons.star_rate, size: 24,
                                                color: ColorsManager.veryDarkBlue,
                                                )),
                                            SizedBox(width: 8),
                                            Text(StringsManager.rateApp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     CustomListTile(
                              //       onTap: () {
                              //         if(Platform.isAndroid) {Share.share(ConstantsManager.fahemPlayStoreUrl);}
                              //         if(Platform.isIOS) {Share.share(ConstantsManager.fahemAppStoreUrl);}
                              //       },
                              //       text: StringsManager.shareApp,
                              //       icon: FontAwesomeIcons.share,
                              //     ),
                              //     SizedBox(
                              //       width: 79,
                              //     ),
                              //     CustomListTile(
                              //       onTap: () async {
                              //         if(Platform.isAndroid) {await Methods.openUrl(url: ConstantsManager.fahemPlayStoreUrl);}
                              //         if(Platform.isIOS) {await Methods.openUrl(url: ConstantsManager.fahemAppStoreUrl);}
                              //       },
                              //       text: StringsManager.rateApp,
                              //       image: IconsManager.rating,
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: SizeManager.s16),
                              const Divider(
                              height: SizeManager.s0, color: ColorsManager.grey, indent: SizeManager.s16, endIndent: SizeManager.s16),
                              const SizedBox(height: SizeManager.s16),
                              if(MyProviders.authenticationProvider.currentUser != null) ...[
                                const Divider(height: SizeManager.s0, color: ColorsManager.grey, indent: SizeManager.s16, endIndent: SizeManager.s16),
                                CustomListTile(
                                  onTap: () {
                                    Dialogs.showBottomSheetConfirmation(context: context, message: Methods.getText(StringsManager.doYouWantToLogout).toCapitalized()).then((value) {
                                      if(value) MyProviders.authenticationProvider.logout(context);
                                    });
                                  },
                                  text: StringsManager.logout,
                                  image: IconsManager.logout,
                                  textColor: ColorsManager.red700,
                                  imageColor: ColorsManager.red700,
                                  fontWeight: FontWeightManager.bold,
                                ),
                              ],

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
                              //   child: CustomButton(
                              //     onPressed: () {
                              //       if(Platform.isAndroid) {Methods.openUrl(url: ConstantsManager.fahemBusinessPlayStoreUrl);}
                              //       if(Platform.isIOS) {Methods.openUrl(url: ConstantsManager.fahemAppStoreUrl);}
                              //     },
                              //     buttonType: ButtonType.preImage,
                              //     text: Methods.getText(StringsManager.registerInFahemBusiness).toTitleCase(),
                              //     imageName: ImagesManager.logo,
                              //     imageColor: ColorsManager.white,
                              //     width: double.infinity,
                              //     height: SizeManager.s35,
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(SizeManager.s16),
                                child: Column(
                                  children: [
                                    // const SocialMediaIcons(),
                                    // const SizedBox(height: SizeManager.s15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: SizeManager.s10,
                                            height: SizeManager.s25,
                                            decoration: BoxDecoration(
                                              color: Color(0xffB6C4E3),
                                              //borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () => Methods.routeTo(context, Routes.privacyPolicyScreen),
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.keyboard_arrow_right_outlined,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                           Text(
                                                            Methods.getText(StringsManager.privacyPolicy).toTitleCase(),
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ),
                                        const SizedBox(width: SizeManager.s17),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: SizeManager.s10,
                                            height: SizeManager.s25,
                                            decoration: BoxDecoration(
                                              color: Color(0xffB6C4E3),
                                              //borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () => Methods.routeTo(context, Routes.termsOfUseScreen),
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.keyboard_arrow_right_outlined,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          Methods.getText(StringsManager.termsOfUse).toTitleCase(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          ,
                                          // child: TextButton(
                                          //     onPressed: () => Methods.routeTo(context, Routes.privacyPolicyScreen),
                                          //     child: Text(Methods.getText(StringsManager.privacyPolicy).toTitleCase()),
                                          // style: ButtonStyle(
                                          //   backgroundColor: MaterialStateProperty.all(ColorsManager.shadowblue),
                                          //   foregroundColor: MaterialStateProperty.all(Colors.white),
                                          //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                                          //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          //     borderRadius: BorderRadius.circular(8),
                                          //   )),
                                          //   elevation: MaterialStateProperty.all(2),
                                          // )
                                          // ),
                                          // child: CustomButton(
                                          //   onPressed: () => Methods.routeTo(context, Routes.privacyPolicyScreen),
                                          //   buttonType: ButtonType.text,
                                          //   text: Methods.getText(StringsManager.privacyPolicy).toTitleCase(),
                                          //   buttonColor: ColorsManager.shadowblue,
                                          //   textColor: ColorsManager.white,
                                          //   width: SizeManager.s75,
                                          //   height: SizeManager.s25,
                                          //   imageName: IconsManager.arrowCircleLeft ,
                                          //   imageColor: Colors.black87,
                                          //   imageSize: SizeManager.s25,
                                          //
                                          // ),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: SizeManager.s15),
                                    // Text(
                                    //   '${Methods.getText(StringsManager.appVersion).toTitleCase()} ${MyProviders.appProvider.version}',
                                    //   style: Theme.of(context).textTheme.bodySmall,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}