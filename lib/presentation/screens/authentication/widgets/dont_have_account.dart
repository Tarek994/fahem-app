import 'package:fahem_business/core/resources/routes_manager.dart';
import 'package:fahem_business/core/resources/strings_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/fonts_manager.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          Methods.getText(StringsManager.dontHaveAnAccountYet).toCapitalized(),
          style: TextStyle(
              fontFamily: FontFamilyManager.Poppins, color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Methods.routeTo(context, Routes.registerScreen);
          },
          style: TextButton.styleFrom(
            visualDensity: const VisualDensity(horizontal: -4),
            padding: const EdgeInsets.symmetric(horizontal: SizeManager.s5),
          ),
          child: Text(
            Methods.getText(StringsManager.newAccount).toUpperCase(),
            style: TextStyle(
                fontFamily: FontFamilyManager.Poppins, color: Colors.lightBlue),
          ),
        ),
      ],
    );
  }
}
