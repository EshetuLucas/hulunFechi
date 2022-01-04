import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:requests/requests.dart';
import 'rest_response_parser.dart';

const String base_url =
    "http://hulunfechi.ethioscholarship.com/api/hulunfechi/";
const String getAllCategoryUrl = base_url + "getAllEventCategory/";

class GetApis {
  Future<List<Category>> getAllCategory() async {
    return RestResponseParser()
        .runRestRequest<Category>(url: getAllCategoryUrl);
  }

  Future<List<Event>> searchEventByCategory(
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

