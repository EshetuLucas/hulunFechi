import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function()? onClose;
  const SearchBar({
    this.onChange,
    required this.loading,
    required this.controller,
    this.onClose,
    Key? key,
  }) : super(key: key);

  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
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
                  size: 20,
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: InputField(
                    textInputAction: TextInputAction.done,
                    onChanged: onChange,
                    controller: controller,
                    placeholder: 'Search',
                    hasInputDecoration: false,
                  ),
                ),
                if (controller.text.isNotEmpty)
                  GestureDetector(
                    onTap: onClose,
                    child: Icon(
                      CupertinoIcons.clear,
                      color: kcPrimaryColor,
                      size: 20,
                    ),
                  ),
                horizontalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
