import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/action_item.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'media_uploading_sheetmodel.dart';

class MediaUploadBottomSheet extends StatelessWidget {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  MediaUploadBottomSheet({
    Key? key,
    this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MediaUploadingViewModel>.reactive(
      builder: (context, model, child) => Container(
        height: 260,
        decoration: BoxDecoration(
          color: kcAppBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: _Header(
          event: request.data,
          completer: completer,
          request: request,
        ),
      ),
      viewModelBuilder: () => MediaUploadingViewModel(),
    );
  }
}

class _Header extends ViewModelWidget<MediaUploadingViewModel> {
  const _Header({
    required this.event,
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);
  final Event event;
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, MediaUploadingViewModel model) {
    return Stack(children: [
      SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 4,
                    width: 40,
                    color: kcDarkGreyColor,
                  ),
                ),
              ),
              verticalSpaceMedium,
              ActionsItem(
                title: 'Take from camera',
                iconData: Icons.camera_alt_outlined,
                hasTrailingIcon: false,
                onTap: () => completer?.call(SheetResponse(data: 0)),
              ),
              verticalSpaceSmall,
              AppDivider(),
              ActionsItem(
                title: 'Select from file',
                iconData: Icons.file_copy_rounded,
                hasTrailingIcon: false,
                onTap: () => completer?.call(SheetResponse(data: 0)),
              ),
            ],
          ),
        ),
      ),
      // if (model.isBusy)
      //   Material(
      //     color: kcDarkBlueBlack.withOpacity(0.7),
      //     child: Align(
      //       alignment: Alignment.center,
      //       child: CircularProgressIndicator(
      //         color: kcPrimaryColor,
      //       ),
      //     ),
      //   )
    ]);
  }
}
