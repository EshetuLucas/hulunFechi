import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/setting/setting_viewmodel.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked/stacked.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.nonReactive(
      viewModelBuilder: () => SettingViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: 'Setting',
          onBackButtonTap: model.onBack,
        ),
        body: SafeArea(
            child: Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    verticalSpaceSmall,
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          _Actions(
                            headerTitle: 'Personal Info',
                            items: [
                              _AccountWidgets(
                                title: 'Name:',
                                subTitle: 'Eshetu Lukas',
                              ),
                              _AccountWidgets(
                                title: 'DOB:',
                                subTitle: '20, Oct, 1996',
                              ),
                              _AccountWidgets(
                                title: 'Phone No:',
                                subTitle: '+251916740322',
                              ),
                              _AccountWidgets(
                                title: 'Email:',
                                subTitle: 'tekalukas@gmail.com',
                              ),
                              _AccountWidgets(
                                title: 'Profession:',
                                subTitle: 'Developer',
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          _Actions(
                            headerTitle: 'Address',
                            items: [
                              _AccountWidgets(
                                title: 'Country:',
                                subTitle: 'Ethiopia',
                              ),
                              _AccountWidgets(
                                title: 'City:',
                                subTitle: 'Addis Ababa',
                              ),
                              _AccountWidgets(
                                title: 'Region/State:',
                                subTitle: 'Addis Ababa',
                              ),
                              _AccountWidgets(
                                title: 'Woreda:',
                                subTitle: '01',
                              ),
                              _AccountWidgets(
                                title: 'Subcity:',
                                subTitle: 'Bole',
                              ),
                              _AccountWidgets(
                                title: 'House No/Zip Code:',
                                subTitle: '12344',
                              ),
                              _AccountWidgets(
                                title: 'Socila Security No:',
                                subTitle: '232344',
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          _Actions(
                            headerTitle: 'Bank Details',
                            items: [
                              _AccountWidgets(
                                title: 'Full Nmae:',
                                subTitle: 'Eshetu Lukas Teka',
                              ),
                              _AccountWidgets(
                                title: 'Bank Name:',
                                subTitle: 'Commercial Bank of Ethiopia',
                              ),
                              _AccountWidgets(
                                title: 'Account Number No:',
                                subTitle: '1000092645362',
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ],
                ))),
      ),
    );
  }
}

class _Actions extends ViewModelWidget<SettingViewModel> {
  const _Actions({
    required this.headerTitle,
    required this.items,
    Key? key,
  }) : super(key: key);

  final String headerTitle;
  final List<Widget> items;

  @override
  Widget build(BuildContext context, SettingViewModel model) {
    return Padding(
      padding: appSymmetricEdgePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                headerTitle,
                style: ktsDarkGreyTextStyle,
              ),
              horizontalSpaceMedium,
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
          ),
          verticalSpaceMedium,
          ...items,
        ],
      ),
    );
  }
}

class _AccountWidgets extends StatelessWidget {
  const _AccountWidgets({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            horizontalSpaceMedium,
            Text(title),
            Spacer(),
            Text(subTitle),
            horizontalSpaceMedium,
          ],
        ),
        verticalSpaceSmall,
        AppDivider(),
        verticalSpaceSmall,
      ],
    );
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfilePic(),
            ],
          ),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceSmall,
              Text(
                'Eshetu Lukas',
                style: ktsDarkGreyTextStyle,
              ),
              Text(
                'Developer',
                style: ktsDarkSmallTextStyle,
              ),
              verticalSpaceTiny,
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
