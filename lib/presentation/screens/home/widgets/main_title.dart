import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainTitle extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final String? lottie;
  final TextStyle? style;

  const MainTitle({
    super.key,
    required this.title,
    this.onPressed,
    this.lottie,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if(lottie != null) ...[
              LottieBuilder.asset(lottie!, width: SizeManager.s30, height: SizeManager.s30, fit: BoxFit.fill),
              const SizedBox(width: SizeManager.s5),
            ],
            Text(
              (StringsManager.value.contains(title) ? Methods.getText(title) : title).toTitleCase(),
              style: style ?? Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: SizeManager.s18,
                fontWeight: FontWeightManager.black,
                fontFamily: FontFamilyManager.poppins,
                color: ColorsManager.veryDarkBlue
              ),
            ),
          ],
        ),
        if(onPressed != null)
        // Row(
        //   children: [
        //     Text('More'),
        //     Container(
        //       child: IconButton(onPressed: () =>  onPressed, icon: Icon(Icons.keyboard_arrow_left,
        //       color: Colors.white,
        //       ),
        //
        //       ),
        //     )
        //   ],
        //
        // )
        CustomButton(
          onPressed: onPressed,
          buttonType: ButtonType.postImage,
          text: Methods.getText(StringsManager.more).toTitleCase(),
          imageName: IconsManager.arrowCircleLeft,
          imageColor: ColorsManager.shadowblue,
          textFontWeight: FontWeightManager.bold,
          fontSize: SizeManager.s18,
          imageSize: SizeManager.s18,
          padding: const EdgeInsets.symmetric(horizontal: SizeManager.s5),
          width: SizeManager.s0,
          height: SizeManager.s30,
          borderRadius: SizeManager.s5,
          buttonColor: Colors.transparent,
          textColor: ColorsManager.shadowblue,
          centerSpace: SizeManager.s5,
        ),
      ],
    );
  }
}