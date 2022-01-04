import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/views/category_view/category_viewmodel.dart';

import 'package:stacked/stacked.dart';

class EntertainersTitle extends ViewModelWidget<CategoryViewModel> {
  const EntertainersTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel model) {
    return Row(
      children: [
        horizontalSpaceSmall,
        Text(
          'Schedule a LiveBurst',
          style: ktsAppTitleTextStyle,
        ),
      ],
    );
  }
}
