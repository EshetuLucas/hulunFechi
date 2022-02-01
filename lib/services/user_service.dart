import 'dart:convert';

import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/api/put_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:hulunfechi/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';

const String user_type = "Customer";

class UserService with ReactiveServiceMixin {
  final log = getLogger('UserService');
  final _postApi = locator<PostApi>();
  final _putApis = locator<PutApis>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  final _getApi = locator<GetApis>();

  ReactiveValue<User?> _currentUser = ReactiveValue<User?>(
      User(id: 1, username: '', firstname: '', lastname: '', email: ''));
  User get currentUser => _currentUser.value!;
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  bool get hasUser => _currentUser != null;
  String get currentUserFirstName => currentUser.firstname;
  String get currentUserLastName => currentUser.lastname;
  String get currentUserDoB => currentUser.dob ?? '';
  String get currentUserPhonNumber => currentUser.phone ?? '';
  String get currentUserEmail => currentUser.email;
  String get currentUserProfession => currentUser.profession ?? '';
  String get currentUserCity => currentUser.city ?? '';
  String get currentUserRegion => currentUser.region ?? '';
  String get currentUserWoreda => currentUser.woreda ?? '';
  String get currentUserSubCity => currentUser.subcity ?? '';
  String get currentUserHouseNO => currentUser.housenumber ?? '';
  String get currentUserSSN => currentUser.ssn ?? '';
  String get currentUserFullName =>
      currentUserFirstName + ' ' + currentUserLastName;
  String get currentUserBankName => currentUser.bank ?? '';
  String get currentUserAccountNO => currentUser.account ?? '';
  UserService() {
    listenToReactiveValues([_currentUser]);
  }
  void setCurrentuser({required User user}) => _currentUser.value = user;

  Future<User> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {"username": email, "password": password};
    _currentUser.value = await _postApi.userAuth(body: body, isLogin: true);
    _setUserLocally(_currentUser.value);
    return _currentUser.value!;
  }

  void _setUserLocally(User? user) {
    if (user != null) {
      _sharedPreferencesService.saveToDisk('user', jsonEncode(user.toJson()));
      _sharedPreferencesService.setUserLoggedIn(true);
    }
  }

  // This function creates user account in the backend
  Future<User> createUserAccount({
    required String username,
    required String firstname,
    String lastname = '',
    required String email,
    required String password,
    required String gender,
  }) async {
    Map<String, dynamic> body = {
      "username": email,
      "firstname": firstname,
      'lastname': lastname,
      "email": email,
      "password": password,
      "role": ["user"],
      'gender': gender,
    };
    _currentUser.value = await _postApi.userAuth(body: body);
    _setUserLocally(_currentUser.value);
    return _currentUser.value!;
  }

  Future<User> updateUser({required User user}) async {
    try {
      final newUserData =
          await _putApis.updateUser(body: user.toJson(), id: user.id);
      _currentUser.value = newUserData.copyWith(
        accessToken: currentUser.accessToken,
      );

      notifyListeners();
      _setUserLocally(newUserData);
      return newUserData;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future<void> syncUser() async {}
  Future<void> logOut() async {
    _currentUser.value = null;
    _sharedPreferencesService.dispose();
  }
}
