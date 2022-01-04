import 'package:hulunfechi/extensions/string_extensions.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  var log = getLogger('LoginViewModel');

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  String? _validationMessage;
  bool get enableLoginButton =>
      !phoneNumberValue.isNullOrEmpty && !passwordValue.isNullOrEmpty;

  String? get validationMessage => _validationMessage;

  bool _showValidation = false;
  bool get showValidation => _showValidation;

  bool get hasValidationError => _validationMessage != null;

  bool get phoneNumberFieldHasText =>
      _showValidation && phoneNumberValue.isNullOrEmpty;
  bool get passwordFieldHasText =>
      _showValidation && passwordValue.isNullOrEmpty;
  String? _apiValidationMessage;
  String? get apiValidationMessage => _apiValidationMessage;

  Future<void> login() async {
    _showValidation = true;
    notifyListeners();
    if (enableLoginButton) {
      try {
        setBusy(true);
        // await _userService.login(
        //     email: phoneNumberValue!, password: passwordValue!);
        navigateToHomeView();
      } catch (e) {
        log.e(e);
        // _apiValidationMessage = e.toString();
      }
      setBusy(false);
    }
  }

  Future<void> navigateToHomeView() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  void onBack() => _navigationService.back();

  // bool _validateEmail() {
  //   if (!EmailValidator.validate(emailValue!)) {
  //     _validationMessage = 'Please enter a valid email address to continue';
  //     notifyListeners();
  //     return false;
  //   }

  //   return true;
  // }

  void goBack() {
    _navigationService.back();
  }

  void onSignUp() {
    _navigationService.navigateTo(
      Routes.signUpView,
    );
  }

  void onForgotPassword() {
    log.i('');
  }

  @override
  void setFormStatus() {}
}
