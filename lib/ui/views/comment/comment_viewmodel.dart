import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hulunfechi/extensions/string_extensions.dart';

const String ADD_COMMENT_BUSY_KEY = 'Add Comment';

class CommentViewModel extends FutureViewModel<List<PostComment>> {
  final log = getLogger('CommentViewModel');
  final _postService = locator<PostService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  String _commentText = '';

  CommentViewModel(this.post);
  String get commentText => _commentText;
  void onChange(String value) {
    _commentText = value;
    notifyListeners();
  }

  final Post post;

  bool get hasText => _commentText.isNullOrEmpty;
  void onBack() => _navigationService.back();
  List<PostComment> _listOnScreen = [];
  List<PostComment> get listOnScreen => _listOnScreen;

  @override
  Future<List<PostComment>> futureToRun() async {
    return await _postService.getAllComments(id: post.id);
  }

  @override
  void onData(List<PostComment>? data) {
    super.onData(data);
    if (data != null) {
      _listOnScreen = data;
      log.v(_listOnScreen);
    }
  }

  Future<void> onComment() async {
    int userId = _userService.currentUser.id;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    Map<String, dynamic> body = {
      "comment": _commentText,
      "user": {"id": userId},
      "dateAdded": "$formattedDate",
    };
    _listOnScreen.add(
      PostComment(id: 1, user: _userService.currentUser, comment: _commentText),
    );
    _commentText = '';
    notifyListeners();

    try {
      setBusyForObject(ADD_COMMENT_BUSY_KEY, true);
      final comment = await _postService.addComment(body: body, id: post.id);
      log.v(comment);
      setBusyForObject(ADD_COMMENT_BUSY_KEY, false);

      notifyListeners();
    } catch (e) {
      setBusyForObject(ADD_COMMENT_BUSY_KEY, false);
      log.e(e);
      await _dialogService.showCustomDialog(
        variant: DialogType.ERROR,
        title: 'Something went wrong while Saving you changes',
        description: 'Please try again',
      );
    }
  }
}
