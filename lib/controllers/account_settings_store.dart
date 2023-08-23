import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/models/response.dart';
import 'package:ureport_ecaro/services/account_settings_services.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'account_settings_store.g.dart';

class AccountSettingsStore = _AccountSettingsStoreBase
    with _$AccountSettingsStore;

abstract class _AccountSettingsStoreBase with Store {
  late Map<String, String> translation;
  late String token;
  late int userId;
  late SPUtil spUtil;
  late AccountSettingsServices httpClient;
  Profile? profile;

  _AccountSettingsStoreBase(this.translation, this.profile) {
    spUtil = SPUtil();
    token = spUtil.getValue(SPUtil.KEY_AUTH_TOKEN);
    userId = spUtil.getInt(SPUtil.KEY_USER_ID);
    httpClient = AccountSettingsServices(token: token);

    if (profile != null) {
      usernameController.text = profile!.first_name + " " + profile!.last_name;
      if (profile?.image == null) {
        remoteprofilePic =
            "https://images.squarespace-cdn.com/content/v1/5a41ce1129f187de5f70506d/1515104526219-CTC9ND914ZD62K9D3ZSW/placeholder-person.jpg";
      }
    }
  }

  final TextEditingController usernameController = TextEditingController();

  @observable
  String? localProfilePic;

  @observable
  String? remoteprofilePic;

  @observable
  String? resultMessage;

  @observable
  bool isLoading = false;

  @action
  Future<void> saveProfile() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    resultMessage = null;
    String? resultUpload = await uploadPicture();
    String? resultChangeUsername = await changeUsername();

    if (resultUpload != null && resultChangeUsername != null) {
      resultMessage = resultUpload + " & " + resultChangeUsername;
    } else if (resultUpload != null) {
      resultMessage = resultUpload;
    } else if (resultChangeUsername != null) {
      resultMessage = resultChangeUsername;
    }
    isLoading = false;
  }

  @action
  Future<String?> changeUsername() async {
    if (usernameController.text.isEmpty ||
        ((usernameController.text ==
                profile!.first_name + " " + profile!.last_name) ||
            (usernameController.text ==
                profile!.last_name + " " + profile!.first_name))) {
      return null;
    }

    final response = await httpClient.updateUsername(
      userID: userId,
      username: usernameController.text,
    );

    if (response.statusCode == 200) {
      profile = Profile.fromJson(response.data!);

      return translation["username_changed"];
    } else {
      return response.message;
    }
  }

  @action
  Future<void> pickImage() async {
    try {
      resultMessage = null;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, allowMultiple: false, allowCompression: true);

      if (result != null) {
        if (result.files.single.size > 2000000) {
          resultMessage = translation["profile_pic_too_large"];
        }
        localProfilePic = result.files.single.path!;
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<String?> uploadPicture() async {
    if (localProfilePic == null) {
      return null;
    }

    final uploadResult = await httpClient.updateProfilePicture(
      userID: userId,
      path: localProfilePic!,
    );

    if (uploadResult.statusCode == 200) {
      profile = Profile.fromJson(uploadResult.data);

      return translation["upload_success"];
    } else {
      return uploadResult.message;
    }
  }

  @action
  Future<String?> deleteAccount() async {
    var result = await httpClient.deleteAccount(userId: userId);

    if (result.statusCode == 200) {
      return resultMessage = translation["delete_account_success_body"];
    } else {
      return resultMessage = result.message;
    }
  }
}
