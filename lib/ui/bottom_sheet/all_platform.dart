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

import 'event_detail_more_sheetmodel.dart';

class AllPlatformBottomSheet extends StatelessWidget {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  AllPlatformBottomSheet({
    Key? key,
    this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventOptionsBottomSheetViewModel>.reactive(
      builder: (context, model, child) => Container(
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
      viewModelBuilder: () =>
          EventOptionsBottomSheetViewModel(event: request.data),
    );
  }
}

class _Header extends ViewModelWidget<EventOptionsBottomSheetViewModel> {
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
  Widget build(BuildContext context, EventOptionsBottomSheetViewModel model) {
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
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: request.customData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return AppDivider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ActionsItem(
                      title: request.customData[index],
                      iconData: Icons.ac_unit,
                      hasTrailingIcon: false,
                      onTap: () => completer?.call(SheetResponse(data: index)),
                    );
                  },
                ),
              ),
              verticalSpaceSmall,
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
