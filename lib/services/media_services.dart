import 'dart:io';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/enums/media_source_type_enum.dart';
import 'package:hulunfechi/services/user_service.dart';


import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'crop_image_service.dart';

class MediaService {
  final log = getLogger('MediaService');
  final _userService = locator<UserService>();
  final _cropImageService = locator<CropImageService>();

  Future<File?> pickMedia(
      {required MediaSourceType mediaSourceType,
      bool cropImage = false,
      bool isProfilePic = false}) async {
    File pickedFile = File('');
    switch (mediaSourceType) {
      case MediaSourceType.file:
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type:  FileType.image 
          allowCompression: true,
        );
        pickedFile = result != null
            ? File(result.files.single.path!)
            : throw Exception('We could not pick the selectedfile. Try again!');

        pickedFile = await _cropImageService.cropImage(pickedFile);

        break;
      case MediaSourceType.camera_image:
        final result =
            await ImagePicker().pickImage(source: ImageSource.camera);
        pickedFile = await getSelectedFile(result);

        pickedFile = await cropeImage(pickedFile);

        break;

      default:
        pickedFile = File('');
    }

    return pickedFile;
  }

  Future<File> cropeImage(File file) async {
    return await _cropImageService.cropImage(file);
  }

  Future<File> getSelectedFile(var result) async {
    return result != null
        ? File(result.path)
        : throw Exception('Something went wrong!');
  }
}
