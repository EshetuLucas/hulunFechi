import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String POST_BUSY_KEY = 'Post busy key';

class EntertainersViewModel extends FutureViewModel {
  final log = getLogger('EntertainersViewModel ');
  final NavigationService _navigationService = locator<NavigationService>();

  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  List<String> _tags = [
    'All Countries',
    'All Platforms',
  ];

  void setPostsBusy(bool value) {
    setBusyForObject(POST_BUSY_KEY, value);
  }

  List<String> get tags => _tags;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateTags(int index, String value) {
    _tags[index] = value;
    log.e(value);
    notifyListeners();
  }

  Future<void> makepostBusy() async {
    setPostsBusy(true);
    await Future.delayed(Duration(seconds: 1));
    setPostsBusy(false);
  }

  List<String> getList() {
    switch (currentIndex) {
      case 0:
        return All;
      case 1:
        return Belief;
      case 2:
        return Technology;
      case 3:
        return Knowledge;
      case 4:
        return Health;
      case 5:
        return Competition;
      case 6:
        return Law;
      case 7:
        return Finance;

      default:
        return All;
    }
  }

  Future<void> onAllCountries() async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: getList());
    if (resut != null) {
      updateTags(1, getList()[resut.data]);
    }
    await makepostBusy();
  }

  void onAddPost() {
    _navigationService.navigateTo(Routes.postView);
  }

  void setQucikFilterIndex(index) async {
    _currentIndex = index;
    updateTags(1, getList()[0]);
    notifyListeners();
    await makepostBusy();
  }

  Future<void> onFilter() async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.FILTER,
    );
    await makepostBusy();
  }

  @override
  Future<void> futureToRun() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
