import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:hulunfechi/ui/views/setting/setting_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'band_details_view.form.dart';
import 'package:hulunfechi/extensions/string_extensions.dart';

class BankDetailViewModel extends FormViewModel {
  final log = getLogger('PersonalInfoViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  User get _currentUser => _userService.currentUser;
  String get currentUserFirstName => _currentUser.firstname;
  String get currentUserLastName => _currentUser.lastname;
  String get currentUserFullName =>
      currentUserFirstName + ' ' + currentUserLastName;
  String get currentUserBankName => _currentUser.bank ?? '';
  String get currentUserAccountNO => _currentUser.account ?? '';
  void onBack() => _navigationService.back();

  @override
  void setFormStatus() {
    checkValidation();
  }

  Future<void> onSave() async {
    setBusy(true);

    User userToBeUpdated = _userService.currentUser.copyWith(
      bank: !bankNameValue.isNullOrEmpty ? bankNameValue! : currentUserBankName,
      account: !accountNoValue.isNullOrEmpty
          ? accountNoValue!
          : currentUserAccountNO,
    );

    try {
      await _userService.updateUser(user: userToBeUpdated);
    } catch (e) {
      setBusy(false);
      await _dialogService.showCustomDialog(
          variant: DialogType.ERROR,
          title: 'Something went wrong while Saving you changes',
          description: 'Please try again');
      return;
    }
    setBusy(false);

    await _dialogService.showCustomDialog(
        variant: DialogType.SUCCESS,
        title: 'Saved',
        description: 'Your changes are succesfully saved');
    _navigationService.clearTillFirstAndShowView(SettingView());
  }

  bool _enableSaveButton = false;
  bool get enableSaveButton => _enableSaveButton;
  void checkValidation() {
    if ((bankNameValue != currentUserAccountNO) ||
        (accountNoValue != currentUserAccountNO)) {
      _enableSaveButton = true;
    } else {
      _enableSaveButton = false;
    }
  }
}
