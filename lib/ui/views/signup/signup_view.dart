import 'package:flutter/material.dart';
import 'package:hulunfechi/app_constants.dart/string_constants.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/signup/signup_view.form.dart';
import 'package:hulunfechi/ui/views/signup/signup_viewmodel.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(
      name: "firstName",
    ),
    FormTextField(
      name: "lastName",
    ),
    FormTextField(
      name: "phoneNumber",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "password",
    ),
    FormTextField(
      name: "confirmPassword",
    ),
  ],
)
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return IgnorePointer(
          ignoring: model.isBusy,
          child: Scaffold(
            appBar: hulunfechiAppbar(
              title: 'Sign up',
              onBackButtonTap: model.onBack,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Create your account',
                                style: ktsDarkGreyTextStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Let\'s create your account ',
                                style:
                                    ktsDarkGreyTextStyle.copyWith(fontSize: 17),
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                verticalSpaceSmall,
                                InputField(
                                  controller: firstNameController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'First Name',
                                ),
                                if (model.nameFieldHasText)
                                  _ValidationMessage(
                                    title: 'First Name $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  controller: lastNameController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Last Name',
                                ),
                                verticalSpaceMedium,
                                Padding(
                                  padding: appSymmetricEdgePadding,
                                  child: Row(
                                    children: [
                                      horizontalSpaceMedium,
                                      Checkbox(
                                        side: BorderSide(color: kcPrimaryColor),
                                        focusColor: kcPrimaryColor,
                                        value: model.checkBoxValue[0],
                                        activeColor: kcPrimaryColor,
                                        onChanged: (value) =>
                                            model.onCheckBoxChange(0, value!),
                                      ),
                                      Text(
                                        'Female',
                                        style: ktsDarkGreyTextStyle,
                                      ),
                                      Spacer(),
                                      Checkbox(
                                        side: BorderSide(color: kcPrimaryColor),
                                        focusColor: kcPrimaryColor,
                                        activeColor: kcPrimaryColor,
                                        value: model.checkBoxValue[1],
                                        onChanged: (value) =>
                                            model.onCheckBoxChange(1, value!),
                                      ),
                                      Text(
                                        'Male',
                                        style: ktsDarkGreyTextStyle,
                                      ),
                                      horizontalSpaceMedium,
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                InputField(
                                  controller: phoneNumberController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Phone Number (09..)',
                                ),
                                if (model.phoneNumberValidationMessage != null)
                                  _ValidationMessage(
                                      title:
                                          model.phoneNumberValidationMessage!),
                                verticalSpaceMedium,
                                InputField(
                                  controller: emailController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Email',
                                ),
                                if (model.emailFieldHasText ||
                                    model.emailValidationMessage != null)
                                  _ValidationMessage(
                                    title: model.emailValidationMessage ??
                                        'Email $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  obscureText: true,
                                  maxLine: 1,
                                  isReadOnly: model.isBusy,
                                  hasFocusedBorder: true,
                                  controller: passwordController,
                                  placeholder: 'Password',
                                ),
                                if (model.passwordFieldHasText)
                                  _ValidationMessage(
                                    title: 'Password $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  obscureText: true,
                                  maxLine: 1,
                                  isReadOnly: model.isBusy,
                                  hasFocusedBorder: true,
                                  controller: confirmPasswordController,
                                  placeholder: 'Confirm Password',
                                ),
                                if (model.confirmFieldHasText ||
                                    model.passwordValidationMessage != null)
                                  _ValidationMessage(
                                    title: model.passwordValidationMessage ??
                                        'Confirm password $CantBeEmpty',
                                  ),
                                verticalSpaceSmall,
                                if (model.erroMessage.isNotEmpty)
                                  Center(
                                    child: Text(
                                      model.erroMessage,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15),
                                    ),
                                  ),
                                verticalSpaceMedium,
                              ],
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: AppButton(
                              title: 'Create Account',
                              busy: model.isBusy,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                model.onCreateAccount();
                              },
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: ktsDarkGreyTextStyle,
                                ),
                                TextButton(
                                  onPressed: model.onBack,
                                  child: Text(
                                    'Login',
                                    style: ktsGreenBoldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ValidationMessage extends StatelessWidget {
  const _ValidationMessage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceTiny,
          Text("$title",
              style: ktsSmallWhiteTextStyle.copyWith(
                color: Colors.red.withOpacity(0.7),
              ))
        ],
      ),
    );
  }
}
