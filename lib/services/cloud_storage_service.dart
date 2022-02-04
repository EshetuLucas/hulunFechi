import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/services/user_service.dart';

class CloudStorageService {
  final log = getLogger('CloudStorageService');
  final _userService = locator<UserService>();

  firebase_storage.UploadTask? _uploadTask;
  String get userId => _userService.currentUser.id.toString();
  StreamController<double> _streamController = StreamController();
  StreamSubscription? _streamSubscription;
  double _progress = 0;
  bool _isUploading = false;
  bool get isUploading => _isUploading;

  Future<String> uploadFile({
    required File fileToUpload,
  }) async {
    String filePath = fileToUpload.path;
    String cloudfilePath = userId + '/' + filePath.split('/').last;

    try {
      final firebase_storage.Reference reference =
          firebase_storage.FirebaseStorage.instance.ref(cloudfilePath);

      _uploadTask = reference.putFile(fileToUpload);
      _streamSubscription = _uploadTask!.snapshotEvents.listen((event) {
        _isUploading = true;
        _progress = event.bytesTransferred / event.totalBytes;
        _streamController.add(_progress);
      });

      final firebase_storage.TaskSnapshot _taskSnapshot =
          await _uploadTask!.whenComplete(() {
        _isUploading = false;
      });

      String downloadUrl = await _taskSnapshot.ref.getDownloadURL();
      log.d(downloadUrl);
      if (_userService.currentUser.ssn != null) {
        deleteMedia(_userService.currentUser.ssn!);
      }

      return downloadUrl;
    } catch (e) {
      log.i(e.toString());
      return Future.error(firebase_storage.FirebaseException);
    }
  }

  Stream<double> getProgress() {
    return _streamController.stream;
  }

  void dispose() {
    _streamSubscription?.cancel();
    _streamController.close();
    _streamController = StreamController();
    cancelDownload();
  }

  void cancelDownload() {
    if (_uploadTask?.snapshot.state == firebase_storage.TaskState.running) {
      try {
        _uploadTask!.cancel();
      } on firebase_storage.FirebaseException {
        log.e(firebase_storage.FirebaseException);
      } catch (e) {
        log.e(e.toString());
      }
    }
  }

  Future<void> deleteMedia(String url) async {
    log.i('url:$url');
    try {
      await firebase_storage.FirebaseStorage.instance
          .refFromURL(
            url,
          )
          .delete();
    } catch (e) {
      log.e(e);
    }
  }
}
