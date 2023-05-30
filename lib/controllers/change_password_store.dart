import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/services/account_settings_services.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'change_password_store.g.dart';

class ChangePasswordStore = _ChangePasswordStoreBase with _$ChangePasswordStore;

abstract class _ChangePasswordStoreBase with Store {
  late Map<String, String> translations;
  late AccountSettingsServices httpClient;
  late String token;
  late int userId;
  late SPUtil spUtil;

  _ChangePasswordStoreBase(this.translations) {
    spUtil = SPUtil();
    token = spUtil.getValue(SPUtil.KEY_AUTH_TOKEN);
    userId = spUtil.getInt(SPUtil.KEY_USER_ID);
    httpClient = AccountSettingsServices(token: token);
  }

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @observable
  String? currentPasswordError;

  @observable
  String? newPasswordError;

  @observable
  String? passwordConfirmationError;

  @observable
  bool? result;

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @action
  void reset() {
    currentPasswordController.clear();
    newPasswordController.clear();
    passwordConfirmationController.clear();
    currentPasswordError = null;
    newPasswordError = null;
    passwordConfirmationError = null;
    result = null;
    errorMessage = null;
  }

  @action
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    passwordConfirmationController.dispose();
  }

  @action
  Future<void> changePassowrd() async {
    isLoading = true;
    result = null;
    errorMessage = null;
    if (validateCurrentPassword() &&
        validateNewPassword() &&
        validatePasswordConfirmation() &&
        validateNewWithConfirmation()) {
      final response = await httpClient.changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        userID: userId,
      );
      if (response.statusCode == 200) {
        result = true;
      } else {
        result = false;
        errorMessage = response.message;
      }
    }
    isLoading = false;
  }

  @action
  bool validateCurrentPassword() {
    if (currentPasswordController.text.isEmpty) {
      currentPasswordError = translations["empty_password"]!;
      return false;
    } else {
      currentPasswordError = null;
      return true;
    }
  }

  @action
  bool validateNewPassword() {
    if (newPasswordController.text.isEmpty) {
      newPasswordError = translations["empty_password"]!;
      return false;
    } else {
      newPasswordError = null;
      return true;
    }
  }

  @action
  bool validatePasswordConfirmation() {
    if (passwordConfirmationController.text.isEmpty) {
      passwordConfirmationError = translations["empty_password"]!;
      return false;
    } else {
      passwordConfirmationError = null;
      return true;
    }
  }

  @action
  bool validateNewWithConfirmation() {
    if (newPasswordController.text != passwordConfirmationController.text) {
      newPasswordError = translations["passwords_not_match"]!;
      return false;
    } else {
      newPasswordError = null;
      return true;
    }
  }
}
