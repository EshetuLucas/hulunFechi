import 'package:hulunfechi/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TermsOfServiceWebViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final String url;

  TermsOfServiceWebViewModel(this.url);

  void onPageLoadingStart(String value) {
    setBusy(true);
  }

  void onPageLoadingFinish(String value) {
    setBusy(false);
  }

  void onBack() => _navigationService.back();
}
