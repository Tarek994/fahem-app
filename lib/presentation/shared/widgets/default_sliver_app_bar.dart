import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:fahem_business/presentation/shared/widgets/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultSliverAppBar extends StatelessWidget {
  final String? title;
  final String? customTitle;
  final Color appBarColor;
  final bool pinned;
  final Function()? onPressed;
  final Widget? bottom;
  final List<Widget>? actions;

  const DefaultSliverAppBar({
    super.key,
    this.title,
    this.customTitle,
    this.appBarColor = ColorsManager.white,
    this.pinned = true,
    this.onPressed,
    this.bottom,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appBarColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: appBarColor,
      pinned: pinned,
      centerTitle: true,
      leading: MyBackButton(onPressed: onPressed),
      title: customTitle != null
          ? Text(
              customTitle!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeightManager.semiBold, color: Colors.white),
            )
          : title == null
              ? null
              : Text(
                  Methods.getText(title!).toTitleCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeightManager.semiBold,
                      color: Colors.white),
                ),
      actions: [
        Image.asset(
          'assets/icons/fahemlogonoT.png',
          height: 25,
          width: 25,
        )
      ],
      bottom: bottom == null
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: appBarColor,
              title: bottom,
            ),
    );
  }
}
