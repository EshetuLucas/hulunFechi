import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';

import 'comment_viewmodel.dart';

class CommentView extends StatelessWidget {
  const CommentView({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentViewModel>.reactive(
      viewModelBuilder: () => CommentViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: post.user.firstname + "'s Post",
          onBackButtonTap: model.onBack,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: appSymmetricEdgePadding,
                child: Text(
                  post.title,
                  style: ktsDarkSmallTextStyle,
                ),
              ),
              verticalSpaceTiny,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Text(
                  post.description,
                  style: ktsLightGreyMeidumTextStyle.copyWith(
                      color: kcDarkGreyColor.withOpacity(0.7)),
                ),
              ),
              verticalSpaceMedium,
              AppDivider(
                color: kcBackgroundColor.withOpacity(0.2),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
