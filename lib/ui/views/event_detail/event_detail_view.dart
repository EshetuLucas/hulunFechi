import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/app_back_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/event_place_detail.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/expanding_app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:stacked/stacked.dart';
import 'event_detail_viewmodel.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({required this.event, Key? key}) : super(key: key);

  final Event event;

  Widget build(BuildContext context) {
    return ViewModelBuilder<EventDetailViewModel>.reactive(
      viewModelBuilder: () => EventDetailViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              // SliverAppBar(
              //   elevation: 0,
              //   stretch: true,
              //   pinned: true,
              //   expandedHeight: 300,
              //   collapsedHeight: 130,
              //   backgroundColor: kcAppBackgroundColor,
              //   automaticallyImplyLeading: false,
              // ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: halfScreenHeight(context),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: halfScreenHeight(context),
                              width: screenWidth(context),
                              child: Hero(
                                tag: event.id,
                                child: ImageBuilder(
                                  assetName:
                                      "assets/images/entertainers_images/sample.jpg",
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 20,
                                width: screenWidth(context),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: kcAppBackgroundColor,
                                      spreadRadius: 6,
                                      blurRadius: 10,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      kcAppBackgroundColor.withOpacity(0.02),
                                      kcAppBackgroundColor,
                                      kcAppBackgroundColor,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: _BackButton(
                                  event: event,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: appSymmetricEdgePadding,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Hero(
                                tag: '${event.id}${event.eventName}',
                                child: Text(
                                  event.eventName ?? '',
                                  style: ktsWhiteMediumTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _Organizer(event: event),
                      verticalSpaceSmall,
                      verticalSpaceMedium,
                      Padding(
                        padding: appSymmetricEdgePadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Price 400 -1000 ETB',
                                  style: ktsWhiteMediumTextStyle.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                horizontalSpaceLarge,
                                Expanded(
                                  child: ExpandingAppButton(
                                    height: 40,
                                    title: "Buy Tickets",
                                    color: kcPrimaryColor,
                                  ),
                                )
                              ],
                            ),
                            verticalSpaceSmall,
                            EventPlaceDetail(
                                date: event.beginDate,
                                time: '',
                                location: 'Addis Ababa',
                                locationSubTitle: 'Bole'),
                            verticalSpaceMedium,
                            Text(
                              'Event Description',
                              style: ktsWhiteMediumTextStyle,
                            ),
                            verticalSpaceSmall,
                            Text(
                              event.eventDescription ?? '',
                              style: ktsSmallWhiteTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            verticalSpaceMedium,
                            verticalSpaceMedium,
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Organizer extends StatelessWidget {
  const _Organizer({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 40,
      color: kcAppBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              child: SizedBox(
                height: 50,
                width: 50,
                child: ImageBuilder(
                  assetName:
                      "assets/images/entertainers_images/hulunfechi_logo.png",
                ),
              ),
            ),
            Text(
              'Organizer - ${event.organizerName}',
              style: ktsSmallWhiteTextStyle,
            ),
            Card(
              elevation: 20,
              color: kcPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '+Follow',
                    style: ktsWhiteSmallTextStyle.copyWith(
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends ViewModelWidget<EventDetailViewModel> {
  const _BackButton({
    required this.event,
    Key? key,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context, EventDetailViewModel model) {
    return Padding(
      padding: appSymmetricEdgePadding,
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kcBackgroundColor,
            ),
            child: AppBackButton(),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => model.onMoreTap(event),
            child: Container(
              height: 32,
              width: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcBackgroundColor,
              ),
              child: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          horizontalSpaceSmall,
        ],
      ),
    );
  }
}
