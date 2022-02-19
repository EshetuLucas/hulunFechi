import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'search_view.form.dart';

const String POST_BUSY_KEY = 'Post busy key';

class SearchViewModel extends FutureViewModel<List<Post>> {
  final log = getLogger('CategoryViewModel');
  final _userService = locator<UserService>();
  final _postService = locator<PostService>();
  final _navigationService = locator<NavigationService>();
  final EventService _eventService = locator<EventService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  int get userId => _userService.currentUser.id;
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  void setUserPosts() {
    _posts = List.from(
      _posts.reversed
          .where((element) => element.user.id == _userService.currentUser.id),
    );
    notifyListeners();
  }

  String searchKey = '';
  List userSearchResult = [];
  List<Event> _searchResultEvents = [];
  List<Event> get searchResultEvents => _searchResultEvents;
  Future<void> setuserSearchResult() async {
    final result = await _sharedPreferencesService.getFromDisk('searchHistory');
    if (result != null) {
      userSearchResult.clear();
      userSearchResult.addAll(result);
    }

    notifyListeners();
  }

  Future<void> saveSearchHistory(
      {required String searchText, int? index}) async {
    log.i('searchText:$searchText');
    List<String> tempList = [];
    userSearchResult.forEach((element) {
      tempList.add(element);
    });
    if (index == null) {
      tempList.insert(0, searchText);
    } else {
      tempList.removeAt(index);
    }

    _sharedPreferencesService.saveToDisk('searchHistory', tempList);
    if (index != null) {
      await setuserSearchResult();
    }
  }

  Future<void> getSearchResult({required String keyWord}) async {
    log.i('keyWord:$keyWord');
    busy(true);
    try {
      final result = await _eventService.searchEvent(
          keyWord: keyWord, perPage: 10, currentPage: 1);
      if (result != null) {
        _searchResultEvents = result;
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
    busy(false);
  }

  Future<void> removeSearchKeyWord(int index) async {
    log.i('index:$index');
    await saveSearchHistory(searchText: '', index: index);
  }

  void onComment(Post post) {
    _navigationService.navigateTo(
      Routes.commentView,
      arguments: CommentViewArguments(post: post),
    );
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
            _posts.remove(post);
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

  void setPostsBusy(bool value) {
    setBusyForObject(POST_BUSY_KEY, value);
  }

  Future<void> onLike(int id) async {}
  Future<void> onShare(int id) async {}
  int _page = 0;
  int _size = 10;
  @override
  Future<List<Post>> futureToRun() async {
    return await _postService.getPosts(
      size: _size,
      page: _page,
    );
  }

  @override
  void onData(List<Post>? data) {
    if (data != null) {
      _posts = data;
      setUserPosts();
      log.d(posts);
    }
  }
}
