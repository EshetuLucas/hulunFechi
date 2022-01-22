import 'package:flutter/material.dart';
import 'package:hulunfechi/api/faker.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
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
        listenToFormUpdated(model);
        await model.setuserSearchResult();
      },
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: 'My Posts',
        ),
        body: SafeArea(
          child: Padding(
              padding: appSymmetricEdgePadding,
              child: Column(
                children: [
                  verticalSpaceMedium,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: AppDivider(),
                      ),
                      itemCount: model.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: appSymmetricEdgePadding,
                          child: PostWidget(
                            onLike: () => model.onLike(model.posts[index].id),
                            onShare: () => model.onShare(model.posts[index].id),
                            isMe: true,
                            post: model.posts[index],
                            onComment: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
