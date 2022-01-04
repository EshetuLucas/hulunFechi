import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:stacked/stacked.dart';

class AppCategory extends StatelessWidget {
  const AppCategory({
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
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
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: kcWhite,
              border: borderActive
                  ? active
                      ? Border.all(color: kcPrimaryColor)
                      : null
                  : null,
            ),
            padding:
                padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              text,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: textStyle ??
                  (active
                      ? ktsGreenBoldTextStyle
                      : ktsDarkSmallTextStyle.copyWith(
                          color: kcDarkGreyColor.withOpacity(0.8))),
            ),
          ),
        ),
      ),
    );
  }
}
