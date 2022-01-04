import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');

  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _eventService = locator<EventService>();

  Future<void> runStartupLogic() async {
    log.i('');

    _navigationService.replaceWith(Routes.homeView);
  }
}
