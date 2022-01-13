import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';

class AppButton extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Function onTap;
  final bool enabled;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final bool busy;
  final bool isOutlined;
  final bool shadow;
  final TextStyle enablebuttonTextStyle;
  final TextStyle disablebuttonTextStyle;
  final bool showButton;
  final Widget? leadingWidget;

  const AppButton(
      {Key? key,
      required this.title,
      this.enabled = true,
      this.busy = false,
      this.isOutlined = false,
      this.backgroundColor = kcPrimaryColor,
      this.textColor = kcWhite,
      this.shadow = true,
      this.height = 54,
      this.enablebuttonTextStyle = ktsButtonTextTextStyle,
      this.disablebuttonTextStyle = ktsWhiteSmallTextStyle,
      required this.onTap,
      this.showButton = true,
      this.subTitle,
      this.leadingWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double ButtonHeight = screenHeight(context);

    return GestureDetector(
      onTap: () => enabled && !busy ? onTap() : null,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.transparent
              : enabled
                  ? backgroundColor
                  : backgroundColor,
          border: isOutlined
              ? Border.all(color: backgroundColor)
              : Border.all(color: kcPrimaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(54.0),
          ),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
              : [],
        ),
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 150),
          crossFadeState:
              busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: SizedBox(
              width: height - 10,
              height: height - 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: kcWhite,
                ),
              )),
          secondChild: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                leadingWidget ?? SizedBox.shrink(),
                if (leadingWidget != null) horizontalSpaceSmall,
                Text(
                  title,
                  style: enabled
                      ? enablebuttonTextStyle.copyWith(
                          color: textColor, fontSize: 20)
                      : disablebuttonTextStyle,
                  textAlign: TextAlign.center,
                ),
                if (subTitle != null)
                  SizedBox(
                    height: 3,
                  ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: enabled
                        ? enablebuttonTextStyle.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)
                        : disablebuttonTextStyle.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hulunfechi/ui/shared/app_colors.dart';
// import 'package:hulunfechi/ui/shared/shared_styles.dart';

// /// The button used throughout the app.
// ///
// /// Can show a busy indicator.
// /// Can be disabled.
// class AppButton extends StatefulWidget {
//   final bool busy;
//   final String title;
//   final Function onPressed;
//   final bool enabled;
//   final Color? color;

//   const AppButton(
//       {Key? key,
//       required this.title,
//       required this.onPressed,
//       this.busy = false,
//       this.enabled = true,
//       this.color});

//   @override
//   _AppButtonState createState() => _AppButtonState();
// }

// class _AppButtonState extends State<AppButton> {
//   @override
//   Widget build(BuildContext context) {
//     // We wrap the container in a Row and a Column to force it to wrap it's inner child
//     // If we don't do this the button takes up the parents infinite dimension which is not what we want.
//     return GestureDetector(
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(
//             horizontal: widget.busy ? 10 : 25, vertical: widget.busy ? 10 : 10),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: kcLightBlue,
//           ),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: !widget.busy
//             ? Text(
//                 widget.title,
//                 style: ktsButtonTitleTextStyle,
//               )
//             : CircularProgressIndicator(
//                 strokeWidth: 2,
//                 valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColorDark),
//               ),
//       ),
//     );
//   }
// }
