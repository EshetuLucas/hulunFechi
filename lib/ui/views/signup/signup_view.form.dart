// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';
const String ConfirmPasswordValueKey = 'confirmPassword';

mixin $SignUpView on StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            FirstNameValueKey: firstNameController.text,
            LastNameValueKey: lastNameController.text,
            PhoneNumberValueKey: phoneNumberController.text,
            EmailValueKey: emailController.text,
            PasswordValueKey: passwordController.text,
            ConfirmPasswordValueKey: confirmPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    firstNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get firstNameValue => this.formValueMap[FirstNameValueKey];
  String? get lastNameValue => this.formValueMap[LastNameValueKey];
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];
  String? get emailValue => this.formValueMap[EmailValueKey];
  String? get passwordValue => this.formValueMap[PasswordValueKey];
  String? get confirmPasswordValue =>
      this.formValueMap[ConfirmPasswordValueKey];

  bool get hasFirstName => this.formValueMap.containsKey(FirstNameValueKey);
  bool get hasLastName => this.formValueMap.containsKey(LastNameValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
  bool get hasEmail => this.formValueMap.containsKey(EmailValueKey);
  bool get hasPassword => this.formValueMap.containsKey(PasswordValueKey);
  bool get hasConfirmPassword =>
      this.formValueMap.containsKey(ConfirmPasswordValueKey);
}

extension Methods on FormViewModel {}
