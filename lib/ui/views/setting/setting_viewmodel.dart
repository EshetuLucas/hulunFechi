import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  final log = getLogger('SavedEventsViewModel');
  final _navigationService = locator<NavigationService>();
  final _eventService = locator<EventService>();

  List<Event> get savedEvents => _eventService.savedEvents;
  bool get hasSavedEvents => savedEvents.isNotEmpty;

  void onBack() {
    _navigationService.back();
  }
}
