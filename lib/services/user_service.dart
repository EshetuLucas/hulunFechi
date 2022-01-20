import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/api/put_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';

const String user_type = "Customer";

class UserService {
  final log = getLogger('UserService');
  final _postApi = locator<PostApi>();
  final _putApis = locator<PutApis>();

  final _getApi = locator<GetApis>();

  User? _currentUser;
  User get currentUser => _currentUser!;
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  bool get hasUser => _currentUser != null;

  void setCurrentuser({required User user}) => _currentUser = user;

  Future<User> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {"username": email, "password": password};
    _currentUser = await _postApi.userAuth(body: body, isLogin: true);
    return _currentUser!;
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
    _currentUser = await _postApi.userAuth(body: body);
    return _currentUser!;
  }

  Future<User> updateUser({required User user}) async {
    try {
      return await _putApis.updateUser(body: user.toJson(), id: user.id);
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future<void> syncUser() async {}
}
