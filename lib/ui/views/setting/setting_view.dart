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
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                            onTap: model.onPersonalInfoTap,
                            headerTitle: 'Personal Info',
                            items: [
                              _AccountWidgets(
                                title: 'First Name:',
                                subTitle: model.currentUserFirstName,
                              ),
                              _AccountWidgets(
                                title: 'Last Name:',
                                subTitle: model.currentUserLastName,
                              ),
                              _AccountWidgets(
                                title: 'DOB:',
                                subTitle: model.currentUserDoB,
                              ),
                              _AccountWidgets(
                                title: 'Phone No:',
                                subTitle: model.currentUserPhonNumber,
                              ),
                              _AccountWidgets(
                                title: 'Email:',
                                subTitle: model.currentUserEmail,
                              ),
                              _AccountWidgets(
                                title: 'Profession:',
                                subTitle: model.currentUserProfession,
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          _Actions(
                            onTap: model.onAdressTap,
                            headerTitle: 'Address',
                            items: [
                              _AccountWidgets(
                                title: 'Country:',
                                subTitle: 'Ethiopia',
                              ),
                              _AccountWidgets(
                                title: 'City:',
                                subTitle: model.currentUserCity,
                              ),
                              _AccountWidgets(
                                title: 'Region/State:',
                                subTitle: model.currentUserRegion,
                              ),
                              _AccountWidgets(
                                title: 'Woreda:',
                                subTitle: model.currentUserWoreda,
                              ),
                              _AccountWidgets(
                                title: 'Subcity:',
                                subTitle: model.currentUserSubCity,
                              ),
                              _AccountWidgets(
                                title: 'House No/Zip Code:',
                                subTitle: '12344',
                              ),
                              _AccountWidgets(
                                title: 'TIN:',
                                subTitle: model.currentUserTIN,
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          _Actions(
                            onTap: model.onBankDetail,
                            headerTitle: 'Bank Details',
                            items: [
                              _AccountWidgets(
                                title: 'Full Name:',
                                subTitle: model.currentUserFullName,
                              ),
                              _AccountWidgets(
                                title: 'Bank Name: ',
                                subTitle: model.currentUserBankName,
                              ),
                              _AccountWidgets(
                                title: 'Account No: ',
                                subTitle: model.currentUserAccountNO,
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
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String headerTitle;
  final List<Widget> items;
  final Function()? onTap;

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
              GestureDetector(
                onTap: onTap,
                child: Row(
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
            horizontalSpaceSmall,
            Expanded(
              child: Text(
                subTitle,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
            horizontalSpaceSmall,
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
