import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/bottom_sheet/filter/filter_sheetmodel.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/action_item.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_category.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../event_detail_more_sheetmodel.dart';

class FilterBottomSheet extends StatelessWidget {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  FilterBottomSheet({
    Key? key,
    this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterSheetViewModel>.reactive(
      builder: (context, model, child) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kcAppBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: _Header(event: request.data, completer: completer),
      ),
      viewModelBuilder: () => FilterSheetViewModel(),
    );
  }
}

class _Header extends ViewModelWidget<FilterSheetViewModel> {
  const _Header({
    required this.event,
    this.completer,
    Key? key,
  }) : super(key: key);
  final Event event;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, FilterSheetViewModel model) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: appSymmetricEdgePadding,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppButton(
            title: 'Done',
            onTap: model.onDone,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            AppCategory(
                              loading: false,
                              text: 'My preference',
                              onTap: () => model.onDone(),
                            ),
                            horizontalSpaceSmall,
                          ]),
                        ),
                        verticalSpaceMedium,
                        Text(
                          'Select Country',
                          style: ktsDarkGreyTextStyle,
                        ),
                        verticalSpaceSmall,
                        GestureDetector(
                          onTap: model.onPickCountry,
                          child: FittedBox(
                            child: Row(
                              children: [
                                horizontalSpaceMedium,
                                Text(
                                  model.tags[0],
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: ktsGreenBoldTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                horizontalSpaceSmall,
                                Icon(
                                  Icons.expand_more_outlined,
                                  color: kcPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppDivider(),
                        verticalSpaceMedium,
                        Text(
                          'Select Platform',
                          style: ktsDarkGreyTextStyle,
                        ),
                        verticalSpaceSmall,
                        GestureDetector(
                          onTap: () => model.onCategories(1),
                          child: FittedBox(
                            child: Row(
                              children: [
                                horizontalSpaceMedium,
                                Text(
                                  model.tags[1],
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: ktsGreenBoldTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                horizontalSpaceSmall,
                                Icon(
                                  Icons.expand_more_outlined,
                                  color: kcPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppDivider(),
                        verticalSpaceMedium,
                        Text(
                          'Select Category',
                          style: ktsDarkGreyTextStyle,
                        ),
                        verticalSpaceSmall,
                        GestureDetector(
                          onTap: () => model.onCategories(2),
                          child: FittedBox(
                            child: Row(
                              children: [
                                horizontalSpaceMedium,
                                Text(
                                  model.tags[2],
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: ktsGreenBoldTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                horizontalSpaceSmall,
                                Icon(
                                  Icons.expand_more_outlined,
                                  color: kcPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppDivider(),
                        verticalSpaceMedium,
                        Text(
                          'Select sub-category',
                          style: ktsDarkGreyTextStyle,
                        ),
                        verticalSpaceSmall,
                        GestureDetector(
                          onTap: () => model.onCategories(3),
                          child: FittedBox(
                            child: Row(
                              children: [
                                horizontalSpaceMedium,
                                Text(
                                  model.tags[3],
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: ktsGreenBoldTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                horizontalSpaceSmall,
                                Icon(
                                  Icons.expand_more_outlined,
                                  color: kcPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpaceLarge,
                        verticalSpaceLarge,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
