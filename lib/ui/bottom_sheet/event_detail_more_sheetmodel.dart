import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventOptionsBottomSheetViewModel extends BaseViewModel {
  final log = getLogger('EventDetailMoreViewModel');
  final _navigationService = locator<NavigationService>();

  final _eventService = locator<EventService>();
  late bool isEventSaved;

  final Event event;

  EventOptionsBottomSheetViewModel({required this.event}) {
    isEventSaved = _eventService.isEventSaved(event);
  }
  Future<void> onSaveEvent(Event event) async {
    log.i('event:$event');

    popBottomSheet();
  }

  Future<void> onDeleteEvent(int id) async {
    log.i('id:$id');

    popBottomSheet();
  }

  void popBottomSheet() {
    _navigationService.back();
  }
}
