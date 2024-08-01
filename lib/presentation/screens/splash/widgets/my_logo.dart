import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const MyLogo({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/fahemSTlogo.png',
      width: width ?? SizeManager.s100,
      height: height,
      color: Colors.white,
    );
  }
}
