import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';
import 'package:requests/requests.dart';
import 'rest_response_parser.dart';

const String getPostsUrl = base_url + "posts";
const String getCategoriesUrl = base_url + "categories";
const String getSubCategoriesUrl = base_url + "subcategories";
const String getSectorUrl = base_url + "sectors";
const String getPlatformsUrl = base_url + "platforms";
const String updateUserUrl = base_url + "auth/user/";

class PutApis {
  Future<User> updateUser(
      {required Map<String, dynamic> body, required int id}) async {
    body.remove('id');
    body.remove('accessToken');
    body.remove('tokenType');
    body['role'] = ["user"];
    final userCategoriesMap = [];
    List<Category> userCategories = body['usercategories'];
    userCategories.forEach((element) {
      userCategoriesMap.add({'id': element.id});
    });

    body['usercategories'] = userCategoriesMap;

    return RestResponseParser().runPutRestRequest<User>(
      url: updateUserUrl + '$id',
      body: body,
      key: 'UserForm',
    );
  }

  Future<Post> updatePost({required Post post}) async {
    int id = post.id;
    final updatedPost = post.toJson();
    updatedPost.remove('id');
    return RestResponseParser().runPutRestRequest<Post>(
        url: getPostsUrl + '/$id', body: updatedPost, key: 'PostForm');
  }

  //TODO: This should be removed from there and move into delete class

  Future<void> deletePost({required id}) async {
    return RestResponseParser().runDeleteRestRequest(
      url: getPostsUrl + '/$id',
    );
  }
}
