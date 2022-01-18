import 'package:hulunfechi/api/get_apis.dart';
import 'package:hulunfechi/api/post_apis.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';

class PostService {
  final log = getLogger('PostService');
  final _postApi = locator<PostApi>();
  final _getApi = locator<GetApis>();

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
      return await _getApi.getPosts();
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
