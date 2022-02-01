import 'dart:io';

import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/app/app.logger.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/enums/media_source_type_enum.dart';
import 'package:hulunfechi/services/media_services.dart';
import 'package:hulunfechi/services/user_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileUploadViewModel extends BaseViewModel {
  final log = getLogger('ProfileUploadViewModel');

  final _mediaService = locator<MediaService>();

  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool get imageSelected => _selectedImage != null;

  File? _selectedImage;

  File get selectedImage => _selectedImage ?? File('');

  Future<void> selectPhoto() async {
    log.i('');
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: false,
      variant: BottomSheetType.MEDIA_UPLOADING,
    );
    if (result != null) {
      try {
        _selectedImage = await runBusyFuture(
          _mediaService.pickMedia(
            mediaSourceType: result.data,
            isProfilePic: true,
            cropImage: true,
          ),
        );
      } catch (e) {
        log.e('Profile image select failed. $e');
        await _dialogService.showCustomDialog(
          variant: DialogType.ERROR,
          title: 'Something went wrong!',
          description: 'Please try again',
        );
      }
    }
  }

  Future<void> saveProfilePhoto() async {
    log.i('_selectedImage:$_selectedImage');
    setBusy(true);

    try {} catch (e) {
      log.e('Image upload failed. $e');

      await await _dialogService.showCustomDialog(
        variant: DialogType.ERROR,
        title: 'Something went wrong!',
        description: 'Please try again',
      );
    }

    setBusy(false);
  }

  void goBack() {
    _navigationService.back();
  }
}
