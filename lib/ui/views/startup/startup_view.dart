import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      onModelReady: (model) => SchedulerBinding.instance!.addPostFrameCallback(
        (timeStamp) async {
          await model.runStartupLogic();
        },
      ),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }
}
