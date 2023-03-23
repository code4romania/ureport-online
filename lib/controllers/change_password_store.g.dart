// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordStore on _ChangePasswordStoreBase, Store {
  late final _$currentPasswordErrorAtom = Atom(
      name: '_ChangePasswordStoreBase.currentPasswordError', context: context);

  @override
  String? get currentPasswordError {
    _$currentPasswordErrorAtom.reportRead();
    return super.currentPasswordError;
  }

  @override
  set currentPasswordError(String? value) {
    _$currentPasswordErrorAtom.reportWrite(value, super.currentPasswordError,
        () {
      super.currentPasswordError = value;
    });
  }

  late final _$newPasswordErrorAtom =
      Atom(name: '_ChangePasswordStoreBase.newPasswordError', context: context);

  @override
  String? get newPasswordError {
    _$newPasswordErrorAtom.reportRead();
    return super.newPasswordError;
  }

  @override
  set newPasswordError(String? value) {
    _$newPasswordErrorAtom.reportWrite(value, super.newPasswordError, () {
      super.newPasswordError = value;
    });
  }

  late final _$passwordConfirmationErrorAtom = Atom(
      name: '_ChangePasswordStoreBase.passwordConfirmationError',
      context: context);

  @override
  String? get passwordConfirmationError {
    _$passwordConfirmationErrorAtom.reportRead();
    return super.passwordConfirmationError;
  }

  @override
  set passwordConfirmationError(String? value) {
    _$passwordConfirmationErrorAtom
        .reportWrite(value, super.passwordConfirmationError, () {
      super.passwordConfirmationError = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_ChangePasswordStoreBase.result', context: context);

  @override
  bool? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(bool? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ChangePasswordStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$changePassowrdAsyncAction =
      AsyncAction('_ChangePasswordStoreBase.changePassowrd', context: context);

  @override
  Future<void> changePassowrd() {
    return _$changePassowrdAsyncAction.run(() => super.changePassowrd());
  }

  late final _$_ChangePasswordStoreBaseActionController =
      ActionController(name: '_ChangePasswordStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateCurrentPassword() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.validateCurrentPassword');
    try {
      return super.validateCurrentPassword();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateNewPassword() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.validateNewPassword');
    try {
      return super.validateNewPassword();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validatePasswordConfirmation() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.validatePasswordConfirmation');
    try {
      return super.validatePasswordConfirmation();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateNewWithConfirmation() {
    final _$actionInfo = _$_ChangePasswordStoreBaseActionController.startAction(
        name: '_ChangePasswordStoreBase.validateNewWithConfirmation');
    try {
      return super.validateNewWithConfirmation();
    } finally {
      _$_ChangePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPasswordError: ${currentPasswordError},
newPasswordError: ${newPasswordError},
passwordConfirmationError: ${passwordConfirmationError},
result: ${result},
errorMessage: ${errorMessage}
    ''';
  }
}
