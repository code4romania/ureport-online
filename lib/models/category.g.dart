// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map json) => _$_Category(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$_Result _$$_ResultFromJson(Map json) => _$_Result(
      image_url: json['image_url'] as String?,
      name: json['name'] as String?,
      created_on: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      modified_on: json['modified_on'] == null
          ? null
          : DateTime.parse(json['modified_on'] as String),
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => Story.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'image_url': instance.image_url,
      'name': instance.name,
      'created_on': instance.created_on?.toIso8601String(),
      'modified_on': instance.modified_on?.toIso8601String(),
      'stories': instance.stories?.map((e) => e.toJson()).toList(),
    };

_$_Story _$$_StoryFromJson(Map json) => _$_Story(
      id: json['id'] as int?,
      title: json['title'] as String?,
      featured: json['featured'] as bool?,
      summary: json['summary'] as String?,
      videoId: json['videoId'] as String?,
      audioLink: json['audioLink'],
      tags: json['tags'] as String?,
      org: json['org'] as int?,
      images: json['images'] as List<dynamic>?,
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
