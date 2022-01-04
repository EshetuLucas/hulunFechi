import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hulunfechi/app/app.constant.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/action_item.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
              padding: appSymmetricEdgePadding,
              child: !model.hasUser
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        _UserProfile(),
                        verticalSpaceMedium,
                        verticalSpaceSmall,
                        Expanded(
                          child: SingleChildScrollView(
                            child: _Actions(),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.user,
                            size: 100,
                            color: kcPrimaryColor,
                          ),
                          verticalSpaceSmall,
                          Text(
                            'Sign up for an account',
                            style: ktsSmallWhiteTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          verticalSpaceSmall,
                          Center(
                            child: AppButton(
                              title: "Sign up",
                              onTap: model.onSignUp,
                            ),
                          ),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}

class _Actions extends ViewModelWidget<AccountViewModel> {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: ACCOUNT_OPTIONS.length,
        separatorBuilder: (BuildContext context, int index) {
          return AppDivider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ActionsItem(
            title: ACCOUNT_OPTIONS[index]['title'],
            iconData: ACCOUNT_OPTIONS[index]['iconData'],
            onTap: () => model.onOptionTap(index),
          );
        });
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfilePic(),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eshetu Lukas',
                style: ktsDarkGreyTextStyle,
              ),
              Text(
                'Developer',
                style: ktsDarkSmallTextStyle,
              ),
              verticalSpaceTiny,
              Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: kcPrimaryColor,
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'Edit',
                    style: ktsWhiteSmallTextStyle.copyWith(
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProfilePic extends StatelessWidget {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);

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
            child: Image.asset(
              "assets/images/entertainers_images/sample.jpg",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 2),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcAppBackgroundColor,
              ),
              child: Material(
                elevation: 20,
                color: kcAppBackgroundColor,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => null,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: kcPrimaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
