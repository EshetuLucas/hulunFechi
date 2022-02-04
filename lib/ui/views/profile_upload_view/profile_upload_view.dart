import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:stacked/stacked.dart';
import 'profile_upload_viewmodel.dart';

const double _PlusIconDimensions = 50;

class ProfileUploadView extends StatelessWidget {
  const ProfileUploadView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileUploadViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          onBackButtonTap: model.goBack,
          title: 'Profile Picture',
        ),
        body: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: Text(
                    'Upload Profile Picture',
                    style: ktsDarkSmallTextStyle.copyWith(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpaceMedium,
                Spacer(),
                _ProfilePhotoHolder(
                  onTap: model.selectPhoto,
                  imageSelected: model.imageSelected,
                  selectedImage: model.selectedImage,
                ),
                Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: AppButton(
                    title: 'Upload',
                    onTap: () => model.onUpload(),
                    enabled: model.imageSelected,
                    busy: model.isBusy,
                  ),
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileUploadViewModel(),
    );
  }
}

class _ProfilePhotoHolder extends StatelessWidget {
  final void Function()? onTap;
  final bool imageSelected;
  final File selectedImage;
  const _ProfilePhotoHolder({
    Key? key,
    required this.onTap,
    required this.imageSelected,
    required this.selectedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double profilePicDimenstions = screenWidthFraction(context, dividedBy: 2);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        /// The width and heigh value should be equal which means the box should be square
        /// inorder to get perfect circle when Clipping the box (Circle's diameter/2 = height= width)
        /// unless the shape will be oval
        width: profilePicDimenstions,
        height: profilePicDimenstions,
        child: Stack(
          children: [
            Container(
              width: profilePicDimenstions,
              height: profilePicDimenstions,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: !imageSelected
                  ? Image.asset(
                      'assets/images/entertainers_images/person.jpeg',
                    )
                  : Image.file(selectedImage),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: profilePicDimenstions * 0.72,
                  top: profilePicDimenstions * 0.80,
                  bottom: 5),
              child: Container(
                padding: EdgeInsets.all(6),
                width: _PlusIconDimensions,
                height: _PlusIconDimensions,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcPrimaryColor,
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
