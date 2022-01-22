import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends ReactiveViewModel {
  final log = getLogger('SavedEventsViewModel');
  final _navigationService = locator<NavigationService>();
  final _eventService = locator<EventService>();
  final _userService = locator<UserService>();
  User get _currentUser => _userService.currentUser;
  String get currentUserFirstName => _currentUser.firstname;
  String get currentUserLastName => _currentUser.lastname;
  String get currentUserDoB => _currentUser.dob ?? '';
  String get currentUserPhonNumber => _currentUser.phone ?? '';
  String get currentUserEmail => _currentUser.email;
  String get currentUserProfession => _currentUser.profession ?? '';
  String get currentUserCity => _currentUser.city ?? '';
  String get currentUserRegion => _currentUser.region ?? '';
  String get currentUserWoreda => _currentUser.woreda ?? '';
  String get currentUserSubCity => _currentUser.subcity ?? '';
  String get currentUserHouseNO => _currentUser.housenumber ?? '';
  String get currentUserSSN => _currentUser.ssn ?? '';
  String get currentUserFullName =>
      currentUserFirstName + ' ' + currentUserLastName;
  String get currentUserBankName => _currentUser.bank ?? '';
  String get currentUserAccountNO => _currentUser.account ?? '';

  List<Event> get savedEvents => _eventService.savedEvents;
  bool get hasSavedEvents => savedEvents.isNotEmpty;

  void onBack() {
    _navigationService.back();
  }

  Future<void> onPersonalInfoTap() async {
    await _navigationService.navigateTo(Routes.personalInfoView);
    notifyListeners();
  }

  Future<void> onAdressTap() async {
    final value = await _navigationService.navigateTo(Routes.addressView);
    notifyListeners();
  }

  Future<void> onBankDetail() async {
    final value = await _navigationService.navigateTo(Routes.bankDetailView);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}
