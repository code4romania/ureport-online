// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_medal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BadgeMedal _$$_BadgeMedalFromJson(Map json) => _$_BadgeMedal(
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

Map<String, dynamic> _$$_BadgeMedalToJson(_$_BadgeMedal instance) =>
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
      item_category: json['item_category'],
    );

Map<String, dynamic> _$$_BadgeTypeToJson(_$_BadgeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org': instance.org,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'item_category': instance.item_category,
    };
