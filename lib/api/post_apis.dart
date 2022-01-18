import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:requests/requests.dart';
import 'rest_response_parser.dart';

const String base_url = "https://apiv2.hulunfechi.com/api/";
const String create_user = base_url + "auth/signup";
const String login = base_url + "auth/signin";
const String postUrl = base_url + "posts";

class PostApi {
  // Future<User> userAuth(
  //     {required Map<String, dynamic> body, bool isLogin = false}) async {
  //   return RestResponseParser().runUserRestRequest<User>(
  //     url: isLogin ? login : create_user,
  //     body: body,
  //     key: 'UserForm',
  //   );
  // }

  Future<User> userAuth(
      {required Map<String, dynamic> body, bool isLogin = false}) async {
    return isLogin
        ? RestResponseParser().runUserRestRequest<User>(
            url: isLogin ? login : create_user,
            body: body,
            key: 'UserForm',
          )
        : RestResponseParser().runUserSignUpRestRequest<User>(
            url: isLogin ? login : create_user, body: body, key: 'UserForm');
  }

  Future<PostForm> post({required PostForm post}) async {
    return RestResponseParser().runPostRestRequest<PostForm>(
        url: postUrl, body: post.toJson(), key: 'PostForm');
  }
}
