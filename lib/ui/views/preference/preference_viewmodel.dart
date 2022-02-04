import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PreferenceViewModel extends BaseViewModel {
  final log = getLogger('PostViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _postService = locator<PostService>();

  List<Sector> get sectors => _postService.sectors;
  List<Platform> get platforms => _postService.platforms;
  List<Category> get categories => _postService.categories;
  List<Category?> get userCategories => _userService.currentUser.usercategories;
  List<String> _tags = [
    'All Countries',
    'Tilket',
  ];

  List<String> get tags => _tags;

  List<String> _categoriesTag = [
    'Category',
    'Sub Category',
  ];

  List<String> get categoriesTag => _categoriesTag;

  int _currentIndex = 0;
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
  List<Platform> get sectorPlatforms {
    return List.from(platforms
        .where((element) =>
            element.sectors != null &&
            element.sectors!.id == sectors[_currentIndex].id)
        .toList());
  }

  Future<void> onSelectPreference(int index) async {
    await onCategories(index);
  }

  void setQucikFilterIndex(index) {
    _currentIndex = index;
    updateTags(1, sectors[index].name);

    notifyListeners();
  }

  Future<void> onSave() async {
    List<Category> listToUpdate = [];
    setBusy(true);
    _selectedIndex.forEach((element) {
      if (element.isNotEmpty) {
        element.forEach((element) {
          listToUpdate.add(categories[element]);
        });
      }
    });

    User userToBeUpdated = _userService.currentUser
        .copyWith(usercategories: [...userCategories, ...listToUpdate]);

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
        description: 'Your preferences are succesfully saved');
  }

  Future<void> onCategories(int index) async {
    log.i('index:$index');
    final result = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        mainButtonTitle: 'Save',
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: List.from(categories)
            .where(
                (element) => element.platform!.id == sectorPlatforms[index].id)
            .toList());
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

  Future<void> onPickCountry() async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.COUNTRY_PICKER,
    );
    if (result != null) {
      updateTags(0, result.data.name);
    }
  }
}
