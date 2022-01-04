import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: kcMediumGrey,
      thickness: 1,
      height: 5.0,
    );
  }
}
