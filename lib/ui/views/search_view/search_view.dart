import 'package:flutter/material.dart';
import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/entertainers/entertainers_view.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/event_list_view.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/post.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'search_viewmodel.dart';
import 'search_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "search",
    ),
  ],
)
class SearchView extends StatelessWidget with $SearchView {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      onModelReady: (model) async {
        await model.setuserSearchResult();
      },
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: hulunfechiAppbar(
            title: 'My Posts',
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: model.initialise,
              backgroundColor: kcBackgroundColor,
              color: kcPrimaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                child: !model.isBusy && model.posts.isEmpty
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
                                            : model.posts.length,
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
                                                  : model.posts[index],
                                              onLike: () => model.onLike(index),
                                              onShare: () => model.onShare(
                                                  model.posts[index].id),
                                              onComment: () => model.onComment(
                                                model.posts[index],
                                              ),
                                              onMore: () => model.onMoreTap(
                                                  model.posts[index]),
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
