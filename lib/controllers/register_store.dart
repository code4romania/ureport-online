import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/services/auth_service.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  late Map<String, String> translation;

  _RegisterStoreBase(this.translation);

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
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
  String? surnameError;

  @observable
  String? nameAndSurnameError;

  @observable
  bool isLoading = false;

  @observable
  RegisterStatus? result;

  @observable
  String? errorMessage;

  @action
  void toggleIsLoading() {
    isLoading = !isLoading;
  }

  Future<Profile?> getProfile() async {
    return await AuthService().getProfile();
  }

  Future<void> register() async {
    toggleIsLoading();
    if (validateNameAndSurname() &&
        validatePassword() &&
        validatePasswordConfirm() &&
        validateMatchingPasswords() &&
        validateRegexPassword()) {
      result = null;
      errorMessage = null;

      final response = await AuthService().register(
        name: '${nameController.text} ${surnameController.text}',
        email: emailController.text,
        password: passwdController.text,
      );

      if (response.statusCode == 400) {
        errorMessage = translation["existing_acc"];
        result = RegisterStatus.ERROR;
      } else if (response.statusCode == 200) {
        result = RegisterStatus.SUCCESS;
        SPUtil().setValue(SPUtil.KEY_USER_EMAIL, emailController.text);
      } else {
        errorMessage = response.message;
        result = RegisterStatus.ERROR;
      }

      // For some reason the tree rebuild triggers twice
      // And if error message is not null the showDialog displays twice
      errorMessage = null;
    }
    toggleIsLoading();
  }

  @action
  bool validateName() {
    final RegExp regExp = RegExp(r"[\w-._]+");
    if (nameController.text.isEmpty || !regExp.hasMatch(nameController.text)) {
      nameError = translation["invalid_name"];
      return false;
    }
    if (nameController.text.length < 2) {
      nameError = translation["short_name"];
      return false;
    }

    nameError = null;
    return true;
  }

  @action
  bool validateSurname() {
    final RegExp regExp = RegExp(r"[\w-._]+");
    if (surnameController.text.isEmpty ||
        !regExp.hasMatch(surnameController.text)) {
      surnameError = translation["invalid_surname"];
      return false;
    }
    if (surnameController.text.length < 2) {
      surnameError = translation["short_surname"];
      return false;
    }
    surnameError = null;
    return true;
  }

  @action
  bool validateNameAndSurname() {
    if (!validateName() || !validateSurname()) {
      return false;
    }
    return true;
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
      return true;
    }
  }

  @action
  bool validatePasswordConfirm() {
    if (confirmPwController.text.length < 6) {
      confirmPwError = translation["short_pw"];
      return false;
    } else {
      confirmPwError = null;
      return true;
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

  @action
  bool validateRegexPassword() {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?\":{}|<>])(?=.*[a-z])(?=.*[0-9]).+$',
    );
    if (!passwordRegex.hasMatch(passwdController.text)) {
      passwordError = translation["weak_password"];
      return false;
    } else {
      passwordError = null;
      return true;
    }
  }
}
