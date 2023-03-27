// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_long.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryLong _$$_StoryLongFromJson(Map json) => _$_StoryLong(
      id: json['id'] as int?,
      title: json['title'] as String?,
      featured: json['featured'] as bool?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
      written_by: json['written_by'] as String?,
      videoId: json['videoId'],
      audioLink: json['audioLink'],
      tags: json['tags'],
      org: json['org'] as int?,
      images: json['images'] as List<dynamic>?,
      category: json['category'] == null
          ? null
          : Category.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_StoryLongToJson(_$_StoryLong instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'featured': instance.featured,
      'summary': instance.summary,
      'content': instance.content,
      'written_by': instance.written_by,
      'videoId': instance.videoId,
      'audioLink': instance.audioLink,
      'tags': instance.tags,
      'org': instance.org,
      'images': instance.images,
      'category': instance.category?.toJson(),
      'createdOn': instance.createdOn?.toIso8601String(),
    };

_$_Category _$$_CategoryFromJson(Map json) => _$_Category(
      imageUrl: json['imageUrl'],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };
