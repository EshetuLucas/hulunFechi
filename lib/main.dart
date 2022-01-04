import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/ui/bottom_sheet/setup_bottom_sheet_ui.dart';
import 'package:hulunfechi/ui/dialog/setup_dialog_ui.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/views/home/home_view.dart';
import 'package:hulunfechi/ui/views/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ksStatusBarStyle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kcWhite,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: kcDarkGreyColor,
          ),
        ),
        // appBarTheme: Theme.of(context).appBarTheme.copyWith(
        //       backgroundColor: kcVeryLightGrey,
        //       systemOverlayStyle: SystemUiOverlayStyle(
        //           systemNavigationBarColor: kcAppBackgroundColor,
        //           statusBarBrightness: Brightness.light,
        //           systemNavigationBarDividerColor: kcAppBackgroundColor,
        //           systemNavigationBarIconBrightness: Brightness.light),
        //     ),
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: kcAppBackgroundColor,
            systemNavigationBarDividerColor: kcAppBackgroundColor,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light),
        child: HomeView(),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
