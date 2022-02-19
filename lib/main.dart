import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/ui/bottom_sheet/setup_bottom_sheet_ui.dart';
import 'package:hulunfechi/ui/dialog/setup_dialog_ui.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/snack_bar/setup_snack_bar.dart';
import 'package:hulunfechi/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await ThemeManager.initialise();

  await Firebase.initializeApp();
  await setupLocator();
  setupSnackbarUi();
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
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: kcAppBackgroundColor,
            systemNavigationBarDividerColor: kcWhite,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: StartupView(),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
