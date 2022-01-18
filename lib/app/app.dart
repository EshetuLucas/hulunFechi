import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/services/event_service.dart';
import 'package:hulunfechi/services/post_service.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:hulunfechi/services/user_service.dart';
import 'package:hulunfechi/ui/views/about/about_viewmodel.dart';
import 'package:hulunfechi/ui/views/account/account_view.dart';
import 'package:hulunfechi/ui/views/category_view/category_view.dart';
import 'package:hulunfechi/ui/views/comment/comment_view.dart';
import 'package:hulunfechi/ui/views/event_detail/event_detail_view.dart';
import 'package:hulunfechi/ui/views/login/login_view.dart';
import 'package:hulunfechi/ui/views/post/post_view.dart';
import 'package:hulunfechi/ui/views/preference/preference_view.dart';
import 'package:hulunfechi/ui/views/setting/setting_view.dart';
import 'package:hulunfechi/ui/views/signup/signup_view.dart';
import 'package:hulunfechi/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView),
    CustomRoute(
      page: EventDetailView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CupertinoRoute(page: CategoriesView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: SignUpView),
    CupertinoRoute(page: AccountView),
    CupertinoRoute(page: StartupView),
    CupertinoRoute(page: SettingView),
    CupertinoRoute(page: PostView),
    CupertinoRoute(page: PreferenceView),
    CupertinoRoute(page: AboutView),
    CupertinoRoute(page: CommentView),
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: GetApis),
    LazySingleton(classType: EventService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: PostApi),
    LazySingleton(classType: PostService),
    // presolve
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetUp {}
