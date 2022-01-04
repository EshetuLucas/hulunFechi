import 'dart:developer';

import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends BaseViewModel {
  final log = getLogger('AccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

  bool get hasUser => _userService.hasUser;

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        break;
      case 1:
        onLanguage();
        break;
      case 2:
        onSavedEvents();
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        await onLogout();
        break;
      default:
    }
  }

  Future onLanguage() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.LANGUAGE,
    );
  }

  Future<void> onLogout() async {
    await _navigationService.clearStackAndShow(Routes.loginView);
  }

  void onSavedEvents() {
    _navigationService.navigateTo(Routes.settingView);
  }

  void onSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
