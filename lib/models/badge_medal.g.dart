// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_medal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BadgeMedal _$$_BadgeMedalFromJson(Map json) => _$_BadgeMedal(
      id: json['id'] as int?,
      org: json['org'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      validationCategory: json['validationCategory'] as int?,
      owned: json['owned'] as bool?,
    );

Map<String, dynamic> _$$_BadgeMedalToJson(_$_BadgeMedal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org': instance.org,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'validationCategory': instance.validationCategory,
      'owned': instance.owned,
    };
