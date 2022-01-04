import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:like_button/like_button.dart';
import 'package:stacked/stacked.dart';

import 'app_button.dart';

class Post extends StatelessWidget {
  const Post({
    this.isMe = false,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  final bool isMe;
  final loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 2, 2, 3),
      child: Column(
        children: [
          // Text(
          //   '1 Day ago',
          //   style: ktsDarkGreyTextStyle,
          // ),
          Row(
            children: [
              _ProfilePic(
                loading: loading,
              ),
              horizontalSpaceSmall,
              Expanded(
                child: Column(
                  children: [
                    SkeletonLoader(
                      startColor: kcLightGrey3,
                      endColor: kcWhite,
                      loading: loading,
                      child: Text('Mahlet Abebe'),
                    ),
                    verticalSpaceTiny,
                    SkeletonLoader(
                      startColor: kcLightGrey3,
                      endColor: kcWhite,
                      loading: loading,
                      child: Text(
                        'Category | Sub-Category',
                        style: ktsGreenBoldTextStyle.copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              if (!isMe)
                SizedBox(
                  width: 85,
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
                      loading: loading,
                      child: AppButton(
                        title: '+ Follow',
                        onTap: () => null,
                        shadow: false,
                      ),
                    ),
                  ),
                )
              else
                Container(
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: kcPrimaryColor,
                  ),
                ),
            ],
          ),
          verticalSpaceMedium,
          SkeletonLoader(
            startColor: kcLightGrey3,
            endColor: kcWhite,
            loading: loading,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat lacinia finibus.'),
          ),
          verticalSpaceSmall,
          SkeletonLoader(
            startColor: kcLightGrey3,
            endColor: kcWhite,
            loading: loading,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat lacinia finibus. Morbi luctus sed urna nec sagittis. Proin posuere est convallis nisi congue, tincidunt facilisis mauris ultricies. Pellentesque efficitur et turpis a ultrices. Curabitur pellentesque, purus ut ultrices interdum, urna sapien iaculis libero, ut volutpat nisi lacus a justo. Fusce ac nisi dignissim, lacinia turpis quis, dignissim nulla. Vestibulum fringilla dui nisi, sit amet gravida eros molestie in.',
              style: ktsLightGreyMeidumTextStyle.copyWith(
                  color: kcDarkGreyColor.withOpacity(0.7)),
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  LikeButton(
                    size: 30,
                    circleColor:
                        CircleColor(start: kcPrimaryColor, end: kcPrimaryColor),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: kcPrimaryColor,
                      dotSecondaryColor: kcPrimaryColor,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.thumb_up_off_alt_outlined,
                        color: isLiked
                            ? kcPrimaryColor
                            : kcDarkGreyColor.withOpacity(0.8),
                        size: 26,
                      );
                    },
                    //likeCount: 98,
                  ),
                  horizontalSpaceSmall,
                  SkeletonLoader(
                    startColor: kcLightGrey3,
                    endColor: kcWhite,
                    loading: loading,
                    child: Text(
                      '1224',
                      style: ktsLightGreyMeidumTextStyle,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.bubble_middle_bottom,
                    color: kcDarkGreyColor,
                  ),
                  horizontalSpaceSmall,
                  SkeletonLoader(
                    startColor: kcLightGrey3,
                    endColor: kcWhite,
                    loading: loading,
                    child: Text(
                      '1524',
                      style: ktsLightGreyMeidumTextStyle,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.arrowshape_turn_up_right),
                  horizontalSpaceSmall,
                  SkeletonLoader(
                    startColor: kcLightGrey3,
                    endColor: kcWhite,
                    loading: loading,
                    child: Text(
                      '2466',
                      style: ktsLightGreyMeidumTextStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}

class _ProfilePic extends StatelessWidget {
  const _ProfilePic({
    required this.loading,
    Key? key,
  }) : super(key: key);

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0, right: 8),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SkeletonLoader(
              startColor: kcLightGrey3,
              endColor: kcWhite,
              loading: loading,
              child: Image.asset(
                "assets/images/entertainers_images/sample.jpg",
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
