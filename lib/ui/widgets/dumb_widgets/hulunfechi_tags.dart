import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HulunfechiTag extends StatelessWidget {
  const HulunfechiTag({
    Key? key,
    required this.text,
    this.active = false,
    this.onTap,
    this.padding,
    this.height,
    this.width,
    this.textStyle,
    this.lighterVersion = false,
    this.alignment,
    this.borderActive = true,
    this.loading = false,
    this.hasDropDown = true,
  }) : super(key: key);

  final Alignment? alignment;
  final bool active;
  final Function()? onTap;
  final String text;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool lighterVersion;
  final bool borderActive;
  final bool loading;
  final bool hasDropDown;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          elevation: 3,
          child: SkeletonLoader(
            startColor: kcLightGrey3,
            endColor: kcWhite,
            loading: loading,
            child: Container(
              height: height,
              width: width,
              alignment: alignment,
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding:
                  padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FittedBox(
                child: Row(
                  children: [
                    Text(
                      text,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: ktsGreenBoldTextStyle.copyWith(fontSize: 16),
                    ),
                    horizontalSpaceSmall,
                    if (hasDropDown)
                      Icon(
                        Icons.expand_more_outlined,
                        color: kcPrimaryColor,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
