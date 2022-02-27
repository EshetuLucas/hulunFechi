import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:requests/requests.dart';
import 'rest_response_parser.dart';

const String getPostsUrl = base_url + "posts";
const String getCategoriesUrl = base_url + "categories";
const String getSubCategoriesUrl = base_url + "subcategories";
const String getSectorUrl = base_url + "sectors";
const String getPlatformsUrl = base_url + "platforms";

class GetApis {
  Future<List<PostComment>> getAllComents({required int id}) async {
    return RestResponseParser().runRestRequest<PostComment>(
        url: getPostsUrl + '/$id/comments', key: "PostComment");
  }

  Future<List<Category>> getAllCategory() async {
    return RestResponseParser()
        .runRestRequest<Category>(url: getCategoriesUrl, key: "Category");
  }

  Future<List<SubCategory>> getAllSubCategory() async {
    return RestResponseParser().runRestRequest<SubCategory>(
        url: getSubCategoriesUrl, key: "SubCategory");
  }

  Future<List<Sector>> getAllSectors() async {
    return RestResponseParser()
        .runRestRequest<Sector>(url: getSectorUrl, key: "Sector");
  }

  Future<List<Platform>> getPlatforms() async {
    return RestResponseParser()
        .runRestRequest<Platform>(url: getPlatformsUrl, key: "Platform");
  }

  Future<List<Post>> getPosts({required int page, required int size}) async {
    String searchEventByCategoryUrl =
        'https://apiv2.hulunfechi.com/api/postspage?page=$page&size=$size';
    return RestResponseParser().runRestRequest<Post>(
      url: searchEventByCategoryUrl,
      key: "Posts",
      hasPagination: true,
    );
  }

  Future<List<Post>> getUserPosts({
    required int id,
  }) async {
    String getUserPostsUrl = 'https://apiv2.hulunfechi.com/api/postbyuser/$id';
    return RestResponseParser()
        .runRestRequest<Post>(url: getUserPostsUrl, key: "Posts");
  }

  Future<List<Event>> getAllPosts(
      {required String eventCategoryId,
      required int perPage,
      required int currentPage}) async {
    String searchEventByCategoryUrl = base_url +
        "searchEventByCategory/$eventCategoryId/$perPage/$currentPage";
    return RestResponseParser()
        .runRestRequest<Event>(url: searchEventByCategoryUrl, key: "data");
  }

  Future<List<Event>> searchEvent(
      {required String keyWord,
      required int perPage,
      required int currentPage}) async {
    String searchEventByCategoryUrl =
        base_url + "searchEvent/$keyWord/$perPage/$currentPage";
    return RestResponseParser()
        .runRestRequest<Event>(url: searchEventByCategoryUrl, key: "data");
  }

  Future<List<Event>> getHomeCategory({
    required String categoryName,
    required int perPage,
    required int currentPage,
  }) async {
    String getHomeCategory = base_url + "$categoryName/$perPage/$currentPage";
    return RestResponseParser()
        .runRestRequest<Event>(url: getHomeCategory, key: "data");
  }
}

  // Future<Category> getAllCategory() async {
  //   var r = await Requests.get(url)('https://reqres.in/api/users',
  //       body: {
  //         'userId': 10,
  //         'id': 91,
  //         'title': 'aut amet sed',
  //       },
  //       bodyEncoding: RequestBodyEncoding.FormURLEncoded);

  //   r.raiseForStatus();
  //   dynamic json = r.json();
  //   print(json['id']);
  // }

