import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/app/app.constant.dart';

import 'package:hulunfechi/datamodels/post/post_model.dart';

import 'package:hulunfechi/ui/shared/app_colors.dart';

import 'package:hulunfechi/ui/widgets/dumb_widgets/app_category.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/hulunfechi_tags.dart';

import 'package:hulunfechi/ui/widgets/dumb_widgets/post.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/search_bar.dart';

import 'package:stacked/stacked.dart';

import 'entertainers_viewmodel.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';

import 'package:stacked_hooks/stacked_hooks.dart';

List<Post> FAKE_POSTS = [
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
              onRefresh: model.onRefresh,
              backgroundColor: kcBackgroundColor,
              color: kcPrimaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
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
                                        padding: EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 30,
                                          ),
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
                                              userId: model.userId,
                                              loading: model.isBusy ||
                                                  model.busy(POST_BUSY_KEY),
                                              post: model.isBusy ||
                                                      model.busy(POST_BUSY_KEY)
                                                  ? FAKE_POSTS[index]
                                                  : model.listOnScreen[index],
                                              onLike: () => model.onLike(index),
                                              onShare: () => model.onShare(
                                                  model.listOnScreen[index].id),
                                              onComment: () => model.onComment(
                                                model.listOnScreen[index],
                                              ),
                                              onMore: () => model.onMoreTap(
                                                  model.listOnScreen[index]),
                                            ),
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
                            onTap: () {
                              if (model.isSearchActive) {
                                searchController.text = '';
                                model.onChange('');
                                FocusScope.of(context).unfocus();
                              }
                              model.onFilter();
                            },
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
                          onTap: () {
                            if (model.isSearchActive) {
                              searchController.text = '';
                              model.onChange('');
                              FocusScope.of(context).unfocus();
                            }
                            model.setQucikFilterIndex(i);
                          },
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
                  onTap: () {
                    if (model.isSearchActive) {
                      searchController.text = '';
                      model.onChange('');
                      FocusScope.of(context).unfocus();
                    }
                    model.onPickCountry();
                  },
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: HulunfechiTag(
                    loading: model.busyHeader,
                    text: model.tags[1],
                    onTap: () {
                      if (model.isSearchActive) {
                        searchController.text = '';
                        model.onChange('');
                        FocusScope.of(context).unfocus();
                      }
                      model.onPlatformTap();
                    }),
              ),
              horizontalSpaceSmall,
              horizontalSpaceSmall,
            ]),
          ),
          verticalSpaceSmall
        ],
      ),
    );
  }
}
