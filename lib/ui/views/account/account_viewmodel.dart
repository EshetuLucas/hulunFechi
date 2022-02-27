import 'dart:developer';

import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
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
  String get currentUserProfession => _userService.currentUser.profession ?? '';
  bool get hasUser => _userService.hasUser;
  User get currentUser => _userService.currentUser;

  String get userFullName => currentUser.firstname + ' ' + currentUser.lastname;

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        onPreference();
        break;
      case 1:
        onLanguage();
        break;
      case 2:
        onSavedEvents();
        break;
      case 3:
        onFollowingTap();
        break;
      case 4:
        onHelpCenter();
        break;
      case 5:
        onContactUs();
        break;

      case 6:
        onAbout();
        break;
      case 7:
        await onLogout();
        break;
      default:
    }
  }

  void onHelpCenter() {
    _navigationService.navigateTo(
      Routes.termsOfServiceWebView,
      arguments: TermsOfServiceWebViewArguments(
        url: 'https://www.africanpride.et/index.php/faq/',
        title: 'Help Center',
      ),
    );
  }

  void onContactUs() {
    _navigationService.navigateTo(
      Routes.termsOfServiceWebView,
      arguments: TermsOfServiceWebViewArguments(
          url: 'https://www.africanpride.et/index.php/contact/',
          title: 'Contact Us'),
    );
  }

  void onFollowingTap() {
    _navigationService.navigateTo(Routes.followingView);
  }

  Future<void> onCamera() async {
    log.i('');
    await _navigationService.navigateTo(
      Routes.profileUploadView,
    );
    notifyListeners();
  }

  Future<void> onPreference() async {
    _navigationService.navigateTo(Routes.preferenceView);
  }

  Future<void> onAbout() async {
    _navigationService.navigateTo(Routes.aboutView);
  }

  Future onLanguage() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.LANGUAGE,
    );
  }

  Future<void> onLogout() async {
    await _userService.logOut();
    await _navigationService.clearStackAndShow(Routes.loginView);
  }

  void onSavedEvents() {
    _navigationService.navigateTo(Routes.settingView);
  }

  void onSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  Future<void> onPersonalInfoTap() async {
    await _navigationService.navigateTo(Routes.personalInfoView);
    notifyListeners();
  }
}
