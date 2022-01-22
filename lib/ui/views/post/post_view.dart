import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/group.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_category.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfechi_tags.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:hulunfechi/utils/date_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'post_view.form.dart';
import 'post_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "subject",
    ),
    FormTextField(
      name: "body",
    ),
  ],
)
class PostView extends StatelessWidget with $PostView {
  PostView({this.post, Key? key}) : super(key: key);
  final Post? post;

  @override
  Widget build(BuildContext context) {
    bool editMode = post != null;
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(post: post),
      onModelReady: (model) {
        if (post != null) {
          model.setData(
            model.formValueMap
              ..addAll({
                SubjectValueKey: post!.title,
                BodyValueKey: post!.description,
              }),
          );
          subjectController.text = post!.title;
          bodyController.text = post!.description;
        }
        model.setDatas();
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              title: editMode ? 'Save' : 'Post',
              onTap: model.onPost,
              busy: model.isBusy,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: hulunfechiAppbar(
          title: editMode ? 'Edit Post' : 'Add Post',
          onBackButtonTap: model.onBack,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: appSymmetricEdgePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Group',
                    style: ktsDarkGreyTextStyle,
                  ),
                ),
              ),
              verticalSpaceSmall,
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int i = 0; i < model.sectors.length; i++) ...[
                    AppCategory(
                      loading: false,
                      text: model.sectors[i].name,
                      onTap: () => model.setQucikFilterIndex(i),
                      active: model.currentIndex == i,
                    ),
                    horizontalSpaceSmall,
                  ]
                ]),
              ),
              verticalSpaceSmall,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Country',
                              style: ktsDarkGreyTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Platform',
                              style: ktsDarkGreyTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        horizontalSpaceSmall,
                        Expanded(
                          child: HulunfechiTag(
                              loading: false,
                              text: model.tags[0],
                              onTap: model.onPickCountry),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: HulunfechiTag(
                            loading: false,
                            text: model.tags[1],
                            onTap: model.onAllCountries,
                          ),
                        ),
                        horizontalSpaceSmall,
                        horizontalSpaceSmall,
                      ],
                    )
                  ],
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Category',
                              style: ktsDarkGreyTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Sub Category',
                              style: ktsDarkGreyTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        horizontalSpaceSmall,
                        Expanded(
                          child: HulunfechiTag(
                            loading: false,
                            text: model.categoriesTag[0],
                            onTap: () => model.onCategories(0),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: HulunfechiTag(
                            loading: false,
                            text: model.categoriesTag[1],
                            onTap: () => model.onCategories(1),
                          ),
                        ),
                        horizontalSpaceSmall,
                        horizontalSpaceSmall,
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Expires on',
                              style: ktsDarkGreyTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        horizontalSpaceSmall,
                        Expanded(
                          child: HulunfechiTag(
                            loading: false,
                            text: model.selectedTime != null
                                ? '${timeToWeekDay(model.selectedTime!) + '  ' + dateToStringTime(context, model.selectedTime!.toString()).toString()}'
                                : 'Select date',
                            onTap: model.onExpireDate,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(child: Container()),
                        horizontalSpaceSmall,
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InputField(
                    controller: subjectController,
                    maxLine: 1,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.emailAddress,
                    isReadOnly: model.isBusy,
                    nextFocusNode: FocusScope.of(context),
                    placeholder: 'Title',
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InputField(
                    controller: bodyController,
                    maxLine: 6,
                    hasFocusedBorder: true,
                    isReadOnly: model.isBusy,
                    placeholder: 'Description',
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.validationMessage,
                      style: TextStyle(
                        color: Colors.red.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceLarge
            ],
          ),
        ),
      ),
    );
  }
}
