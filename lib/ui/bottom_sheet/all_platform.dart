import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/action_item.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'all_platform_model.dart';
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
    return ViewModelBuilder<AllPlatformBottomSheetModel>.reactive(
      builder: (context, model, child) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kcAppBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Scaffold(
          floatingActionButton: request.mainButtonTitle != null
              ? Padding(
                  padding: appSymmetricEdgePadding,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppButton(
                      title: 'Done',
                      onTap: () => completer
                          ?.call(SheetResponse(data: model.selectedValue)),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: _Header(
            event: request.data,
            completer: completer,
            request: request,
          ),
        ),
      ),
      viewModelBuilder: () => AllPlatformBottomSheetModel(),
    );
  }
}

class _Header extends ViewModelWidget<AllPlatformBottomSheetModel> {
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
  Widget build(BuildContext context, AllPlatformBottomSheetModel model) {
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  request.title ?? 'Select from the list',
                  style: ktsMediumDarkTextStyle.copyWith(
                      color: kcDarkGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
              verticalSpaceTiny,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                      bottom: request.mainButtonTitle != null ? 60 : 5),
                  shrinkWrap: true,
                  itemCount: request.customData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return AppDivider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Expanded(
                          child: ActionsItem(
                            title: request.customData[index].name,
                            iconData: Icons.ac_unit,
                            hasTrailingIcon: false,
                            onTap: () => request.mainButtonTitle != null
                                ? model.onSelected(index)
                                : completer?.call(
                                    SheetResponse(data: index),
                                  ),
                          ),
                        ),
                        if (request.mainButtonTitle != null)
                          Checkbox(
                            side: BorderSide(color: kcPrimaryColor),
                            focusColor: kcPrimaryColor,
                            activeColor: kcPrimaryColor,
                            value: model.selectedValue.contains(index),
                            onChanged: (value) => model.onSelected(index),
                          ),
                      ],
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
