// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String QueryInputValueKey = 'queryInput';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  QueryInputValueKey: null,
};

mixin $HomeView {
  TextEditingController get queryInputController =>
      _getFormTextEditingController(QueryInputValueKey);
  FocusNode get queryInputFocusNode => _getFormFocusNode(QueryInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }

    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    queryInputController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    queryInputController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          QueryInputValueKey: queryInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get queryInputValue =>
      this.formValueMap[QueryInputValueKey] as String?;

  set queryInputValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          QueryInputValueKey: value,
        }),
    );

    if (_HomeViewTextEditingControllers.containsKey(QueryInputValueKey)) {
      _HomeViewTextEditingControllers[QueryInputValueKey]?.text = value ?? '';
    }
  }

  bool get hasQueryInput =>
      this.formValueMap.containsKey(QueryInputValueKey) &&
      (queryInputValue?.isNotEmpty ?? false);

  bool get hasQueryInputValidationMessage =>
      this.fieldsValidationMessages[QueryInputValueKey]?.isNotEmpty ?? false;

  String? get queryInputValidationMessage =>
      this.fieldsValidationMessages[QueryInputValueKey];
}

extension Methods on FormViewModel {
  setQueryInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QueryInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    queryInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      QueryInputValueKey: getValidationMessage(QueryInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HomeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HomeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      QueryInputValueKey: getValidationMessage(QueryInputValueKey),
    });
