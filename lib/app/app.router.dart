// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../datamodels/app_data_model.dart';
import '../datamodels/post/post_model.dart';
import '../ui/views/about/about_viewmodel.dart';
import '../ui/views/account/account_view.dart';
import '../ui/views/category_view/category_view.dart';
import '../ui/views/comment/comment_view.dart';
import '../ui/views/event_detail/event_detail_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/post/post_view.dart';
import '../ui/views/preference/preference_view.dart';
import '../ui/views/profile_upload_view/profile_upload_view.dart';
import '../ui/views/setting/address/address_view.dart';
import '../ui/views/setting/bank_details/band_details_view.dart';
import '../ui/views/setting/personal_info/personal_info_view.dart';
import '../ui/views/setting/setting_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String eventDetailView = '/event-detail-view';
  static const String categoriesView = '/categories-view';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String accountView = '/account-view';
  static const String startupView = '/startup-view';
  static const String settingView = '/setting-view';
  static const String postView = '/post-view';
  static const String preferenceView = '/preference-view';
  static const String aboutView = '/about-view';
  static const String commentView = '/comment-view';
  static const String personalInfoView = '/personal-info-view';
  static const String addressView = '/address-view';
  static const String bankDetailView = '/bank-detail-view';
  static const String profileUploadView = '/profile-upload-view';
  static const all = <String>{
    homeView,
    eventDetailView,
    categoriesView,
    loginView,
    signUpView,
    accountView,
    startupView,
    settingView,
    postView,
    preferenceView,
    aboutView,
    commentView,
    personalInfoView,
    addressView,
    bankDetailView,
    profileUploadView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.eventDetailView, page: EventDetailView),
    RouteDef(Routes.categoriesView, page: CategoriesView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.accountView, page: AccountView),
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.settingView, page: SettingView),
    RouteDef(Routes.postView, page: PostView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.aboutView, page: AboutView),
    RouteDef(Routes.commentView, page: CommentView),
    RouteDef(Routes.personalInfoView, page: PersonalInfoView),
    RouteDef(Routes.addressView, page: AddressView),
    RouteDef(Routes.bankDetailView, page: BankDetailView),
    RouteDef(Routes.profileUploadView, page: ProfileUploadView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    EventDetailView: (data) {
      var args = data.getArgs<EventDetailViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EventDetailView(
          event: args.event,
          key: args.key,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    CategoriesView: (data) {
      var args = data.getArgs<CategoriesViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CategoriesView(
          eventCategoryId: args.eventCategoryId,
          key: args.key,
        ),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    SignUpView: (data) {
      var args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignUpView(key: args.key),
        settings: data,
      );
    },
    AccountView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AccountView(),
        settings: data,
      );
    },
    StartupView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    SettingView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SettingView(),
        settings: data,
      );
    },
    PostView: (data) {
      var args = data.getArgs<PostViewArguments>(
        orElse: () => PostViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PostView(
          post: args.post,
          key: args.key,
        ),
        settings: data,
      );
    },
    PreferenceView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    AboutView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
    CommentView: (data) {
      var args = data.getArgs<CommentViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CommentView(
          post: args.post,
          key: args.key,
        ),
        settings: data,
      );
    },
    PersonalInfoView: (data) {
      var args = data.getArgs<PersonalInfoViewArguments>(
        orElse: () => PersonalInfoViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PersonalInfoView(key: args.key),
        settings: data,
      );
    },
    AddressView: (data) {
      var args = data.getArgs<AddressViewArguments>(
        orElse: () => AddressViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddressView(key: args.key),
        settings: data,
      );
    },
    BankDetailView: (data) {
      var args = data.getArgs<BankDetailViewArguments>(
        orElse: () => BankDetailViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => BankDetailView(key: args.key),
        settings: data,
      );
    },
    ProfileUploadView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProfileUploadView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EventDetailView arguments holder class
class EventDetailViewArguments {
  final Event event;
  final Key? key;
  EventDetailViewArguments({required this.event, this.key});
}

/// CategoriesView arguments holder class
class CategoriesViewArguments {
  final int eventCategoryId;
  final Key? key;
  CategoriesViewArguments({required this.eventCategoryId, this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key? key;
  SignUpViewArguments({this.key});
}

/// PostView arguments holder class
class PostViewArguments {
  final Post? post;
  final Key? key;
  PostViewArguments({this.post, this.key});
}

/// CommentView arguments holder class
class CommentViewArguments {
  final Post post;
  final Key? key;
  CommentViewArguments({required this.post, this.key});
}

/// PersonalInfoView arguments holder class
class PersonalInfoViewArguments {
  final Key? key;
  PersonalInfoViewArguments({this.key});
}

/// AddressView arguments holder class
class AddressViewArguments {
  final Key? key;
  AddressViewArguments({this.key});
}

/// BankDetailView arguments holder class
class BankDetailViewArguments {
  final Key? key;
  BankDetailViewArguments({this.key});
}
