import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:requests/requests.dart';
import 'rest_response_parser.dart';

const String base_url =
    "http://hulunfechi.ethioscholarship.com/api/hulunfechi/";
const String create_user = base_url + "createCloudeUser";
const String login = base_url + "login_s";

class PostApi {
  Future<UserAccount> userAuth(
      {required Map<String, dynamic> body, bool isLogin = false}) async {
    return RestResponseParser().runUserRestRequest<UserAccount>(
      url: isLogin ? login : create_user,
      body: body,
    );
  }
}
