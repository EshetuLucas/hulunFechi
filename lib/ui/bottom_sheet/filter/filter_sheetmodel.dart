import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterSheetViewModel extends BaseViewModel {
  final log = getLogger('FilterSheetViewModel ');
  final NavigationService _navigationService = locator<NavigationService>();

  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  List<String> _tags = [
    'All Country',
    'All Platform',
    'All Category',
    'All sub-category'
  ];

  List<List<String>> _subLists = [
    All,
    All,
    AgerawiCategory,
    AgerawiSubCategory,
  ];

  List<String> get tags => _tags;
  List<String> getList(int index) {
    switch (index) {
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

  void updateTags(int index, String value) {
    _tags[index] = value;
    notifyListeners();
  }

  Future<void> onCategories(int index) async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: _subLists[index]);
    if (resut != null) {
      updateTags(index, _subLists[index][resut.data]);
    }
  }

  Future<void> onPickCountry() async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.COUNTRY_PICKER,
    );
    if (result != null) {
      updateTags(0, result.data.country.name);
    }
  }

  void onDone() {
    _navigationService.back();
  }
}
