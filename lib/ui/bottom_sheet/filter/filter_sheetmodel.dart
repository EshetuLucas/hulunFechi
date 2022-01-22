import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/snackbar_type.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterSheetViewModel extends BaseViewModel {
  final log = getLogger('FilterSheetViewModel ');
  final NavigationService _navigationService = locator<NavigationService>();
  final _userService = locator<PostService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackbarService = locator<SnackbarService>();

  List<String> _tags = [
    'All Country',
    'All Platform',
    'All Category',
    'All sub-category'
  ];
  List<Sector> get sectors =>
      [Sector(id: -1, name: 'All'), ..._userService.sectors];
  List<Platform> get platforms =>
      [Platform(id: -1, name: 'All Platform'), ..._userService.platforms];
  List<Category> get categories => _userService.categories;
  List<SubCategory> get subCategories => _userService.subCategories;

  List<List<dynamic>> get _subLists => [
        All,
        platforms,
        categories,
        subCategories,
      ];

  List<String> get tags => _tags;

  void updateTags(int index, String value) {
    _tags[index] = value;
    notifyListeners();
  }

  Filter filterList = Filter();

  Future<void> onCategories(int index) async {
    log.i('index:$index');
    if (index == 2 && _tags[1] == 'All Platform') {
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.BASIC,
        message: 'Please select platform',
        duration: const Duration(seconds: 2),
      );
      notifyListeners();
      return;
    }
    if (index == 3 && _tags[2] == 'All Category') {
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.BASIC,
        message: 'Please select category',
        duration: const Duration(seconds: 2),
      );
      notifyListeners();
      return;
    }
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.EVENT_MORE_TYPE,
      customData: _subLists[index],
    );
    if (resut != null) {
      int id = _subLists[index][resut.data].id;
      switch (index) {
        case 0:
          filterList = filterList.copyWith(
              countryName: _subLists[index][resut.data].name);
          break;
        case 1:
          filterList = filterList.copyWith(platformId: id);
          break;
        case 2:
          filterList = filterList.copyWith(categoryId: id);
          break;
        case 3:
          filterList = filterList.copyWith(platformId: id);
          break;

        default:
      }
      updateTags(index, _subLists[index][resut.data].name);
    }
  }

  Future<void> onPickCountry() async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.COUNTRY_PICKER,
    );
    if (result != null) {
      filterList = filterList.copyWith(countryName: result.data.name);
      updateTags(0, result.data.name);
    }
  }

  void onDone() {
    log.v(filterList);
    _navigationService.back(result: SheetResponse(data: filterList));
  }
}
