import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutViewModel extends BaseViewModel {
  final log = getLogger('AboutViewModel');
  final _navigationService = locator<NavigationService>();

  void onBack() {
    _navigationService.back();
  }
}
