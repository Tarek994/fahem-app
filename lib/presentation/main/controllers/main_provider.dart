import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/core/utilities/my_providers.dart';
import 'package:fahem/presentation/screens/splash/widgets/my_logo.dart';
import 'package:fahem/splogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/utilities/dialogs.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';

import '../../screens/menu/menu_screen.dart';

class MainProvider with ChangeNotifier {

  BottomNavigationBarPages _currentPage = BottomNavigationBarPages.home;
  BottomNavigationBarPages get currentPage => _currentPage;
  setBottomNavigationBarPages(BottomNavigationBarPages page) => _currentPage = page;
  changeBottomNavigationBarPages({required BuildContext context, required BottomNavigationBarPages page}) {
    if(MyProviders.authenticationProvider.currentUser == null && (
        page == BottomNavigationBarPages.transactions || page == BottomNavigationBarPages.wallet
    )) {
      Dialogs.showBottomSheetConfirmation(
        context: context,
        message: Methods.getText(StringsManager.youMustLoginFirst).toCapitalized(),
      ).then((value) {
        if(value) {
          //Navigator.pushNamed(context, Routes.loginWithPhoneScreen);
          Navigator.push(context, MaterialPageRoute(builder: (context) => loginReg(),));
        }
      });
      return;
    }

    _currentPage = page;
    notifyListeners();
  }

  Widget getScreenTitle(BuildContext context) {
    if(_currentPage == BottomNavigationBarPages.home) {
      return const MyLogo(
        width: SizeManager.s70,
        height: SizeManager.s25,
      );
    }
    // if(_currentPage == BottomNavigationBarPages.search) {
    //   // return Container(
    //   //   width: double.infinity,
    //   //   color: ColorsManager.shadowblue,
    //   //
    //   //   child: Column(
    //   //     crossAxisAlignment: CrossAxisAlignment.start,
    //   //     children: [
    //   //       Container(
    //   //         width: double.infinity,
    //   //         height: 25,
    //   //         color: ColorsManager.shadowblue,
    //   //         child: Row(
    //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   //           children: [
    //   //             IconButton(
    //   //
    //   //                 onPressed: (){
    //   //                   Navigator.push(context,MaterialPageRoute(builder: (context) => MenuScreen()));
    //   //
    //   //                 }, icon: Image(image: AssetImage('assets/images/menulogo.png',),
    //   //               height: 25,
    //   //               width: 25,
    //   //               fit: BoxFit.fill,
    //   //             )
    //   //             ),
    //   //             Container(
    //   //               height: 40,
    //   //               width: 100,
    //   //               decoration: BoxDecoration(
    //   //                   image: DecorationImage(
    //   //                       image:AssetImage('assets/icons/fahemlogo.png'
    //   //                       ),
    //   //                       fit: BoxFit.cover
    //   //                   )
    //   //               ),
    //   //             ),
    //   //
    //   //             IconButton(
    //   //
    //   //                 onPressed: (){
    //   //                   Navigator.push(context,MaterialPageRoute(builder: (context) => MenuScreen()));
    //   //
    //   //                 }, icon: Image(image: AssetImage('assets/images/menulogo.png',),
    //   //               height: 25,
    //   //               color: Colors.transparent,
    //   //               width: 25,
    //   //               fit: BoxFit.fill,
    //   //             )
    //   //             ),
    //   //           ],
    //   //
    //   //         ),
    //   //       )
    //   //       // Text(
    //   //       //   Methods.getText(StringsManager.atYourService).toCapitalized(),
    //   //       //   style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeightManager.black,
    //   //       //   color: ColorsManager.veryDarkBlue
    //   //       //   ),
    //   //       // ),
    //   //       ,
    //   //       Text(
    //   //         Methods.getText(StringsManager.whatAreYouLookingFor).toCapitalized(),
    //   //         style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: SizeManager.s25, fontWeight: FontWeightManager.black,
    //   //         color: ColorsManager.veryDarkBlue,
    //   //         ),
    //   //       ),
    //   //     ],
    //   //   ),
    //   // );
    // }
    if(_currentPage == BottomNavigationBarPages.transactions) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Methods.getText(StringsManager.myTransactions).toCapitalized(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeightManager.black,
                fontSize: SizeManager.s24,
              ),
            ),
          ],
        ),
      );
    }
    if(_currentPage == BottomNavigationBarPages.wallet) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Methods.getText(StringsManager.myWallet).toCapitalized(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeightManager.black,
                fontSize: SizeManager.s24,
              ),
            ),
          ],
        ),
      );
    }
    // if(_currentPage == BottomNavigationBarPages.menu) {
    //   return Text(
    //     MyProviders.authenticationProvider.currentUser == null
    //         ? Methods.getText(StringsManager.menu).toCapitalized()
    //         : MyProviders.authenticationProvider.currentUser!.fullName,
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //       fontWeight: FontWeightManager.black,
    //       fontSize: SizeManager.s24,
    //     ),
    //   );
    // }
    return Container();
    // return Text(
    //   Methods.getText(_currentPage.title).toTitleCase(),
    //   textAlign: TextAlign.center,
    //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeightManager.medium),
    // );
  }

  Future<bool> onBackPressed({required BuildContext context, required AdvancedDrawerController advancedDrawerController}) async {
    if(advancedDrawerController.value.visible) {
      advancedDrawerController.hideDrawer();
      return Future.value(false);
    }
    else {
      if(_currentPage == BottomNavigationBarPages.home) {
        return await Dialogs.showBottomSheetConfirmation(context: context, message: Methods.getText(StringsManager.doYouWantToExitAnApp).toCapitalized());
      }
      else {
        changeBottomNavigationBarPages(context: context, page: BottomNavigationBarPages.home);
        return await Future.value(false);
      }
    }
  }
}