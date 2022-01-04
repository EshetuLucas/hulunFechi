import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/utils/date_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostViewModel extends BaseViewModel {
  final log = getLogger('PostViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  List<String> _tags = [
    'All Countries',
    'Tilket',
  ];

  List<String> get tags => _tags;

  List<String> _categoriesTag = [
    'Category',
    'Sub Category',
  ];

  List<List<String>> _subLists = [
    AgerawiCategory,
    AgerawiSubCategory,
  ];

  List<String> get categoriesTag => _categoriesTag;

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  void updateTags(int index, String value) {
    _tags[index] = value;

    notifyListeners();
  }

  void onBack() => _navigationService.back();

  void updateCategoryTags(int index, String value) {
    _categoriesTag[index] = value;

    notifyListeners();
  }

  List<String> getList() {
    switch (currentIndex) {
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
  }

  void setQucikFilterIndex(index) {
    _currentIndex = index;
    updateTags(1, getList()[0]);
    notifyListeners();
  }

  Future<void> onCategories(int index) async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: _subLists[index]);
    if (resut != null) {
      updateCategoryTags(index, _subLists[index][resut.data]);
    }
  }

  DateTime? _selectedDate;
  DateTime? get selectedTime => _selectedDate;
  Future<void> onExpireDate() async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.DATE_PICKER,
    );
    if (result != null) {
      _selectedDate = result.data;

      notifyListeners();
    }
  }

  Future onPost() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.SUCCESS,
    );
    onBack();
  }
}
