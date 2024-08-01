// import 'package:fahem_business/core/resources/colors_manager.dart';
// import 'package:fahem_business/core/resources/fonts_manager.dart';
// import 'package:fahem_business/core/resources/values_manager.dart';
// import 'package:flutter/material.dart';
//
// class CardInfo extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String? value;
//   final String? spacerText;
//   final String? spacerImage;
//   final Color? backgroundColor;
//   final Widget? child;
//
//   const CardInfo({
//     super.key,
//     required this.icon,
//     required this.title,
//     this.value,
//     this.spacerText,
//     this.spacerImage,
//     this.backgroundColor,
//     this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? ColorsManager.veryDarkBlue,
//         borderRadius: BorderRadius.circular(SizeManager.s10),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(SizeManager.s10),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(SizeManager.s10),
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: SizeManager.s3),
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(14)),
//                       child: Icon(icon,
//                           size: SizeManager.s14,
//                           color: ColorsManager.veryDarkBlue),
//                     ),
//                   ),
//                   const SizedBox(width: SizeManager.s10),
//                   Flexible(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         FittedBox(
//                           child: Text(
//                             title,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall!
//                                 .copyWith(
//                                     color: ColorsManager.white,
//                                     height: SizeManager.s1_8),
//                           ),
//                         ),
//                         child ??
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if (value != null)
//                                   Expanded(
//                                     child: Text(
//                                       value!,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(
//                                               height: SizeManager.s1_8,
//                                               color: Colors.white),
//                                     ),
//                                   ),
//                                 if (spacerText != null) ...[
//                                   const SizedBox(width: SizeManager.s5),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: SizeManager.s3),
//                                     child: Text(
//                                       spacerText!,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium!
//                                           .copyWith(
//                                               fontWeight:
//                                                   FontWeightManager.bold,
//                                               color: Colors.white),
//                                     ),
//                                   ),
//                                 ],
//                                 if (spacerImage != null) ...[
//                                   const SizedBox(width: SizeManager.s5),
//                                   Image.asset(spacerImage!,
//                                       width: SizeManager.s30),
//                                 ],
//                               ],
//                             )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final String? emailTitle;
  final String? emailValue;
  final Color? backgroundColor;
  final Widget? child;

  const CardInfo({
    Key? key,
    required this.icon,
    required this.title,
    this.value,
    this.emailTitle,
    this.emailValue,
    this.backgroundColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xf45978A7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (emailTitle != null && emailValue != null) ...[
              Text(
                emailTitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                emailValue!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child:
                      Icon(icon, size: 14, color: ColorsManager.veryDarkBlue),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Color(0xf4DEE7EF), fontSize: 8),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      if (value != null)
                        Text(
                          value!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white, fontSize: 12),
                        ),
                      if (child != null) child!,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
