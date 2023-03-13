// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    ProfileClass? profile,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class ProfileClass with _$ProfileClass {
  const factory ProfileClass({
    String? contactUuid,
    dynamic image,
  }) = _ProfileClass;

  factory ProfileClass.fromJson(Map<String, dynamic> json) =>
      _$ProfileClassFromJson(json);
}
