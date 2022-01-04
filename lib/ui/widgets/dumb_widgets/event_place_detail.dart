import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';

/// This widget is shared among different view
class EventPlaceDetail extends StatelessWidget {
  const EventPlaceDetail(
      {required this.date,
      required this.time,
      required this.location,
      required this.locationSubTitle,
      Key? key})
      : super(key: key);
  final String date;
  final String time;
  final String locationSubTitle;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDivider(),
        _BookingSummaryDetailItems(
          title: "Date",
          subTitle: date,
          iconData: Icons.date_range,
        ),
        AppDivider(),
        _BookingSummaryDetailItems(
          title: "Time",
          subTitle: 'Starts at $time',
          iconData: Icons.schedule,
        ),
        AppDivider(),
        _BookingSummaryDetailItems(
          title: "Location",
          subTitle: location,
          subSubTitle: locationSubTitle,
          iconData: Icons.location_on_outlined,
        ),
      ],
    );
  }
}

class _BookingSummaryDetailItems extends StatelessWidget {
  const _BookingSummaryDetailItems({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.subSubTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final IconData iconData;
  final String? subSubTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: kcPrimaryColor,
                size: 18,
              ),
              horizontalSpaceSmall,
              Text(
                title,
                style: ktsWhiteMediumTextStyle,
              )
            ],
          ),
          verticalSpaceTiny,
          Text(
            subTitle,
            style: ktsSmallWhiteTextStyle.copyWith(fontSize: 13),
          ),
          if (subSubTitle != null)
            Text(
              "$subSubTitle",
              style: ktsSmallWhiteTextStyle.copyWith(
                fontSize: 11,
              ),
            ),
        ],
      ),
    );
  }
}
