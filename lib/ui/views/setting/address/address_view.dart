import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'address_viewmodel.dart';
import 'address_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "country",
    ),
    FormTextField(
      name: "city",
    ),
    FormTextField(
      name: "region",
    ),
    FormTextField(
      name: "woreda",
    ),
    FormTextField(
      name: "subcity",
    ),
    FormTextField(
      name: "houseNO",
    ),
    FormTextField(
      name: "tin",
    ),
  ],
)
class AddressView extends StatelessWidget with $AddressView {
  AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressViewModel>.reactive(
      viewModelBuilder: () => AddressViewModel(),
      onModelReady: (model) {
        countryController.text = model.currentUserCountry;
        cityController.text = model.currentUserCity;
        regionController.text = model.currentUserRegion;
        subcityController.text = model.currentUserSubCity;
        houseNOController.text = model.currentUserHouseNO;
        tinController.text = model.currentUserTIN;
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
          appBar: hulunfechiAppbar(
            title: 'Adress',
            onBackButtonTap: model.onBack,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: appSymmetricEdgePadding,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: AppButton(
                  title: 'Save',
                  onTap: model.onSave,
                  enabled: model.enableSaveButton,
                  busy: model.isBusy,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  verticalSpaceSmall,
                  InputField(
                    controller: countryController,
                    placeholder: 'Country',
                    floatingPlaceholder: 'Country',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: cityController,
                    placeholder: 'City',
                    floatingPlaceholder: 'City',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: regionController,
                    placeholder: 'Region',
                    floatingPlaceholder: 'Region',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: woredaController,
                    placeholder: 'Woreda',
                    floatingPlaceholder: 'Woreda',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: subcityController,
                    placeholder: 'Subcity',
                    floatingPlaceholder: 'Subcity',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: houseNOController,
                    placeholder: 'House Number/Zip code',
                    floatingPlaceholder: 'House Number',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: tinController,
                    placeholder: 'TIN',
                    floatingPlaceholder: 'Tax Identification Number',
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          )),
    );
  }
}
