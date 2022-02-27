import 'package:dio/dio.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class DioExceptions {
  final log = getLogger('DioExceptions');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
    final _sharedPreferencesService = locator<SharedPreferencesService>();
  // This function will parse the dio exception and retruns exception string accordingly
  // We should add more exception handling methods like returning, exception methods base on error code.
  // We can't use response package right now because the owners did not moved the package to the null safty right now
  // We need to test this as we go deploy the new apk.
  String getExceptionMessage(DioError e) {
    log.e(e);
    if (e.type == DioErrorType.response) {
      if (e.response?.statusCode == 401 && _userService.hasUser &&!_sharedPreferencesService.freshInstall &&
        _sharedPreferencesService.isUserLoggedIn) {
        _userService.logOut();
        _navigationService.clearStackAndShow(Routes.loginView);
      }
      print(e.response);

      return e.response?.data['message'] ?? '';
    } else if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      return 'Check your connection';
    } else if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      return 'Unable to connect to the server. Try Again';
    } else {
      print('Something went wrong');
      return 'Something went wrong. Try Again';
    }
  }

  int checkMiddleElement(var array) {
    int arrayLength = array.length;
    if (array.isEmpty) {
      return 0;
    } else if (arrayLength == 1) {
      return 1;
    } else if (arrayLength % 2 == 0) {
      return 0;
    } else {
      int middleIndex = arrayLength / 2 as int;
      int middleElement = array[arrayLength / 2 as int];
      for (int i = 0; i < arrayLength; i++) {
        int element = array[i];
        if (i == middleIndex) {
          continue;
        } else if (element < middleElement) {
          return 0;
        }
      }
      return 1;
    }
  }
}
