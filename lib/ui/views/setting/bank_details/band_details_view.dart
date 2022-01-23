import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'bank_details_viewmodel.dart';
import 'band_details_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "bankName",
    ),
    FormTextField(
      name: "accountNo",
    ),
  ],
)
class BankDetailView extends StatelessWidget with $BankDetailView {
  BankDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BankDetailViewModel>.reactive(
      viewModelBuilder: () => BankDetailViewModel(),
      onModelReady: (model) {
        bankNameController.text = model.currentUserBankName;
        accountNoController.text = model.currentUserAccountNO;

        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
          appBar: hulunfechiAppbar(
            title: 'Bank Detail',
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
                    controller: bankNameController,
                    placeholder: 'Bank Name',
                    floatingPlaceholder: 'Bank Name',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    controller: accountNoController,
                    placeholder: 'Account Number',
                    floatingPlaceholder: 'Account Number',
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          )),
    );
  }
}
