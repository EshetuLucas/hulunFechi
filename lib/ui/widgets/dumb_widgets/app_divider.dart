import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({this.color = kcMediumGrey, Key? key}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: 1,
      height: 5.0,
    );
  }
}
