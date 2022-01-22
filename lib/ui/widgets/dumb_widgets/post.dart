import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:like_button/like_button.dart';
import 'package:stacked/stacked.dart';

import 'app_button.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    this.isMe = false,
    this.loading = false,
    required this.post,
    required this.onComment,
    required this.onLike,
    required this.onShare,
    this.onMore,
    required this.userId,
    Key? key,
  }) : super(key: key);

  final bool isMe;
  final loading;
  final Post post;
  final Function() onComment;
  final Function() onLike;
  final Function() onShare;
  final Function()? onMore;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 2, 2, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text(
                        post.user.firstname,
                      ),
                    ),
                    verticalSpaceTiny,
                    SkeletonLoader(
                      startColor: kcLightGrey3,
                      endColor: kcWhite,
                      loading: loading,
                      child: Text(
                        '${post.platform?.name ?? ''}'
                        ' | ${post.category?.name ?? ''} ',
                        style: ktsGreenBoldTextStyle.copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              if (post.user.id != userId)
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
                GestureDetector(
                  onTap: onMore,
                  child: Container(
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: kcPrimaryColor,
                    ),
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
              post.title,
              style: ktsDarkSmallTextStyle,
            ),
          ),
          verticalSpaceSmall,
          SkeletonLoader(
            startColor: kcLightGrey3,
            endColor: kcWhite,
            loading: loading,
            child: Text(
              post.description,
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
                  GestureDetector(
                    onTap: onLike,
                    child: LikeButton(
                      onTap: (value) {
                        onLike();
                        return Future.value(true);
                      },
                      size: 30,
                      circleColor: CircleColor(
                          start: kcPrimaryColor, end: kcPrimaryColor),
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
                  ),
                  horizontalSpaceSmall,
                  SkeletonLoader(
                    startColor: kcLightGrey3,
                    endColor: kcWhite,
                    loading: loading,
                    child: Text(
                      post.likes.toString(),
                      style: ktsLightGreyMeidumTextStyle,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: onComment,
                child: Row(
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
                        post.comments.toString(),
                        style: ktsLightGreyMeidumTextStyle,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: onShare,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.arrowshape_turn_up_right),
                    horizontalSpaceSmall,
                    SkeletonLoader(
                      startColor: kcLightGrey3,
                      endColor: kcWhite,
                      loading: loading,
                      child: Text(
                        post.shares.toString(),
                        style: ktsLightGreyMeidumTextStyle,
                      ),
                    )
                  ],
                ),
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
                "assets/images/entertainers_images/person.jpeg",
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
