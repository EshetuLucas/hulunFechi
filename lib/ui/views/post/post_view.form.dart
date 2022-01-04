// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SubjectValueKey = 'subject';
const String BodyValueKey = 'body';

mixin $PostView on StatelessWidget {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final FocusNode subjectFocusNode = FocusNode();
  final FocusNode bodyFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    subjectController.addListener(() => _updateFormData(model));
    bodyController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            SubjectValueKey: subjectController.text,
            BodyValueKey: bodyController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    subjectController.dispose();
    subjectFocusNode.dispose();
    bodyController.dispose();
    bodyFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get subjectValue => this.formValueMap[SubjectValueKey];
  String? get bodyValue => this.formValueMap[BodyValueKey];

  bool get hasSubject => this.formValueMap.containsKey(SubjectValueKey);
  bool get hasBody => this.formValueMap.containsKey(BodyValueKey);
}

extension Methods on FormViewModel {}
