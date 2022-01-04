import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/event_list_view.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfetchi_skeleton_loader.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'category_viewmodel.dart';

const double TEXTHEIGH = 20;
const double TEXTWIDTH = 100;

class CategoriesView extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  final int eventCategoryId;
  CategoriesView({required this.eventCategoryId, Key? key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () =>
          CategoryViewModel(eventCategoryId: eventCategoryId.toString()),
      builder: (context, model, child) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            children: [
              hulunfechiAppbar(
                title: 'Category',
                onBackButtonTap: model.onBackButtonTap,
              ),
              verticalSpaceSmall,
              SearchBar(
                loading: false,
                controller: searchController,
              ),
              verticalSpaceSmall,
              // _Category(
              //   title: "Entertainment",
              //   width: 160,
              // ),
              verticalSpaceSmall,
              Row(
                children: [
                  _Category(
                    title: "ALL",
                    width: 65,
                  ),
                  horizontalSpaceSmall,
                  _Category(
                    title: "LOCATION",
                    width: 160,
                  ),
                  horizontalSpaceSmall,
                  _Category(
                    title: "DATE",
                    width: 80,
                  ),
                  horizontalSpaceSmall,
                ],
              ),
              verticalSpaceTiny,
              Expanded(
                child: model.hasError
                    ? GestureDetector(
                        onTap: model.initialise,
                        child: Center(
                          child: Text(
                            'Something went wrong.\nTap to Try again',
                            style: ktsWhiteSmallTextStyle.copyWith(
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : _Events(
                        eventTitle: "",
                        data: model.listToShow,
                      ),
              ),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kcAppBackgroundColor,
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class _Events extends ViewModelWidget<CategoryViewModel> {
  final String eventTitle;
  final List<Event> data;

  const _Events({
    required this.eventTitle,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel model) {
    return !model.hasEvent && !model.isBusy
        ? Center(
            child: Text(
              "No Events yet!",
              style: ktsWhiteSmallTextStyle,
            ),
          )
        : EventListView(
            isLoading: model.isBusy,
            event: model.listToShow,
            onTap: model.onEventTap,
          );
  }
}

class _Category extends ViewModelWidget<CategoryViewModel> {
  const _Category({
    required this.title,
    required this.width,
    Key? key,
  }) : super(key: key);

  final String title;

  final double width;

  @override
  Widget build(BuildContext context, CategoryViewModel model) {
    return hulunfechiSkeletonLoader(
        startColor: kcAppBackgroundColor,
        endColor: kcItemsBackground,
        loading: model.isBusy,
        height: 30,
        width: width,
        borderRadius: 15.0,
        child: GestureDetector(
          // onTap: () => model.onCategoryTap(),
          child: Card(
            color: kcItemsBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 3,
            shadowColor: kcDarkGreyColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: ktsWhiteSmallTextStyle,
                  ),
                  horizontalSpaceTiny,
                  Icon(
                    Icons.arrow_drop_down,
                    color: kcPrimaryColor,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
