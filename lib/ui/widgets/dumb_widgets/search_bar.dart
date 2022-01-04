import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchBar({
    required this.loading,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: kcWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        elevation: 5,
        child: SkeletonLoader(
          startColor: kcLightGrey3,
          endColor: kcWhite,
          loading: loading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: kcPrimaryColor,
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: InputField(
                    controller: controller,
                    placeholder: 'Search',
                    hasInputDecoration: false,
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
