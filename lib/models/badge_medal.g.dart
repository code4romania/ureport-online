// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_medal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BadgeMedal _$$_BadgeMedalFromJson(Map json) => _$_BadgeMedal(
      id: json['id'] as int?,
      badgeType: json['badgeType'] == null
          ? null
          : BadgeType.fromJson(
              Map<String, dynamic>.from(json['badgeType'] as Map)),
      user: json['user'] as int?,
      offeredOn: json['offeredOn'] == null
          ? null
          : DateTime.parse(json['offeredOn'] as String),
    );

Map<String, dynamic> _$$_BadgeMedalToJson(_$_BadgeMedal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badgeType': instance.badgeType?.toJson(),
      'user': instance.user,
      'offeredOn': instance.offeredOn?.toIso8601String(),
    };

_$_BadgeType _$$_BadgeTypeFromJson(Map json) => _$_BadgeType(
      id: json['id'] as int?,
      org: json['org'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      itemCategory: json['itemCategory'] as int?,
    );

Map<String, dynamic> _$$_BadgeTypeToJson(_$_BadgeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org': instance.org,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'itemCategory': instance.itemCategory,
    };
