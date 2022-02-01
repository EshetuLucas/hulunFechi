import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/enums/group.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/preference/preference_viewmodel.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_category.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfechi_tags.dart';
import 'package:stacked/stacked.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      viewModelBuilder: () => PreferenceViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              title: 'Save',
              onTap: model.onPost,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: hulunfechiAppbar(
          title: 'Pereferences',
          onBackButtonTap: model.onBack,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            onTap: model.onPickCountry,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: Container(),
                        ),
                        horizontalSpaceSmall,
                        horizontalSpaceSmall,
                      ],
                    )
                  ],
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
                    horizontalSpaceSmall,
                  ]
                ]),
              ),
              verticalSpaceMedium,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Wrap(
                  children: [
                    for (int i = 0; i < model.sectorPlatforms.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () => model.onSelectPreference(i),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 0.4,
                              color: !model.selectedIndex[model.currentIndex]
                                      .contains(i)
                                  ? kcDarkGreyColor
                                  : kcPrimaryColor,
                            )),
                            child: Material(
                              color: model.selectedIndex[model.currentIndex]
                                      .contains(i)
                                  ? kcPrimaryColor
                                  : kcWhite,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  model.platforms[i].name,
                                  style: model.selectedIndex[model.currentIndex]
                                          .contains(i)
                                      ? ktsDarkSmallTextStyle.copyWith(
                                          color: kcWhite)
                                      : ktsDarkSmallTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
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
