import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/group.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String POST_BUSY_KEY = 'Post busy key';

class EntertainersViewModel extends FutureViewModel {
  final log = getLogger('EntertainersViewModel ');
  final NavigationService _navigationService = locator<NavigationService>();

  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  String _allPlatforms = 'All Platforms';
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

  List<Post> _posts = [
    FAKE_POST,
    FAKE_POST1,
    FAKE_POST,
    FAKE_POST1,
  ];
  List<Post> get posts => _posts;

  bool _isSearchActive = false;
  bool get isSearchActive => _isSearchActive;
  String _searchKeyWord = '';
  String _currentPlatform = 'All Platforms';
  void setCurrentPlatform(String platform) => _currentPlatform = platform;

  String _currentCountry = 'All Countries';
  void setCurrentCountry(String country) => _currentCountry = country;

  List<Post> get listOnScreen {
    if (_posts == null) {
      return [];
    }
    if (_searchKeyWord.isNotEmpty) {
      setCurrentCountry('All Countries');
      setCurrentPlatform('All Platforms');
      _currentIndex = 0;
      if (_searchKeyWord.isNotEmpty) {
        return List.from(_posts
            .where(
              (element) =>
                  element.userName.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ) ||
                  element.title.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ) ||
                  element.body.toLowerCase().contains(
                        _searchKeyWord.toLowerCase(),
                      ),
            )
            .toList());
      }
    }

    return List.from(
      _posts
          .where(
            (element) =>
                (_currentIndex == 0 ||
                    element.group == Group.values[_currentIndex]) &&
                (_currentCountry == "All Countries" ||
                    element.country == _currentCountry) &&
                (_currentPlatform == _allPlatforms ||
                    element.platform == _currentPlatform),
          )
          .toList(),
    );
  }

  void onChange(String value) {
    log.i(value);
    _searchKeyWord = value;
    _isSearchActive = _searchKeyWord.isNotEmpty;
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
        return [_allPlatforms, ...All];
      case 1:
        return [_allPlatforms, ...Belief];
      case 2:
        return [_allPlatforms, ...Technology];
      case 3:
        return [_allPlatforms, ...Knowledge];
      case 4:
        return [_allPlatforms, ...Health];
      case 5:
        return [_allPlatforms, ...Competition];
      case 6:
        return [_allPlatforms, ...Law];
      case 7:
        return [_allPlatforms, ...Finance];

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

  void onComment(Post post) => _navigationService.navigateTo(
        Routes.commentView,
        arguments: CommentViewArguments(post: post),
      );

  void setQucikFilterIndex(index) async {
    _currentIndex = index;
    _isSearchActive = false;
    _searchKeyWord = '';
    updateTags(1, getList()[0]);
    notifyListeners();
    await makepostBusy();
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
    final resut = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.FILTER,
    );
    await makepostBusy();
  }

  @override
  Future<void> futureToRun() async {
    await Future.delayed(Duration(seconds: 2));
    _posts = [
      FAKE_POST,
      FAKE_POST1,
      FAKE_POST,
      FAKE_POST1,
    ];
  }
}
