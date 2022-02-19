import 'package:cloud_firestore/cloud_firestore.dart';
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
  int _totalPages = 0;
  int get totalPages => _totalPages;
  void setTotalPages(int pages) {
    log.i('pages$pages');
    _totalPages = pages;
  }

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

  Future<void> deletePost({required int id}) async {
    try {
      await _putApis.deletePost(id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<List<Post>> getPosts({
    bool fetch = false,
    int page = 0,
    int size = 10,
  }) async {
    log.i('page:$page, size$size');
    bool status = await checkStatus();

    try {
      if (status) {
        if (fetch || _posts.isEmpty) {
          if (page == 0) {
            _posts = [];
          }
          _posts.addAll(
            await _getApi.getPosts(
              page: page,
              size: size,
            ),
          );
        }
      }
      return _posts;
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<void> getHeaders({bool fetch = false}) async {
    bool status = await checkStatus();

    if (status) {
      if (fetch || _sectors.isEmpty)
        setSectors(
          await getAllSectors(),
        );
      if (fetch || _platforms.isEmpty) setplatforms(await getPlatforms());
      if (fetch || _categories.isEmpty)
        setCategoreis(
          await getCategories(),
        );
      if (fetch || _subCategories.isEmpty)
        setSubCategoreis(
          await getAllSubCategory(),
        );
    }
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

  final CollectionReference _startUpCollection =
      FirebaseFirestore.instance.collection('startUp');

  Future<bool> checkStatus() async {
    try {
      final result = await _startUpCollection.get();
      final data = result.docs[0].data() as Map<String, dynamic>;
      return data['status'];
    } catch (e) {
      log.e(e);
    }
    return false;
  }
}
