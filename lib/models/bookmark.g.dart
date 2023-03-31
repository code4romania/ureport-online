// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookmark _$$_BookmarkFromJson(Map json) => _$_Bookmark(
      id: json['id'] as int?,
      user: json['user'] as int?,
      story: json['story'] == null
          ? null
          : Story.fromJson(Map<String, dynamic>.from(json['story'] as Map)),
    );

Map<String, dynamic> _$$_BookmarkToJson(_$_Bookmark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'story': instance.story?.toJson(),
    };

_$_Story _$$_StoryFromJson(Map json) => _$_Story(
      id: json['id'] as int?,
      title: json['title'] as String?,
      featured: json['featured'] as bool?,
      summary: json['summary'] as String?,
      videoId: json['videoId'],
      audioLink: json['audioLink'],
      tags: json['tags'],
      org: json['org'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      created_on: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'featured': instance.featured,
      'summary': instance.summary,
      'videoId': instance.videoId,
      'audioLink': instance.audioLink,
      'tags': instance.tags,
      'org': instance.org,
      'images': instance.images,
      'created_on': instance.created_on?.toIso8601String(),
    };
