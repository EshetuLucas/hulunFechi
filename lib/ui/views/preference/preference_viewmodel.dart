import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PreferenceViewModel extends BaseViewModel {
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
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
    AgerawiCategory,
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

  List<List<int>> _selectedIndex = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  List<List<int>> get selectedIndex => _selectedIndex;

  Future<void> onSelectPreference(int index) async {
    await onCategories(index);
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

  Future onPost() async {
    await _dialogService.showCustomDialog(
        variant: DialogType.SUCCESS,
        title: 'Saved',
        description: 'Your preferences are succesfully saved');
  }

  Future<void> onCategories(int index) async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        mainButtonTitle: 'Save',
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: _subLists[index]);
    if (result != null) {
      log.i(index);
      if (_selectedIndex[currentIndex].contains(index)) {
        if (result.data.isEmpty) _selectedIndex[currentIndex].remove(index);
      } else {
        if (result.data.isNotEmpty) _selectedIndex[currentIndex].add(index);
      }
      notifyListeners();
    }
    notifyListeners();
  }
}
