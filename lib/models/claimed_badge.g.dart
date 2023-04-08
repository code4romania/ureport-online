// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claimed_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClaimedBadge _$$_ClaimedBadgeFromJson(Map json) => _$_ClaimedBadge(
      id: json['id'] as int?,
      badge_type: json['badge_type'] == null
          ? null
          : BadgeType.fromJson(
              Map<String, dynamic>.from(json['badge_type'] as Map)),
      user: json['user'] as int?,
      offered_on: json['offered_on'] == null
          ? null
          : DateTime.parse(json['offered_on'] as String),
    );

Map<String, dynamic> _$$_ClaimedBadgeToJson(_$_ClaimedBadge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badge_type': instance.badge_type?.toJson(),
      'user': instance.user,
      'offered_on': instance.offered_on?.toIso8601String(),
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
