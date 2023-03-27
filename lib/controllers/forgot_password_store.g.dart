// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordStore on _ForgotPasswordStoreBase, Store {
  late final _$pageAtom =
      Atom(name: '_ForgotPasswordStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ForgotPasswordStoreBase.isLoading', context: context);

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

  late final _$passwordErrorAtom =
      Atom(name: '_ForgotPasswordStoreBase.passwordError', context: context);

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

  late final _$confirmPasswordErrorAtom = Atom(
      name: '_ForgotPasswordStoreBase.confirmPasswordError', context: context);

  @override
  String? get confirmPasswordError {
    _$confirmPasswordErrorAtom.reportRead();
    return super.confirmPasswordError;
  }

  @override
  set confirmPasswordError(String? value) {
    _$confirmPasswordErrorAtom.reportWrite(value, super.confirmPasswordError,
        () {
      super.confirmPasswordError = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_ForgotPasswordStoreBase.emailError', context: context);

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

  late final _$codeErrorAtom =
      Atom(name: '_ForgotPasswordStoreBase.codeError', context: context);

  @override
  String? get codeError {
    _$codeErrorAtom.reportRead();
    return super.codeError;
  }

  @override
  set codeError(String? value) {
    _$codeErrorAtom.reportWrite(value, super.codeError, () {
      super.codeError = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_ForgotPasswordStoreBase.result', context: context);

  @override
  ForgotPasswordStatus? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(ForgotPasswordStatus? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ForgotPasswordStoreBase.errorMessage', context: context);

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

  late final _$sendCodeAsyncAction =
      AsyncAction('_ForgotPasswordStoreBase.sendCode', context: context);

  @override
  Future<void> sendCode() {
    return _$sendCodeAsyncAction.run(() => super.sendCode());
  }

  late final _$verifyCodeAsyncAction =
      AsyncAction('_ForgotPasswordStoreBase.verifyCode', context: context);

  @override
  Future<void> verifyCode() {
    return _$verifyCodeAsyncAction.run(() => super.verifyCode());
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ForgotPasswordStoreBase.resetPassword', context: context);

  @override
  Future<void> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  late final _$_ForgotPasswordStoreBaseActionController =
      ActionController(name: '_ForgotPasswordStoreBase', context: context);

  @override
  void toggleIsLoading() {
    final _$actionInfo = _$_ForgotPasswordStoreBaseActionController.startAction(
        name: '_ForgotPasswordStoreBase.toggleIsLoading');
    try {
      return super.toggleIsLoading();
    } finally {
      _$_ForgotPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
isLoading: ${isLoading},
passwordError: ${passwordError},
confirmPasswordError: ${confirmPasswordError},
emailError: ${emailError},
codeError: ${codeError},
result: ${result},
errorMessage: ${errorMessage}
    ''';
  }
}
