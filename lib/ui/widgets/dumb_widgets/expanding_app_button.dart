import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';

/// The button used throughout the app.
///
/// Can show a busy indicator.
/// Can be disabled.
class ExpandingAppButton extends StatelessWidget {
  final bool busy;
  final String title;
  final double height;

  final bool enabled;
  final Color color;
  const ExpandingAppButton(
      {Key? key,
      required this.title,
      this.busy = false,
      this.enabled = true,
      this.height = 48,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Text(
        title,
        style: ktsWhiteMediumTextStyle,
      ),
    );
  }
}
