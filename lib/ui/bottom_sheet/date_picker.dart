import 'package:flutter/cupertino.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:stacked_services/stacked_services.dart';

class DatePickerBottomSheet extends StatelessWidget {
  final Function(SheetResponse<DateTime>) completer;
  final SheetRequest request;

  DatePickerBottomSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: kcWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
          Text(
            "Select Expire date and time",
            style: ktsDarkGreyTextStyle,
          ),
          verticalSpaceSmall,
          SizedBox(
            height: 2,
          ),
          verticalSpaceSmall,
          Expanded(
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    color: kcDarkGreyColor,
                    fontSize: 18,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                minimumDate: DateTime.now(),
                onDateTimeChanged: (DateTime dateTime) =>
                    {_selectedDate = dateTime},
              ),
            ),
          ),
          verticalSpaceSmall,
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: AppButton(
                title: "Done",
                onTap: () {
                  // model.setSelectedDate();
                  completer.call(SheetResponse(data: _selectedDate));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
