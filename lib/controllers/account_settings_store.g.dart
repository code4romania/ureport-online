// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountSettingsStore on _AccountSettingsStoreBase, Store {
  late final _$localProfilePicAtom =
      Atom(name: '_AccountSettingsStoreBase.localProfilePic', context: context);

  @override
  String? get localProfilePic {
    _$localProfilePicAtom.reportRead();
    return super.localProfilePic;
  }

  @override
  set localProfilePic(String? value) {
    _$localProfilePicAtom.reportWrite(value, super.localProfilePic, () {
      super.localProfilePic = value;
    });
  }

  late final _$remoteprofilePicAtom = Atom(
      name: '_AccountSettingsStoreBase.remoteprofilePic', context: context);

  @override
  String? get remoteprofilePic {
    _$remoteprofilePicAtom.reportRead();
    return super.remoteprofilePic;
  }

  @override
  set remoteprofilePic(String? value) {
    _$remoteprofilePicAtom.reportWrite(value, super.remoteprofilePic, () {
      super.remoteprofilePic = value;
    });
  }

  late final _$resultMessageAtom =
      Atom(name: '_AccountSettingsStoreBase.resultMessage', context: context);

  @override
  String? get resultMessage {
    _$resultMessageAtom.reportRead();
    return super.resultMessage;
  }

  @override
  set resultMessage(String? value) {
    _$resultMessageAtom.reportWrite(value, super.resultMessage, () {
      super.resultMessage = value;
    });
  }

  late final _$saveProfileAsyncAction =
      AsyncAction('_AccountSettingsStoreBase.saveProfile', context: context);

  @override
  Future<void> saveProfile() {
    return _$saveProfileAsyncAction.run(() => super.saveProfile());
  }

  late final _$changeUsernameAsyncAction =
      AsyncAction('_AccountSettingsStoreBase.changeUsername', context: context);

  @override
  Future<void> changeUsername() {
    return _$changeUsernameAsyncAction.run(() => super.changeUsername());
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_AccountSettingsStoreBase.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$uploadPictureAsyncAction =
      AsyncAction('_AccountSettingsStoreBase.uploadPicture', context: context);

  @override
  Future<void> uploadPicture() {
    return _$uploadPictureAsyncAction.run(() => super.uploadPicture());
  }

  @override
  String toString() {
    return '''
localProfilePic: ${localProfilePic},
remoteprofilePic: ${remoteprofilePic},
resultMessage: ${resultMessage}
    ''';
  }
}
