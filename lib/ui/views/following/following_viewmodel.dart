import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String FOLLOW_BUTTON_BUSY_KEY = 'Follow button key';

class FollowingViewModel extends BaseViewModel {
  final log = getLogger('EntertainersViewModel ');

  final _userService = locator<UserService>();
  // final _postService = locator<PostService>();
  // final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  // final _snackbarService = locator<SnackbarService>();

  List<User> get followings => _userService.currentUser.following;
  int _busyIndex = -1;
  int get busyIndex => _busyIndex;
  void setFollowBusy(bool value) {
    setBusyForObject(FOLLOW_BUTTON_BUSY_KEY, value);
  }

  Future<void> onFollow(User user, int index) async {
    _busyIndex = index;
    setFollowBusy(true);
    List<User> newFollowing = [];
    newFollowing.addAll(followings);
    newFollowing.remove(user);
    log.e(newFollowing);
    try {
      await _userService.updateUser(
        user: _userService.currentUser.copyWith(
          following: newFollowing,
        ),
      );
    } catch (e) {
      log.e(e.toString());
    }
    _busyIndex = -1;
    setFollowBusy(false);
  }

  void onBack() => _navigationService.back();
}
