// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map json) => _$_Profile(
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      profile: json['profile'] == null
          ? null
          : ProfileClass.fromJson(
              Map<String, dynamic>.from(json['profile'] as Map)),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profile': instance.profile?.toJson(),
    };

_$_ProfileClass _$$_ProfileClassFromJson(Map json) => _$_ProfileClass(
      contactUuid: json['contactUuid'] as String?,
      image: json['image'],
    );

Map<String, dynamic> _$$_ProfileClassToJson(_$_ProfileClass instance) =>
    <String, dynamic>{
      'contactUuid': instance.contactUuid,
      'image': instance.image,
    };
