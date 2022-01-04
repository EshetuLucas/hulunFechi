import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';

const String user_type = "Customer";

class UserService {
  final log = getLogger('UserService');
  final _postApi = locator<PostApi>();

  UserAccount? _currentUser;
  UserAccount? get currentUser => _currentUser;
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  bool get hasUser => _currentUser != null;

  void setCurrentuser({required UserAccount userAccount}) =>
      _currentUser = userAccount;

  Future<UserAccount> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {"email": email, "password": password};
    return _postApi.userAuth(body: body, isLogin: true);
  }

  // This function creates user account in the backend
  Future<UserAccount> createUserAccount({
    required String name,
    String? phoneNumber,
    required String password,
    required String email,
  }) async {
    Map<String, dynamic> body = {
      "name": name,
      "mobile": phoneNumber ?? "1",
      "email": email,
      "password": password,
      "userType": user_type,
      "password_confirmation": password,
    };
    return _postApi.userAuth(body: body);
  }

  Future<void> syncUser() async {}
}
