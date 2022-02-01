import 'dart:io';

import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:image_cropper/image_cropper.dart';

class CropImageService {
  final log = getLogger('CropImageService');

  Future<File> cropImage(File image) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'hulunFechi',
          toolbarColor: kcPrimaryColor,
          toolbarWidgetColor: kcWhite,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true),
      iosUiSettings: IOSUiSettings(
        title: 'rapture',
      ),
    );

    image = croppedFile != null
        ? File(croppedFile.path)
        : throw Exception('We could not crop the image you selected');

    return image;
  }
}
