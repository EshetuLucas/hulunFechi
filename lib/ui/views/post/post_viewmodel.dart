import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/enums/snackbar_type.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:hulunfechi/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'post_view.form.dart';
import 'package:hulunfechi/extensions/string_extensions.dart';
import 'package:stacked_services/stacked_services.dart';

class PostViewModel extends FormViewModel {
  final log = getLogger('PostViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

  final _postService = locator<PostService>();
  final _snackbarService = locator<SnackbarService>();

  void setDatas() {
    log.e(categories);
    for (Platform platform in platforms) {
      if (platform.sectors != null) if (platform.sectors!.id ==
          sectors[_currentIndex].id) {
        _selectedPlatform = platform;
        break;
      }
    }
    _tags = [
      'All Countries',
      _selectedPlatform.name,
    ];
  }

  late List<String> _tags;

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

  List<Sector> get sectors => _postService.sectors;
  List<Platform> get platforms =>
      [Platform(id: -1, name: 'All Platform'), ..._postService.platforms];
  List<Category> get categories => _postService.categories;
  List<SubCategory> get subCategories => _postService.subCategories;

  List<List<dynamic>> get _subLists => [
        categories,
        subCategories,
      ];

  void onBack() => _navigationService.back();

  void updateCategoryTags(int index, String value) {
    _categoriesTag[index] = value;

    notifyListeners();
  }

  late Platform _selectedPlatform;
  List<Platform> get sectorPlatforms {
    return List.from(platforms
        .where((element) =>
            element.sectors != null &&
            element.sectors!.id == sectors[_currentIndex].id)
        .toList());
  }

  late Category _selectedCategory;
  List<Category> get platformCategories {
    return List.from(categories
        .where((element) => element.platform!.id == _selectedPlatform.id)
        .toList());
  }

  late SubCategory _selectedSubCategory;
  List<Category> get platformSubCategories {
    return List.from(subCategories
        .where((element) => element.category!.id == _selectedCategory.id)
        .toList());
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

  Future<void> onAllCountries() async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: sectorPlatforms);
    if (resut != null) {
      _selectedPlatform = sectorPlatforms[resut.data];
      updateTags(1, sectorPlatforms[resut.data].name);
    }
  }

  void setQucikFilterIndex(index) {
    _currentIndex = index;
    updateTags(1, sectors[index].name);
    notifyListeners();
  }

  Future<void> onCategories(int index) async {
    log.i('');
    if (index == 1 && _categoriesTag[0] == 'Category') {
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.BASIC,
        message: 'Please select category',
        duration: const Duration(seconds: 2),
      );
      notifyListeners();
      return;
    }
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: _subLists[index]);
    if (resut != null) {
      if (index == 0)
        _selectedCategory = _subLists[index][resut.data];
      else {
        _selectedSubCategory = _subLists[index][resut.data];
      }
      updateCategoryTags(index, _subLists[index][resut.data].name);
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

  String _validationMessage = '';
  String get validationMessage => _validationMessage;

  Future<void> onPost() async {
    if (subjectValue.isNullOrEmpty) {
      _validationMessage = "Title can't be null";
      notifyListeners();
      return;
    }
    if (bodyValue.isNullOrEmpty) {
      _validationMessage = "Body can't be null";
      notifyListeners();
      return;
    }
    if (_tags[0] == 'All Countries') {
      _validationMessage = "Please select country";
      notifyListeners();
      return;
    }
    if (_categoriesTag[0] == 'Category') {
      _validationMessage = "Please select Category";
      notifyListeners();
      return;
    }
    if (_categoriesTag[1] == 'Sub Category') {
      _validationMessage = "Please select Sub Category";
      notifyListeners();
      return;
    }
    PostForm post = PostForm(
      title: subjectValue!,
      description: bodyValue!,
      user: {'id': _userService.currentUser.id},
      expire: '',
      sectors: {
        'id': sectors[_currentIndex].id,
      },
      platform: {
        'id': _selectedPlatform.id,
      },
      category: {
        'id': _selectedCategory.id,
      },
      subCategory: {
        'id': _selectedSubCategory.id,
      },
      country: {'id': 1},
    );

    log.v(post.toJson());
    setBusy(true);

    try {
      await _postService.postPost(post: post);
      await _dialogService.showCustomDialog(
        variant: DialogType.SUCCESS,
      );
      await _navigationService.clearStackAndShow(Routes.homeView);
    } catch (e) {
      setBusy(false);
      log.e(e.toString());
      await _dialogService.showCustomDialog(
          variant: DialogType.ERROR,
          title: 'Something went wrong while creating you post',
          description: 'Please try again');
    }
    setBusy(false);
  }

  @override
  void setFormStatus() {}
}
