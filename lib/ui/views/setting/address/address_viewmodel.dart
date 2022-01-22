import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:hulunfechi/ui/views/setting/setting_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'address_view.form.dart';
import 'package:hulunfechi/extensions/string_extensions.dart';

class AddressViewModel extends FormViewModel {
  final log = getLogger('PersonalInfoViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  User get _currentUser => _userService.currentUser;
  String get currentUserCity => _currentUser.city ?? '';
  String get currentUserRegion => _currentUser.region ?? '';
  String get currentUserWoreda => _currentUser.woreda ?? '';
  String get currentUserSubCity => _currentUser.subcity ?? '';
  String get currentUserHouseNO => _currentUser.housenumber ?? '';
  String get currentUserSSN => _currentUser.ssn ?? '';
  String get currentUserCountry => _currentUser.country ?? '';
  void onBack() => _navigationService.back();

  @override
  void setFormStatus() {
    checkValidation();
  }

  Future<void> onSave() async {
    setBusy(true);

    User userToBeUpdated = _userService.currentUser.copyWith(
        city: !cityValue.isNullOrEmpty ? cityValue! : currentUserCity,
        region: !regionValue.isNullOrEmpty ? regionValue! : currentUserRegion,
        woreda: !woredaValue.isNullOrEmpty ? woredaValue! : currentUserWoreda,
        subcity:
            !subcityValue.isNullOrEmpty ? subcityValue! : currentUserSubCity,
        housenumber:
            houseNOValue.isNullOrEmpty ? houseNOValue! : currentUserHouseNO,
        ssn: !ssnValue.isNullOrEmpty ? ssnValue! : currentUserSSN,
        country:
            !countryValue.isNullOrEmpty ? countryValue : currentUserCountry);

    try {
      await _userService.updateUser(user: userToBeUpdated);
      notifyListeners();
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
    if (countryValue != currentUserCountry ||
        cityValue != currentUserCity ||
        regionValue != currentUserRegion ||
        woredaValue != currentUserWoreda ||
        subcityValue != currentUserCity ||
        houseNOValue != currentUserHouseNO ||
        ssnValue != currentUserSSN) {
      _enableSaveButton = true;
    } else {
      _enableSaveButton = false;
    }
  }
}
