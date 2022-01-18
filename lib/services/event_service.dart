import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';

class EventService {
  final log = getLogger('EventService');

  /// Services
  final _getApis = locator<GetApis>();

  List<Event> _savedEvents = [];
  List<Event> get savedEvents => _savedEvents;

  bool isEventSaved(Event event) {
    for (Event element in savedEvents) {
      if (element.id == event.id) {
        return true;
      }
    }

    return false;
  }

  // /// Get events based on category id
  // Future<List<Event>> searchEventByCategory({
  //   required String eventCategoryId,
  //   required int perPage,
  //   required int currentPage,
  // }) async {
  //   return await _getApis.searchEventByCategory(
  //       eventCategoryId: eventCategoryId,
  //       perPage: perPage,
  //       currentPage: currentPage);
  // }

  /// Get events based on search key word
  Future<List<Event>> searchEvent({
    required String keyWord,
    required int perPage,
    required int currentPage,
  }) async {
    return await _getApis.searchEvent(
      keyWord: keyWord,
      perPage: perPage,
      currentPage: currentPage,
    );
  }

  /// Get events based on Event classification
  Future<List<Event>> getHomeCategory({
    required String categoryName,
    required int perPage,
    required int currentPage,
  }) async {
    return await _getApis.getHomeCategory(
      categoryName: categoryName,
      perPage: perPage,
      currentPage: currentPage,
    );
  }
}
