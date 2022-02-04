// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CountryValueKey = 'country';
const String CityValueKey = 'city';
const String RegionValueKey = 'region';
const String WoredaValueKey = 'woreda';
const String SubcityValueKey = 'subcity';
const String HouseNOValueKey = 'houseNO';
const String TinValueKey = 'tin';

mixin $AddressView on StatelessWidget {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController woredaController = TextEditingController();
  final TextEditingController subcityController = TextEditingController();
  final TextEditingController houseNOController = TextEditingController();
  final TextEditingController tinController = TextEditingController();
  final FocusNode countryFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode regionFocusNode = FocusNode();
  final FocusNode woredaFocusNode = FocusNode();
  final FocusNode subcityFocusNode = FocusNode();
  final FocusNode houseNOFocusNode = FocusNode();
  final FocusNode tinFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    countryController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    regionController.addListener(() => _updateFormData(model));
    woredaController.addListener(() => _updateFormData(model));
    subcityController.addListener(() => _updateFormData(model));
    houseNOController.addListener(() => _updateFormData(model));
    tinController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            CountryValueKey: countryController.text,
            CityValueKey: cityController.text,
            RegionValueKey: regionController.text,
            WoredaValueKey: woredaController.text,
            SubcityValueKey: subcityController.text,
            HouseNOValueKey: houseNOController.text,
            TinValueKey: tinController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    countryController.dispose();
    countryFocusNode.dispose();
    cityController.dispose();
    cityFocusNode.dispose();
    regionController.dispose();
    regionFocusNode.dispose();
    woredaController.dispose();
    woredaFocusNode.dispose();
    subcityController.dispose();
    subcityFocusNode.dispose();
    houseNOController.dispose();
    houseNOFocusNode.dispose();
    tinController.dispose();
    tinFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get countryValue => this.formValueMap[CountryValueKey];
  String? get cityValue => this.formValueMap[CityValueKey];
  String? get regionValue => this.formValueMap[RegionValueKey];
  String? get woredaValue => this.formValueMap[WoredaValueKey];
  String? get subcityValue => this.formValueMap[SubcityValueKey];
  String? get houseNOValue => this.formValueMap[HouseNOValueKey];
  String? get tinValue => this.formValueMap[TinValueKey];

  bool get hasCountry => this.formValueMap.containsKey(CountryValueKey);
  bool get hasCity => this.formValueMap.containsKey(CityValueKey);
  bool get hasRegion => this.formValueMap.containsKey(RegionValueKey);
  bool get hasWoreda => this.formValueMap.containsKey(WoredaValueKey);
  bool get hasSubcity => this.formValueMap.containsKey(SubcityValueKey);
  bool get hasHouseNO => this.formValueMap.containsKey(HouseNOValueKey);
  bool get hasTin => this.formValueMap.containsKey(TinValueKey);
}

extension Methods on FormViewModel {}
