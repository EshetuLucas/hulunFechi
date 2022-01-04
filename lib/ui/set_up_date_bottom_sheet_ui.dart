// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:jester/app/locator.dart';
// import 'package:jester/enums/bottom_sheet_type.dart';
// import 'package:jester/ui/shared/app_colors.dart';
// import 'package:jester/ui/shared/shared_styles.dart';
// import 'package:jester/ui/views/entertainer_details/entertainer_details_view.dart';
// import 'package:jester/ui/widgets/dumb_widgets/expanding_app_button.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'shared/ui_helpers.dart';
// import 'views/custom day picker/custom_day_picker_view.dart';
// import 'views/entertainer_details/entertainer_details_viewmodel.dart';

// void setupBottomSheetUi() {
//   final bottomSheetService = locator<BottomSheetService>();

//   final builders = {
//     BottomSheetType.floating: (context, sheetRequest, completer) =>
//         _DateBottomSheet(request: sheetRequest, completer: completer)
//   };

//   bottomSheetService.setCustomSheetBuilders(builders);
// }

// class _DateBottomSheet extends StatelessWidget {
//   final SheetRequest request;
//   final Function(SheetResponse) completer;
//   const _DateBottomSheet({
//     Key key,
//     this.request,
//     this.completer,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<EntertainerDetailsViewModel>.reactive(
//         viewModelBuilder: () => EntertainerDetailsViewModel(),
//         builder: (context, model, child) => Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: commonHorizontalPadding10,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       child: Icon(
//                         Icons.minimize_outlined,
//                         color: kcLightGrey,
//                         size: 30,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         if (request.title == "Select time of Appointment")
//                           IconButton(
//                               icon: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.black,
//                               ),
//                               onPressed: model.onBackButtonTap),
//                         Container(
//                           alignment: Alignment.topCenter,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               request.title,
//                               style: ktsLargDarkTextStyle,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     verticalSpaceMedium,
//                     request.title == "Select date of Gig"
//                         ? Column(
//                             children: [
//                               SizedBox(
//                                 height: 400,
//                                 child: Padding(
//                                   padding: commonHorizontalPadding10,
//                                   child: CustomDayPicker(
//                                     daysContainerBackgroundColor: Colors.white,
//                                     daysTextStyle: ktsButtonTitleTextStyle,
//                                     monthsTextStyle: kcDarkGreyColor,
//                                     onChanged: (value) =>
//                                         {model.setAppointmentDate(value)},
//                                   ),
//                                 ),
//                               ),
//                               Divider(),
//                               verticalSpaceSmall,
//                               Padding(
//                                 padding: commonHorizontalPadding10,
//                                 child: GestureDetector(
//                                   onTap: () => model.showDateCustomBottomSheet(
//                                       true, "Select time of Appointment"),
//                                   child: ExpandingAppButton(
//                                     title: "Book Appointment",
//                                     color: model.appointmentDate != ""
//                                         ? kcPrimaryColor
//                                         : kcLightGrey2,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : request.title == "Select time of Appointment"
//                             ? Column(children: [
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Padding(
//                                     padding: commonHorizontalPadding10,
//                                     child: Text(
//                                       "From",
//                                       style: ktsLightGreySmallTextStyle,
//                                     ),
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => model.onToFromTap(),
//                                   child: DateTimeContainer(
//                                     text: model.fromTime,
//                                     enable: model.enableFromTime,
//                                   ),
//                                 ),
//                                 verticalSpaceMedium,
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Padding(
//                                     padding: commonHorizontalPadding10,
//                                     child: Text(
//                                       "To",
//                                       style: ktsLightGreySmallTextStyle,
//                                     ),
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => model.onToTimeTap(),
//                                   child: DateTimeContainer(
//                                       text: model.toTime,
//                                       enable: model.enableToTime),
//                                 ),
//                                 verticalSpaceMedium,
//                                 Divider(),
//                                 GestureDetector(
//                                   onTap: () {
//                                     model.onBackButtonTap();
//                                     model.onBackButtonTap();
//                                     model.showDateCustomBottomSheet(true, "");
//                                   },
//                                   child: Padding(
//                                     padding: commonHorizontalPadding10,
//                                     child: ExpandingAppButton(
//                                       title: "Book this Gig",
//                                       color: model.enableBookThisGigButton()
//                                           ? kcPrimaryColor
//                                           : kcLightGrey2,
//                                     ),
//                                   ),
//                                 ),
//                                 verticalSpaceSmall,
//                                 SizedBox(
//                                   height: 250,
//                                   child: CupertinoDatePicker(
//                                     initialDateTime: model.dateTime,
//                                     minimumDate: DateTime(
//                                         model.dateTime.year,
//                                         model.dateTime.month,
//                                         model.dateTime.day),
//                                     mode: CupertinoDatePickerMode.time,
//                                     onDateTimeChanged: (DateTime _dataTime) =>
//                                         model.setFromToTime(_dataTime),
//                                   ),
//                                 ),
//                               ])
//                             : request.title == "Error"
//                                 ? Column(
//                                     children: [
//                                       Text(
//                                         "Error! try again",
//                                         style: ktsBoldMeidumDarkTextStyle,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(40.0),
//                                         child: Center(
//                                           child: Icon(Icons.close,
//                                               size: 120, color: Colors.red),
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           model.onBackButtonTap();
//                                         },
//                                         child: Padding(
//                                           padding: commonHorizontalPadding10,
//                                           child: ExpandingAppButton(
//                                               enabled: true,
//                                               title: "Ok",
//                                               color: Colors.red),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 : Column(
//                                     children: [
//                                       Text(
//                                         "Appointment Succesfully Boooked!",
//                                         style: ktsBoldMeidumDarkTextStyle,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(40.0),
//                                         child: Center(
//                                           child: Icon(Icons.check_circle,
//                                               size: 120, color: kcPrimaryColor),
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           model.onBackButtonTap();
//                                         },
//                                         child: Padding(
//                                           padding: commonHorizontalPadding10,
//                                           child: ExpandingAppButton(
//                                               enabled: true,
//                                               title: "Ok",
//                                               color: kcPrimaryColor),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                     verticalSpaceMedium,
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
