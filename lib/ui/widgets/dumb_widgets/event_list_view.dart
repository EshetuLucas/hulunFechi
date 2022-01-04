import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/views/category_view/category_view.dart';

import 'hulunfetchi_skeleton_loader.dart';

Event _FAKE_EVENT = Event(
  id: 1,
  eventName: "eventName",
  eventDescription: "eventDescription",
  beginDate: "beginDate",
  endDate: "endDate",
  ticketingBeginDate: "ticketingBeginDate",
  ticketingEndDate: "ticketingEndDate",
  eventCategory: "eventCategory",
  eventCategoryId: "eventCategoryId",
  eventType: "eventType",
  organizerName: "organizerName",
);

class EventListView extends StatelessWidget {
  const EventListView(
      {required this.isLoading,
      required this.event,
      required this.onTap,
      Key? key})
      : super(key: key);
  final bool isLoading;
  final List<Event> event;
  final ValueChanged<Event> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: isLoading ? 10 : event.length,
      itemBuilder: (BuildContext context, int index) {
        return _Events(
            isLoading: isLoading,
            onTap: onTap,
            event: !isLoading ? event[index] : _FAKE_EVENT,
            index: index);
      },
    );
  }
}

class _Events extends StatelessWidget {
  const _Events({
    Key? key,
    required this.isLoading,
    required this.onTap,
    required this.event,
    required this.index,
  }) : super(key: key);

  final bool isLoading;
  final ValueChanged<Event> onTap;
  final Event event;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isLoading ? null : onTap(event),
      child: SizedBox(
        height: 205,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Card(
            color: kcItemsBackground,
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                hulunfechiSkeletonLoader(
                  startColor: kcAppBackgroundColor,
                  endColor: kcItemsBackground,
                  loading: isLoading,
                  width: 150,
                  height: 210,
                  child: Hero(
                    tag: !isLoading ? event.id : index,
                    child: Image.asset(
                      "assets/images/entertainers_images/sample.jpg",
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          hulunfechiSkeletonLoader(
                            startColor: kcAppBackgroundColor,
                            endColor: kcItemsBackground,
                            loading: isLoading,
                            width: TEXTWIDTH,
                            height: TEXTHEIGH,
                            child: Hero(
                              tag:
                                  '${event.eventName} ${!isLoading ? event.id : index}',
                              child: Text(
                                event.eventName,
                                style: ktsWhiteMediumTextStyle.copyWith(
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          verticalSpaceTiny,
                          hulunfechiSkeletonLoader(
                            startColor: kcAppBackgroundColor,
                            endColor: kcItemsBackground,
                            loading: isLoading,
                            width: TEXTWIDTH,
                            height: TEXTHEIGH,
                            child: Text(
                              "Addis Ababa",
                              style: ktsWhiteSmallTextStyle,
                            ),
                          ),
                          verticalSpaceTiny,
                          hulunfechiSkeletonLoader(
                            startColor: kcAppBackgroundColor,
                            endColor: kcItemsBackground,
                            loading: isLoading,
                            width: TEXTWIDTH,
                            height: TEXTHEIGH,
                            child: Text(
                              event.beginDate,
                              style: ktsWhiteSmallTextStyle,
                            ),
                          ),
                          verticalSpaceTiny,
                          hulunfechiSkeletonLoader(
                            startColor: kcAppBackgroundColor,
                            endColor: kcItemsBackground,
                            loading: isLoading,
                            width: TEXTWIDTH,
                            height: 25,
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: kcAppBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Starts at 09:00 PM"),
                              ),
                            ),
                          ),
                          verticalSpaceTiny,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
