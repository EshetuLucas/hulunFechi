// import 'package:flutter/material.dart';
// import 'package:jester/ui/shared/app_colors.dart';
// import 'package:jester/ui/shared/shared_styles.dart';
// import 'package:jester/ui/shared/ui_helpers.dart';

// List<BottomSheetActions> listBottomSheetActions = [
//   BottomSheetActions(
//     title: 'Continue with Facebook',
//     buttonColor: kcBlue,
//     imageName: 'facebook',
//     function: () {},
//   ),
//   BottomSheetActions(
//     title: 'Continue with Google',
//     buttonColor: kcWhite,
//     imageName: 'google',
//     function: () {},
//   ),
//   BottomSheetActions(
//     title: 'Continue with Apple',
//     buttonColor: kcDarkGreyColor,
//     imageName: 'apple',
//     function: () {},
//   ),
// ];

// class BottomSheetActions extends StatelessWidget {
//   final String title;
//   final String imageName;
//   final Color buttonColor;
//   final Function function;
//   const BottomSheetActions({
//     Key key,
//     this.title,
//     this.imageName,
//     this.buttonColor,
//     this.function,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: ButtonTheme(
//               minWidth: screenWidthFraction(context, dividedBy: 1),
//               height: 55,
//               child: RaisedButton(
//                 color: buttonColor,
//                 onPressed: function,
//                 child: ListTile(
//                   leading:
//                       Image.asset('assets/ui_helper_images/$imageName.png'),
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 22.0),
//                     child: Text(
//                       '$title',
//                       style: buttonColor == kcWhite
//                           ? ktsButtonTitleTextStyle
//                           : ktsButtonTitleTextStyleWhite,
//                     ),
//                   ),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
