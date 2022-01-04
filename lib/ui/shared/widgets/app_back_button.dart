import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';

class AppBackButton extends StatelessWidget {
  final Function()? onTap;
  const AppBackButton({this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: kcPrimaryColor,
          size: 20,
        ),
      ),
    );
  }
}
