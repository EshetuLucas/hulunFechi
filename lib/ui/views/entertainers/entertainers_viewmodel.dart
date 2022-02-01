import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';

import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String POST_BUSY_KEY = 'Post busy key';

class EntertainersViewModel extends FutureViewModel<List<Post>> {
  final log = getLogger('EntertainersViewModel ');

  final _userService = locator<UserService>();
  final _postService = locator<PostService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  String _allPlatforms = 'All Platforms';
  List<String> _tags = [
    'All Countries',
    'All Platforms',
  ];

  void setPostsBusy(bool value) {
    setBusyForObject(POST_BUSY_KEY, value);
  }

  int get userId => _userService.currentUser.id;

  List<String> get tags => _tags;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  int _categoryIndex = -1;
  int _subcategoryIndex = -1;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isSearchActive = false;
  bool get isSearchActive => _isSearchActive;

  bool get busyHeader => _postService.sectors.isEmpty && isBusy;
  String _searchKeyWord = '';
  String _currentPlatform = 'All Platforms';
  void setCurrentPlatform(String platform) => _currentPlatform = platform;

  String _currentCountry = 'All Countries';
  void setCurrentCountry(String country) => _currentCountry = country;

  List<Post> _listOnScreen = [];
  List<Post> get listOnScreen => _listOnScreen;
  void setListOnScreen() {
    if (_searchKeyWord.isNotEmpty) {
      setCurrentCountry('All Countries');
      setCurrentPlatform('All Platforms');
      _currentIndex = 0;
      if (_searchKeyWord.isNotEmpty) {
        _listOnScreen = List.from(_posts.reversed
            .where(
              (element) =>
                  element.user.firstname.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ) ||
                  element.title.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ) ||
                  element.description.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ),
            )
            .toList());
      }
    } else
      _listOnScreen = List.from(
        _posts.reversed
            .where(
              (element) =>
                  (_currentIndex == 0 ||
                      element.sectors?.id == sectors[_currentIndex].id) &&
                  (_currentCountry == "All Countries" ||
                      element.country?.name == _currentCountry) &&
                  (_currentPlatform == _allPlatforms ||
                      element.platform?.id ==
                          sectorPlatforms[_selectedPlatformIndex == 0
                                  ? 0
                                  : _selectedPlatformIndex]
                              .id) &&
                  (_categoryIndex == -1 ||
                      element.category?.id == _categoryIndex) &&
                  (_subcategoryIndex == -1 ||
                      element.subCategory == null ||
                      element.subCategory?.id == _subcategoryIndex),
            )
            .toList(),
      );
    notifyListeners();
  }

  void onChange(String value) {
    log.i(value);
    _searchKeyWord = value;
    _isSearchActive = _searchKeyWord.isNotEmpty;
    setListOnScreen();
    notifyListeners();
  }

  void updateTags(int index, String value) {
    log.i('index:$index, value:$value');
    _isSearchActive = false;
    _searchKeyWord = '';
    _tags[index] = value;
    if (index == 1) {
      setCurrentPlatform(value);
    } else if (index == 0) {
      setCurrentCountry(value);
    }
    setListOnScreen();
    notifyListeners();
  }

  Future<void> makepostBusy() async {
    log.i('Setting list on screen');
    setPostsBusy(true);
    await Future.delayed(Duration(seconds: 1));

    log.i('currentSector:${sectors[_currentIndex]}');
    log.i('currentCountry:$_currentCountry');
    //log.i('sectorsPlatform: $sectorPlatforms');
    log.i('currentPlatfrom:${sectorPlatforms[_selectedPlatformIndex]}');

    setListOnScreen();
    setPostsBusy(false);
  }

  int _selectedPlatformIndex = 0;
  List<Sector> get sectors =>
      [Sector(id: -1, name: 'All'), ..._postService.sectors];
  List<Platform> get platforms =>
      [Platform(id: -1, name: _allPlatforms), ..._postService.platforms];

  List<Platform> get sectorPlatforms {
    if (_currentIndex == 0) return platforms;
    return [
      Platform(id: -1, name: _allPlatforms),
      ...List.from(platforms
          .where((element) =>
              element.sectors != null &&
              element.sectors!.id == sectors[_currentIndex].id)
          .toList())
    ];
  }

  Future<void> onPlatformTap() async {
    log.i('');
    final resut = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false,
        variant: BottomSheetType.EVENT_MORE_TYPE,
        customData: _currentIndex == 0 ? platforms : sectorPlatforms);
    if (resut != null) {
      _selectedPlatformIndex = resut.data;
      updateTags(
        1,
        sectorPlatforms[_selectedPlatformIndex].name,
      );
      await makepostBusy();
    }
  }

  void onAddPost() {
    _navigationService.navigateTo(Routes.postView);
  }

  void onComment(Post post) {
    _navigationService.navigateTo(
      Routes.commentView,
      arguments: CommentViewArguments(post: post),
    );
  }

  Future<void> onLike(int index) async {
    log.i('index:$index');
    Post postToBeUpdated =
        _listOnScreen[index].copyWith(likes: listOnScreen[index].likes + 1);
    _listOnScreen[index] = postToBeUpdated;
    _listOnScreen.remove(index);
    notifyListeners();
    _postService.updatePost(
      post: postToBeUpdated,
    );
  }

  Future<void> onShare(int id) async {}

  void setQucikFilterIndex(index) async {
    log.i('index:$index');
    _currentIndex = index;
    _isSearchActive = false;
    _searchKeyWord = '';
    _selectedPlatformIndex = 0;
    _categoryIndex = -1;
    _subcategoryIndex = -1;
    setCurrentPlatform('All Platforms');
    updateTags(1, 'All Platforms');
    notifyListeners();
    await makepostBusy();
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
      await makepostBusy();
    }
  }

  Future<void> onFilter() async {
    log.i('');

    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.FILTER,
    );
    if (result != null) {
      setPostsBusy(true);
      if (result.data is Filter) {
        Filter filter = result.data as Filter;

        if (filter.platformId != -1) {
          for (Platform platform in platforms) {
            if (platform.id == filter.platformId) {
              for (Sector sector in sectors) {
                if (sector.id == platform.sectors!.id) {
                  _currentIndex = sectors.indexOf(sector);
                  _selectedPlatformIndex = sectorPlatforms.indexOf(platform);
                  updateTags(1, platform.name);

                  break;
                }
              }
              _categoryIndex = filter.categoryId ?? -1;
              _subcategoryIndex = filter.subCategoryId ?? -1;

              break;
            }
          }
        }
        if (filter.countryName != null) {
          setCurrentCountry(filter.countryName!);
          updateTags(0, _currentCountry);
        }
      }
      setPostsBusy(false);
      await makepostBusy();
    }
  }

  Future<void> onMoreTap(Post post) async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.POST_OPTIONS,
    );
    if (result != null) {
      if (result.data == 0) {
        _navigationService.navigateTo(
          Routes.postView,
          arguments: PostViewArguments(post: post),
        );
      } else {
        final result = await _dialogService.showCustomDialog(
            variant: DialogType.DELETE,
            title: 'Are you sure?',
            additionalButtonTitle: 'Yes',
            description: 'This action will remove the post permanently');

        if (result?.confirmed ?? false) {
          try {
            await _postService.deletePost(id: post.id);
            initialise();
          } catch (e) {
            log.e(e);
          }
        } else {
          log.v('result:${result?.data}');
        }
      }
    }
  }

  bool _fetchAgain = false;

  Future<void> onRefresh() async {
    _fetchAgain = true;
    initialise();
  }

  @override
  Future<List<Post>> futureToRun() async {
    await _postService.getHeaders(fetch: _fetchAgain);
    return await _postService.getPosts(fetch: _fetchAgain);
  }

  @override
  void onData(List<Post>? data) {
    if (data != null) {
      _posts = data;
      setListOnScreen();
      log.d(posts);
    }
  }
}
