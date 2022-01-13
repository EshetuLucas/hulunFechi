import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.router.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'search_view.form.dart';

class SearchViewModel extends FormViewModel {
  final log = getLogger('CategoryViewModel');
  final NavigationService _navigationService = locator<NavigationService>();
  final EventService _eventService = locator<EventService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

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

  Future<void> onEventTap(Event event) async {
    await saveSearchHistory(searchText: searchValue!);
    _navigationService.navigateTo(Routes.eventDetailView,
        arguments: EventDetailViewArguments(event: event));
  }

  Future<void> removeSearchKeyWord(int index) async {
    log.i('index:$index');
    await saveSearchHistory(searchText: '', index: index);
  }

  @override
  void setFormStatus() async {
    if (searchValue != null && searchValue!.length > 1) {
      if (searchKey != searchValue) {
        searchKey = searchValue!;
        await getSearchResult(keyWord: searchKey);
        notifyListeners();
      }
    }
  }

  void onComment(Post post) => _navigationService.navigateTo(
        Routes.commentView,
        arguments: CommentViewArguments(post: post),
      );
}
