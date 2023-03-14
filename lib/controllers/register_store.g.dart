// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$emailErrorAtom =
      Atom(name: '_RegisterStoreBase.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_RegisterStoreBase.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$confirmPwErrorAtom =
      Atom(name: '_RegisterStoreBase.confirmPwError', context: context);

  @override
  String? get confirmPwError {
    _$confirmPwErrorAtom.reportRead();
    return super.confirmPwError;
  }

  @override
  set confirmPwError(String? value) {
    _$confirmPwErrorAtom.reportWrite(value, super.confirmPwError, () {
      super.confirmPwError = value;
    });
  }

  late final _$nameErrorAtom =
      Atom(name: '_RegisterStoreBase.nameError', context: context);

  @override
  String? get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RegisterStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_RegisterStoreBase.result', context: context);

  @override
  RegisterStatus? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(RegisterStatus? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  void toggleIsLoading() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.toggleIsLoading');
    try {
      return super.toggleIsLoading();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateName() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateEmail() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validatePassword() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validatePasswordConfirm() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validatePasswordConfirm');
    try {
      return super.validatePasswordConfirm();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateMatchingPasswords() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validateMatchingPasswords');
    try {
      return super.validateMatchingPasswords();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailError: ${emailError},
passwordError: ${passwordError},
confirmPwError: ${confirmPwError},
nameError: ${nameError},
isLoading: ${isLoading},
result: ${result}
    ''';
  }
}
