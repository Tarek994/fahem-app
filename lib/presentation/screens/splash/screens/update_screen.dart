import 'package:fahem_business/core/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fahem_business/core/resources/assets_manager.dart';
import 'package:fahem_business/core/resources/constants_manager.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/core/resources/routes_manager.dart';
import 'package:fahem_business/core/resources/strings_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:fahem_business/core/utilities/dialogs.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_button.dart';

class UpdateScreen extends StatelessWidget {
  final bool isForceUpdate;

  const UpdateScreen({
    super.key,
    required this.isForceUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Dialogs.showBottomSheetConfirmation(context: context, message: Methods.getText(StringsManager.doYouWantToExitAnApp).toCapitalized()),
      child: Directionality(
        textDirection: Methods.getDirection(),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: SizeManager.s0,
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeManager.s16),
              child: Column(
                children: [
                  SvgPicture.asset(SvgManager.update, width: SizeManager.s200, height: SizeManager.s300),
                  const SizedBox(height: SizeManager.s20),
                  Text(
                    Methods.getText(StringsManager.updateApp).toTitleCase(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: SizeManager.s20, fontWeight: FontWeightManager.bold),
                  ),
                  const SizedBox(height: SizeManager.s10),
                  Text(
                    Methods.getText(StringsManager.updateMsg).toCapitalized(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: SizeManager.s1_8),
                  ),
                  const SizedBox(height: SizeManager.s30),
                  CustomButton(
                    onPressed: () async => await Methods.openUrl(url: ConstantsManager.fahemBusinessPlayStoreUrl),
                    buttonType: ButtonType.text,
                    text: Methods.getText(StringsManager.updateNow).toCapitalized(),
                    width: double.infinity,
                  ),
                  if(!isForceUpdate) const SizedBox(height: SizeManager.s10),
                  if(!isForceUpdate) CustomButton(
                    onPressed: () {
                      bool isLogged = CacheHelper.getData(key: CacheHelper.currentAccountIdKey) == null ? false : true;
                      Navigator.of(context).pushNamedAndRemoveUntil(isLogged ? Routes.splashScreen : Routes.loginScreen, (route) => false);
                    },
                    buttonType: ButtonType.text,
                    text: Methods.getText(StringsManager.updateLater).toCapitalized(),
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}