import 'dart:convert';

import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  Future<void> runStartupLogic() async {
    log.i('');

    if (!_sharedPreferencesService.freshInstall &&
        _sharedPreferencesService.isUserLoggedIn) {
      User user = User.fromJson(
        jsonDecode(
          _sharedPreferencesService.getFromDisk('user'),
        ),
      );

      _userService.setCurrentuser(user: user);
      log.v(_userService.currentUser);
      try {
        _userService.updateUser(user: user);
      } catch (e) {
        _navigationService.clearStackAndShow(Routes.loginView);
      }
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }
  }
}
