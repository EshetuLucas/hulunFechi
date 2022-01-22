import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/country_list.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked_services/stacked_services.dart';

class CountryPickerBottomSheetArguments {
  final Function(Country)? onCountrySelected;
  final bool showDialCode;
  final bool showFlag;

  const CountryPickerBottomSheetArguments({
    this.onCountrySelected,
    this.showDialCode = true,
    this.showFlag = true,
  });
}

class CountryPickerBottomSheet extends StatefulWidget {
  final CountryPickerBottomSheetArguments args;
  final Function(SheetResponse<Country>) completer;
  final SheetRequest request;

  const CountryPickerBottomSheet({
    required this.completer,
    required this.request,
    Key? key,
    this.args = const CountryPickerBottomSheetArguments(),
  }) : super(key: key);

  @override
  _CountryPickerBottomSheetState createState() =>
      _CountryPickerBottomSheetState();
}

class _CountryPickerBottomSheetState extends State<CountryPickerBottomSheet> {
  List<Country> allCountries =
      COUNTRIES_LIST.map((country) => Country.fromJson(country)).toList();
  late List<Country> _filteredCountries = allCountries;

  late final TextEditingController _controller = TextEditingController()
    ..addListener(_handleQuery);

  void _handleQuery() {
    allCountries.forEach((element) {
      if (element.name == null) {
        print(element);
      }
    });
    final String query = _controller.text;
    print(query);
    if (query.isNotEmpty) {
      _filteredCountries = allCountries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredCountries = allCountries;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: kcAppBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SizedBox(
        height: screenHeight(context) * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
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
              Text(
                'Select Country',
                style: ktsMediumDarkTextStyle.copyWith(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              verticalSpaceMedium,
              InputField(
                hasFocusedBorder: true,
                placeholder: 'Search Country',
                prefixIcon: Icon(
                  Icons.search,
                  color: kcPrimaryColor,
                ),
                controller: _controller,
              ),
              verticalSpaceMedium,
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: _filteredCountries.length,
                  itemBuilder: (_, i) {
                    final country = _filteredCountries[i];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      onTap: () {
                        widget.completer.call(
                          SheetResponse(data: country),
                        );
                      },
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.args.showFlag) ...[
                            Image.asset(
                              'assets/icons/flags/' + country.flag,
                              width: 24,
                            ),
                            horizontalSpaceSmall,
                          ],
                          // Icon(
                          //   Icons.chevron_right_rounded,
                          //   color: theme.colors.white,
                          //   size: 20,
                          // )
                        ],
                      ),
                      title: Text(
                        country.name,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
