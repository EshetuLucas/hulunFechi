import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/enums/bottom_sheet_type.dart';
import 'package:hulunfechi/ui/bottom_sheet/all_platform.dart';
import 'package:hulunfechi/ui/bottom_sheet/country_picker.dart';
import 'package:hulunfechi/ui/bottom_sheet/date_picker.dart';
import 'package:hulunfechi/ui/bottom_sheet/filter/filter_sheet.dart';
import 'package:hulunfechi/ui/bottom_sheet/media_uploading/media_uploading_sheet.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.EVENT_MORE_TYPE: (context, sheetRequest, completer) =>
        AllPlatformBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.FILTER: (context, sheetRequest, completer) =>
        FilterBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.DATE_PICKER: (context, sheetRequest, completer) =>
        DatePickerBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.MEDIA_UPLOADING: (context, sheetRequest, completer) =>
        MediaUploadBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
    BottomSheetType.COUNTRY_PICKER: (context, sheetRequest, completer) =>
        CountryPickerBottomSheet(
          completer: completer,
          request: sheetRequest,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
