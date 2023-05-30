import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/services/auth_service.dart';
import 'package:ureport_ecaro/utils/enums.dart';
part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  late Map<String, String> translation;

  final AuthService _authService = AuthService();

  _ForgotPasswordStoreBase(this.translation);

  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final codeController = List.of([
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ]);

  @observable
  int page = 0;

  @observable
  bool isLoading = false;

  @observable
  String? passwordError;

  @observable
  String? confirmPasswordError;

  @observable
  String? emailError;

  @observable
  String? codeError;

  @observable
  ForgotPasswordStatus? result;

  @observable
  String? errorMessage;

  @action
  Future<void> sendCode() async {
    isLoading = true;
    result = null;

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    if (!emailValid) {
      emailError = translation["invalid_email"]!;

      Future.delayed(Duration(seconds: 2), () {
        emailError = null;
      });
      return;
    } else {
      emailError = null;
      final response = await _authService.sendCode(email: emailController.text);
      if (response.statusCode == 200) {
        page = 1;
        isLoading = false;
      } else {
        errorMessage = response.message;

        isLoading = false;
      }
    }
  }

  @action
  Future<void> verifyCode() async {
    isLoading = true;
    result = null;

    if (codeController[0].text.length == 0 ||
        codeController[1].text.length == 0 ||
        codeController[2].text.length == 0 ||
        codeController[3].text.length == 0 ||
        codeController[4].text.length == 0 ||
        codeController[5].text.length == 0) {
      codeError = "Codul introdus este invalid";
      // Tested if the user didn't fill all the fields
      // the submit button doesn't show anymore and the user can't continue
      isLoading = false;
      Future.delayed(Duration(seconds: 2), () {
        codeError = null;
      });

      return;
    } else {
      codeError = null;

      final response = await _authService.verifyCode(
          email: emailController.text,
          code: codeController[0].text +
              codeController[1].text +
              codeController[2].text +
              codeController[3].text +
              codeController[4].text +
              codeController[5].text);

      if (response.statusCode == 200) {
        page = 2;
        isLoading = false;
      } else {
        errorMessage = response.message;
        isLoading = false;
      }
    }
  }

  @action
  Future<void> resetPassword() async {
    isLoading = true;
    result = null;

    if (newPasswordController.text.length < 6) {
      passwordError = "Parola este prea scurtă";

      return;
    } else {
      passwordError = null;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      confirmPasswordError = "Parolele nu se potrivesc";

      return;
    } else {
      confirmPasswordError = null;

      final response = await _authService.resetPassword(
          email: emailController.text,
          code: codeController[0].text +
              codeController[1].text +
              codeController[2].text +
              codeController[3].text +
              codeController[4].text +
              codeController[5].text,
          newPassword: newPasswordController.text,
          confirmNewPassword: confirmPasswordController.text);

      if (response.statusCode == 200) {
        page = 3;
        isLoading = false;
        result = ForgotPasswordStatus.SUCCESS;
      } else {
        errorMessage = response.message;
        isLoading = false;
      }
    }
  }

  @action
  void toggleIsLoading() {
    isLoading = !isLoading;
  }

  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    codeController.forEach((element) {
      element.dispose();
    });
  }
}
