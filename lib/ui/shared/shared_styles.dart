import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

// status bar
void ksStatusBarStyle(
    {Color statusBarColor = Colors.transparent,
    Brightness statusBarIconBrightness = Brightness.light}) {
  SystemChrome.setSystemUIOverlayStyle(
    (SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: kcAppBackgroundColor,
        systemNavigationBarDividerColor: kcAppBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.light)),
  );
}

// Box Decorations

BoxDecoration kdbFieldDecortaionLight = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration kdbFieldDecortaionDark =
    BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcMediumGrey);
// Card and Container shape
const RoundedRectangleBorder krrBoxBorderShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
  Radius.circular(10),
));
// Text Styles

const TextStyle ktsAppTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w600, color: kcWhite, fontSize: 28);
const TextStyle ktsMediumDarkTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: kcSecondaryColor, fontSize: 16);
const TextStyle ktsSmallDarkTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: kcSecondaryColor, fontSize: 15);
const TextStyle ktsBoldMeidumDarkTextStyle = const TextStyle(
    fontWeight: FontWeight.w700, color: kcSecondaryColor, fontSize: 16);
const TextStyle ktsSmallWhiteTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14);
const TextStyle ktsNameTitleDarkTextStyle = const TextStyle(
    fontWeight: FontWeight.w700, color: kcPrimaryColorDark, fontSize: 24);
const TextStyle ktsLightGreyMeidumTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: kcLightGrey, fontSize: 14);
const TextStyle ktsLightGreySmallTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: kcLightGrey, fontSize: 12);
const TextStyle ktsWhiteMediumTextStyle = const TextStyle(
    fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16);
const TextStyle ktsWhiteSmallTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14);
const TextStyle ktsDarkSmallTextStyle = const TextStyle(
    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 15);

const TextStyle ktsButtonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: kcWhite, fontSize: 18);
// const TextStyle ktsWhiteSmallTextStyle = const TextStyle(
//     fontWeight: FontWeight.w600,
//     color: Colors.white,
//
//     fontSize: 14);
// const TextStyle ktsDarkSmallTextStyle = const TextStyle(
//     fontWeight: FontWeight.w600,
//     color: Colors.black,
//
//     fontSize: 14);

const TextStyle ktsButtonTitleTextStyleWhite =
    const TextStyle(fontWeight: FontWeight.w700, color: kcWhite);

const TextStyle ktsDarkGreyTextStyle =
    const TextStyle(color: kcDarkGreyColor, fontSize: 18.0);
const TextStyle ktsGreenBoldTextStyle =
    const TextStyle(color: kcPrimaryColor, fontSize: 18.0);

const TextStyle ktsDarkGreyBoldTextStyle = const TextStyle(
    color: kcDarkGreyColor, fontSize: 26.0, fontWeight: FontWeight.w800);

const TextStyle ktsBoldTextStyle = const TextStyle(fontWeight: FontWeight.bold);

const TextStyle ktsVeryLightGreyBodyTextStyle =
    const TextStyle(color: kcVeryLightGrey, fontSize: 20);

const TextStyle ktsVeryGreyTitleTextStyle = const TextStyle(
    color: kcVeryLightGrey, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle ktsSignUpTextStyle = const TextStyle(color: kcPrimaryColor);

const TextStyle ktsMediumGreyTitleTextStyle = const TextStyle(
    color: kcMediumGrey, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle ktsLargDarkTextStyle = const TextStyle(
    color: kcPrimaryColorDark, fontSize: 18.0, fontWeight: FontWeight.w800);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);
const EdgeInsets appSymmetricEdgePadding = const EdgeInsets.symmetric(
  horizontal: 16,
);
const EdgeInsets appLeftEdgePadding = const EdgeInsets.only(
  left: 16,
);
const EdgeInsets commonHorizontalPadding10 =
    const EdgeInsets.symmetric(horizontal: 20);

// Future fetchPorfile(){
// GraphQlClient _client = _graph configuratin. myGraphClient()};
// if (result.hasExceiption){
// print (result.excption);
// else if (!result.hasException){
// print(result.dat)}}
// profileList = result.data['characters']['resuts'];
//  widget buldCharcter(int index){
// return RoundContainer(padding: Const EdgetInset.90,
// marigin )}
//
