import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/post.dart';
import 'package:stacked/stacked.dart';

import 'following_viewmodel.dart';

class FollowingView extends StatelessWidget {
  const FollowingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FollowingViewModel>.reactive(
      viewModelBuilder: () => FollowingViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: hulunfechiAppbar(
            title: 'Followings',
            onBackButtonTap: model.onBack,
          ),
          body: model.followings.isEmpty
              ? Center(
                  child: Text('You are not following any one'),
                )
              : Padding(
                  padding: appSymmetricEdgePadding,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shrinkWrap: true,
                    itemCount: model.followings.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = model.followings[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            ProfilePic(
                              height: 60,
                              width: 60,
                              loading: false,
                              url: user.ssn ??
                                  'assets/images/entertainers_images/person.jpeg',
                            ),
                            horizontalSpaceSmall,
                            Column(
                              children: [
                                SkeletonLoader(
                                  startColor: kcLightGrey3,
                                  endColor: kcWhite,
                                  loading: false,
                                  child: Text(
                                    user.firstname,
                                  ),
                                ),
                                verticalSpaceTiny,
                                SkeletonLoader(
                                  startColor: kcLightGrey3,
                                  endColor: kcWhite,
                                  loading: false,
                                  child: Text(
                                    user.profession ?? '',
                                    style: ktsGreenBoldTextStyle.copyWith(
                                        fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              child: SizedBox(
                                width: 100,
                                height: 41,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  elevation: 8,
                                  child: SkeletonLoader(
                                    startColor: kcLightGrey3,
                                    endColor: kcWhite,
                                    loading: false,
                                    child: AppButton(
                                      busy:
                                          model.busy(FOLLOW_BUTTON_BUSY_KEY) &&
                                              index == model.busyIndex,
                                      title: 'Following',
                                      onTap: () => model.onFollow(user, index),
                                      shadow: false,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
