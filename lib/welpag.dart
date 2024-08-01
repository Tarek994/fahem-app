import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/presentation/screens/splash/widgets/my_logo.dart';
import 'package:flutter/material.dart';

import 'core/resources/routes_manager.dart';
import 'core/utilities/methods.dart';

class welp extends StatefulWidget {
  const welp({Key? key}) : super(key: key);

  @override
  State<welp> createState() => _welpState();
}

class _welpState extends State<welp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.veryDarkBlue,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyLogo(
              height: 150,
              width: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Legal solutions for business\n and individual needs',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontFamilyManager.PoppinsB,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () {
                      Methods.routeTo(context, Routes.languageScreen,
                          isPushReplacement: true);
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Color(0xff5978A7),
                      size: 50,
                    )),
                SizedBox(
                  height: 95,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
