import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/app/app.constant.dart';
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
  PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              title: 'Post',
              onTap: model.onPost,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: hulunfechiAppbar(
          title: 'Add Post',
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
                  for (int i = 1; i < Group.values.length; i++) ...[
                    AppCategory(
                      loading: false,
                      text: Group.values[i].toShortString(),
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
                            onTap: () => showCountryPicker(
                              context: context,
                              onSelect: (Country country) {
                                model.updateTags(0, country.name);
                              },
                            ),
                          ),
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
                    placeholder: 'Subject',
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
                    textInputType: TextInputType.emailAddress,
                    isReadOnly: model.isBusy,
                    placeholder: 'Body',
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceMedium,
              verticalSpaceLarge
            ],
          ),
        ),
      ),
    );
  }
}
