import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';

const String user_type = "Customer";

class UserService {
  final log = getLogger('UserService');
  final _postApi = locator<PostApi>();

  final _getApi = locator<GetApis>();

  User? _currentUser;
  User get currentUser => _currentUser!;
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  bool get hasUser => _currentUser != null;

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

  Future<void> syncUser() async {}

  Future<void> postPost({required PostForm post}) async {
    try {
      await _postApi.post(post: post);
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
}
