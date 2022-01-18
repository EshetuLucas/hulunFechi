import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/enums/group.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_category.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfechi_tags.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfetchi_skeleton_loader.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/post.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/search_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'entertainers_viewmodel.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';

import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

List<Post> _FAKE_POSTS = [
  FAKE_POST,
  FAKE_POST1,
  FAKE_POST,
  FAKE_POST1,
  FAKE_POST,
  FAKE_POST1,
];

class EntertainersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntertainersViewModel>.reactive(
      viewModelBuilder: () => EntertainersViewModel(),
      builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            foregroundColor: kcWhite,
            backgroundColor: kcPrimaryColor,
            onPressed: model.onAddPost,
            child: Icon(Icons.add),
          ),
          backgroundColor: kcVeryLightGrey,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: model.initialise,
              backgroundColor: kcBackgroundColor,
              color: kcPrimaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  verticalSpaceSmall,
                  Expanded(
                    child: model.hasError
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
                              Expanded(
                                child: !model.isBusy &&
                                        model.listOnScreen.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No Posts Yet!',
                                          style:
                                              ktsButtonTitleTextStyle.copyWith(
                                            color: kcDarkGreyColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30),
                                          child: AppDivider(),
                                        ),
                                        itemCount: model.isBusy ||
                                                model.busy(POST_BUSY_KEY)
                                            ? 6
                                            : model.listOnScreen.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: appSymmetricEdgePadding,
                                            child: PostWidget(
                                                loading: model.isBusy ||
                                                    model.busy(POST_BUSY_KEY),
                                                post: model.isBusy ||
                                                        model
                                                            .busy(POST_BUSY_KEY)
                                                    ? _FAKE_POSTS[index]
                                                    : model.listOnScreen[index],
                                                onComment: () =>
                                                    model.onComment(model
                                                        .listOnScreen[index])),
                                          );
                                        },
                                      ),
                              ),
                              //_Others()
                            ],
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class Header extends HookViewModelWidget<EntertainersViewModel> {
  const Header({this.scrollToTop, Key? key}) : super(key: key);

  final ValueChanged<bool>? scrollToTop;

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    EntertainersViewModel model,
  ) {
    final searchController = useTextEditingController();
    return Material(
      color: kcVeryLightGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: SearchBar(
                      onClose: () {
                        searchController.text = '';
                        model.onChange('');
                        FocusScope.of(context).unfocus();
                      },
                      onChange: model.onChange,
                      loading: model.busyHeader,
                      controller: searchController,
                    )),
              ),
              Material(
                elevation: model.isBusy ? 0 : 6,
                child: SkeletonLoader(
                  startColor: kcLightGrey3,
                  endColor: kcWhite,
                  loading: model.busyHeader,
                  child: model.busyHeader
                      ? Container(
                          height: 30,
                          width: 40,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: model.onFilter,
                            child: Icon(
                              Icons.tune_rounded,
                              color: kcPrimaryColor,
                            ),
                          ),
                        ),
                ),
              ),
              horizontalSpaceMedium,
            ],
          ),
          verticalSpaceSmall,
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: !model.busyHeader
                  ? [
                      for (int i = 0; i < model.sectors.length; i++) ...[
                        AppCategory(
                          loading: false,
                          text: model.sectors[i].name,
                          onTap: () => model.setQucikFilterIndex(i),
                          active: model.currentIndex == i,
                        ),
                        horizontalSpaceSmall,
                      ]
                    ]
                  : [
                      for (int i = 0; i < Categories.length; i++) ...[
                        AppCategory(
                          loading: true,
                          text: Categories[i],
                        ),
                        horizontalSpaceSmall,
                      ]
                    ],
            ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: appSymmetricEdgePadding,
            child: Row(children: [
              horizontalSpaceSmall,
              Expanded(
                child: HulunfechiTag(
                  loading: model.busyHeader,
                  text: model.tags[0],
                  onTap: model.onPickCountry,
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: HulunfechiTag(
                  loading: model.busyHeader,
                  text: model.tags[1],
                  onTap: model.onAllCountries,
                ),
              ),
              horizontalSpaceSmall,
              horizontalSpaceSmall,
            ]),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
