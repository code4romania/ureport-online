import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/services/auth_service.dart';
import 'package:ureport_ecaro/utils/enums.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  late Map<String, String> translation;

  _RegisterStoreBase(this.translation);

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwdController = TextEditingController();
  final confirmPwController = TextEditingController();

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @observable
  String? confirmPwError;

  @observable
  String? nameError;

  @observable
  bool isLoading = false;

  @observable
  RegisterStatus? result;

  @action
  void toggleIsLoading() {
    isLoading = !isLoading;
  }

  Future<void> register() async {
    toggleIsLoading();
    if (validateName() &&
        validateEmail() &&
        validatePassword() &&
        validateMatchingPasswords()) {
      result = null;

      result = await AuthService().register(
        name: nameController.text,
        email: emailController.text,
        password: passwdController.text,
      );

      toggleIsLoading();
    }
  }

  @action
  bool validateName() {
    if (nameController.text.isEmpty || nameController.text.length < 3) {
      nameError = translation["short_username"];
      return false;
    } else {
      nameError = null;
      return true;
    }
  }

  @action
  bool validateEmail() {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    if (!emailValid) {
      emailError = translation["invalid_email"];
      return false;
    } else {
      emailError = null;
      return true;
    }
  }

  @action
  bool validatePassword() {
    if (passwdController.text.length < 6) {
      passwordError = translation["short_pw"];
      return false;
    } else {
      passwordError = null;
      return false;
    }
  }

  @action
  bool validateMatchingPasswords() {
    if (passwdController.text != confirmPwController.text) {
      confirmPwError = translation["no_matching_pw"];
      return false;
    } else {
      confirmPwError = null;
      return true;
    }
  }
}
