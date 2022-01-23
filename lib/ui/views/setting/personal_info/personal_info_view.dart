import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'personal_info_viewmodel.dart';
import 'personal_info_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "firstName",
    ),
    FormTextField(
      name: "lastName",
    ),
    FormTextField(
      name: "DOB",
    ),
    FormTextField(
      name: "phoneNumber",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "Profession",
    ),
  ],
)
class PersonalInfoView extends StatelessWidget with $PersonalInfoView {
  PersonalInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalInfoViewModel>.reactive(
      viewModelBuilder: () => PersonalInfoViewModel(),
      onModelReady: (model) {
        firstNameController.text = model.currentUserFirstName;
        lastNameController.text = model.currentUserLastName;
        DOBController.text = model.currentUserDoB;
        phoneNumberController.text = model.currentUserPhonNumber;
        emailController.text = model.currentUserEmail;
        ProfessionController.text = model.currentUserProfession;
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
          appBar: hulunfechiAppbar(
            title: 'Personal Info',
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
                    controller: firstNameController,
                    placeholder: 'First Name',
                    floatingPlaceholder: 'First Name',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: lastNameController,
                    placeholder: 'Last Name',
                    floatingPlaceholder: 'Last Name',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: DOBController,
                    placeholder: 'DOB',
                    floatingPlaceholder: 'Date of birth',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: phoneNumberController,
                    placeholder: 'Phone Number',
                    floatingPlaceholder: 'Phone Number',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: emailController,
                    placeholder: 'Email',
                    floatingPlaceholder: 'Email',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: ProfessionController,
                    placeholder: 'Profession',
                    floatingPlaceholder: 'Profession',
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          )),
    );
  }
}
