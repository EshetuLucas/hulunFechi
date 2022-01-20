import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/api/put_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';

class PostService {
  final log = getLogger('PostService');
  final _postApi = locator<PostApi>();
  final _getApi = locator<GetApis>();
  final _putApis = locator<PutApis>();

  List<Platform> _platforms = [];
  List<Platform> get platforms => _platforms;

  void setplatforms(List<Platform> platform) {
    _platforms = platform;
  }

  List<Sector> _sectors = [];
  List<Sector> get sectors => _sectors;

  void setSectors(List<Sector> sectors) {
    _sectors = sectors;
  }

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  void setCategoreis(List<Category> categories) {
    log.e(categories);
    _categories = categories;
  }

  List<SubCategory> _subCategories = [];
  List<SubCategory> get subCategories => _subCategories;

  void setSubCategoreis(List<SubCategory> subCategories) {
    _subCategories = subCategories;
  }

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  void setPosts(List<Post> value) {
    _posts = value;
  }

  Future<void> postPost({required PostForm post}) async {
    try {
      await _postApi.post(post: post);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<void> updatePost({required Post post}) async {
    try {
      await _putApis.updatePost(post: post);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      _posts = await _getApi.getPosts();
      return _posts;
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<void> getHeaders() async {
    setSectors(await getAllSectors());
    setplatforms(await getPlatforms());
    setCategoreis(await getCategories());
    setSubCategoreis(await getAllSubCategory());
  }

  Future<List<Category>> getCategories() async {
    try {
      return await _getApi.getAllCategory();
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<Platform>> getPlatforms() async {
    try {
      return await _getApi.getPlatforms();
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<SubCategory>> getAllSubCategory() async {
    try {
      return await _getApi.getAllSubCategory();
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<Sector>> getAllSectors() async {
    try {
      return await _getApi.getAllSectors();
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<PostComment> addComment(
      {required Map<String, dynamic> body, required int id}) async {
    try {
      return await _postApi.addComment(body: body, id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<PostComment>> getAllComments({required int id}) async {
    try {
      return await _getApi.getAllComents(id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
