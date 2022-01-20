import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/entertainers/entertainers_viewmodel.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'comment_viewmodel.dart';

const IconData send = IconData(
  0xe571,
  fontFamily: 'MaterialIcons',
  matchTextDirection: true,
);
List fakeComments = [
  FAKE_COMMENT.copyWith(
      comment:
          'sdjf;dlsfjd;jf;dsfjlsdjf;ldsjf;ldsjf;ldsjf;ldskfl;dsjfl;dsjf;ldsjfl;dsjfl;dsjfl;dsjf;dsajf;dsjfl;dsjf;jdsfjlds;fjl;dsjfl;'),
  FAKE_COMMENT,
  FAKE_COMMENT.copyWith(comment: ''),
  FAKE_COMMENT1,
  FAKE_COMMENT.copyWith(comment: ''),
  FAKE_COMMENT1,
  FAKE_COMMENT,
  FAKE_COMMENT.copyWith(comment: ''),
  FAKE_COMMENT,
  FAKE_COMMENT1,
  FAKE_COMMENT1,
];

class CommentView extends StatelessWidget {
  const CommentView({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentViewModel>.reactive(
      viewModelBuilder: () => CommentViewModel(post),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: hulunfechiAppbar(
          title: post.user.firstname + "'s Post",
          onBackButtonTap: model.onBack,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: SafeArea(
          child: _WriteComment(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
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
              RefreshIndicator(
                onRefresh: model.initialise,
                backgroundColor: kcBackgroundColor,
                color: kcPrimaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    model.hasError
                        ? GestureDetector(
                            onTap: model.initialise,
                            child: Center(
                              child: Text(
                                'Something went wrong.\nTap to Try again',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              !model.isBusy && model.listOnScreen.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No Comments Yet!\nBe first to comment 😊',
                                        style: ktsButtonTitleTextStyle.copyWith(
                                          color: kcDarkGreyColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      separatorBuilder: (context, index) =>
                                          Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Container(),
                                      ),
                                      itemCount: model.isBusy
                                          ? fakeComments.length
                                          : model.listOnScreen.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: appSymmetricEdgePadding,
                                            child: SkeletonLoader(
                                              startColor: kcLightGrey3,
                                              endColor: kcWhite,
                                              loading: model.isBusy,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.only(top: 4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      color: kcLightGrey5,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 4,
                                                                  horizontal:
                                                                      6),
                                                          child: Text(
                                                            model.isBusy
                                                                ? '  N     '
                                                                : model
                                                                        .listOnScreen[
                                                                            index]
                                                                        .user
                                                                        .firstname +
                                                                    model
                                                                        .listOnScreen[
                                                                            index]
                                                                        .user
                                                                        .lastname,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            model.isBusy
                                                                ? fakeComments[
                                                                        index]
                                                                    .comment
                                                                : model
                                                                    .listOnScreen[
                                                                        index]
                                                                    .comment,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (index ==
                                                          model.listOnScreen
                                                                  .length -
                                                              1 &&
                                                      model.busy(
                                                          ADD_COMMENT_BUSY_KEY))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  kcPrimaryColor,
                                                            )),
                                                      ),
                                                    )
                                                ],
                                              ),
                                            )

                                            //  PostWidget(
                                            //     loading: model.isBusy ||
                                            //         model.busy(POST_BUSY_KEY),
                                            //     post: model.isBusy ||
                                            //             model.busy(
                                            //                 POST_BUSY_KEY)
                                            //         ? _FAKE_POSTS[index]
                                            //         : model
                                            //             .listOnScreen[index],
                                            //     onComment: () =>
                                            //         model.onComment(
                                            //             model.listOnScreen[
                                            //                 index])),
                                            );
                                      },
                                    ),
                              //_Others()
                            ],
                          ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WriteComment extends HookViewModelWidget<CommentViewModel> {
  const _WriteComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, CommentViewModel model) {
    final commentController = useTextEditingController();
    return Padding(
        padding: appSymmetricEdgePadding,
        child: Container(
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  onChanged: model.onChange,
                  textInputAction: TextInputAction.done,
                  hasFocusedBorder: true,
                  controller: commentController,
                  placeholder: 'Write your comment',
                ),
              ),
              horizontalSpaceMedium,
              GestureDetector(
                onTap: () {
                  commentController.text = '';

                  FocusScope.of(context).unfocus();
                  model.onComment();
                },
                child: Icon(
                  send,
                  color: model.commentText.trim().isNotEmpty
                      ? kcPrimaryColor
                      : kcLightGrey,
                ),
              ),
              horizontalSpaceTiny,
            ],
          ),
        ));
  }
}
