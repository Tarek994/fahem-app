import 'package:countup/countup.dart';
import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:fahem_business/core/resources/constants_manager.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final double number;
  final Color backgroundColor;
  final Color textColor;

  const StatisticItem({
    super.key,
    required this.title,
    required this.number,
    this.backgroundColor = ColorsManager.white,
    this.textColor = ColorsManager.veryDarkBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(SizeManager.s10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: ColorsManager.veryDarkBlue,
                borderRadius: BorderRadius.circular(14)),
            child: FittedBox(
              child: Countup(
                begin: 0,
                end: number,
                duration: const Duration(
                    milliseconds: ConstantsManager.countupDuration),
                separator: ',',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeightManager.bold,
                    ),
              ),
            ),
          ),
          const SizedBox(width: SizeManager.s10),
          FittedBox(
            child: Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: textColor, fontWeight: FontWeightManager.medium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
