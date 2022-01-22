// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String BankNameValueKey = 'bankName';
const String AccountNoValueKey = 'accountNo';

mixin $BankDetailView on StatelessWidget {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final FocusNode bankNameFocusNode = FocusNode();
  final FocusNode accountNoFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    bankNameController.addListener(() => _updateFormData(model));
    accountNoController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            BankNameValueKey: bankNameController.text,
            AccountNoValueKey: accountNoController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    bankNameController.dispose();
    bankNameFocusNode.dispose();
    accountNoController.dispose();
    accountNoFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get bankNameValue => this.formValueMap[BankNameValueKey];
  String? get accountNoValue => this.formValueMap[AccountNoValueKey];

  bool get hasBankName => this.formValueMap.containsKey(BankNameValueKey);
  bool get hasAccountNo => this.formValueMap.containsKey(AccountNoValueKey);
}

extension Methods on FormViewModel {}
